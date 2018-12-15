-- SHA256 Hashing Module
-- Kristian Klomsten Skordal <kristian.skordal@wafflemail.net>

-- This module only operates on full 512 bit blocks. Any input data must have
-- been previously padded.该模块仅对完整的512位块进行操作。任何输入数据之前都必须经过填充。

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.sha256_types.all;
use work.sha256_constants.all;
use work.sha256_functions.all;

entity sha256 is
	port(
		clk    : in std_logic;
		reset  : in std_logic;
		enable : std_logic := '1';

		ready  : out std_logic; -- 准备好处理下一个块
		update : in  std_logic; -- 开始处理下一个块

		-- 连接到输入缓冲区;我们假设出现了块RAM
		-- 有效数据地址变更后的周期:
		word_address : out std_logic_vector(3 downto 0); -- Word 0 .. 15
		word_input   : in std_logic_vector(31 downto 0);

		-- 中间/最后的散列值:
		hash_output : out std_logic_vector(255 downto 0);

		-- 调试端口，用于仿真; leave unconnected:
		debug_port : out std_logic_vector(31 downto 0)
	);
end entity sha256;

architecture behaviour of sha256 is

	-- The module's state machine:
	type state_type is (IDLE, BUSY, FINAL);
	signal state : state_type;

	-- The expanded message blocks, W_j:
	signal W : expanded_message_block_array;
	signal current_w : std_logic_vector(31 downto 0);

	-- Final hash values:
	signal h0, h1, h2, h3, h4, h5, h6, h7 : std_logic_vector(31 downto 0);

	-- Intermediate hash values:
	signal a, b, c, d, e, f, g, h : std_logic_vector(31 downto 0);

	-- Current iteration:
	signal current_iteration : std_logic_vector(5 downto 0);
begin

	word_address <= current_iteration(3 downto 0)
		when (current_iteration and b"110000") = b"000000"
		else (others => '0');

	hash_output <= h0 & h1 & h2 & h3 & h4 & h5 & h6 & h7;
	ready <= '1' when state = IDLE else '0';
	debug_port <= (others => '0'); -- This is currently not used, yay :-)

	hasher: process(clk, reset, enable)
	begin
		if reset = '1' then
			reset_intermediate(h0, h1, h2, h3, h4, h5, h6, h7);
			current_iteration <= (others => '0');
			state <= IDLE;
		elsif rising_edge(clk) and enable = '1' then
			case state is
				when IDLE =>
					-- If new data is available, start hashing it:
					if update = '1' then
						a <= h0;
						b <= h1;
						c <= h2;
						d <= h3;
						e <= h4;
						f <= h5;
						g <= h6;
						h <= h7;
						current_iteration <= (others => '0');
						state <= BUSY;
					end if;
				when BUSY =>
					-- Load a word of data and store it into the expanded message schedule:
					W(index(current_iteration)) <= schedule(word_input, W, current_iteration);

					-- Run an interation of the compression function:
					compress(a, b, c, d, e, f, g, h,
						schedule(word_input, W, current_iteration),
						constants(index(current_iteration)));

					if current_iteration = b"111111" then
						state <= FINAL;
					else
						current_iteration <= std_logic_vector(unsigned(current_iteration) + 1);
					end if;
				when FINAL =>
					h0 <= std_logic_vector(unsigned(a) + unsigned(h0));
					h1 <= std_logic_vector(unsigned(b) + unsigned(h1));
					h2 <= std_logic_vector(unsigned(c) + unsigned(h2));
					h3 <= std_logic_vector(unsigned(d) + unsigned(h3));
					h4 <= std_logic_vector(unsigned(e) + unsigned(h4));
					h5 <= std_logic_vector(unsigned(f) + unsigned(h5));
					h6 <= std_logic_vector(unsigned(g) + unsigned(h6));
					h7 <= std_logic_vector(unsigned(h) + unsigned(h7));
					state <= IDLE;
			end case;
		end if;
	end process hasher;

end architecture behaviour;
