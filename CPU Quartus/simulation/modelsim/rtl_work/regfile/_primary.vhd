library verilog;
use verilog.vl_types.all;
entity regfile is
    port(
        clk             : in     vl_logic;
        we3             : in     vl_logic;
        ra1             : in     vl_logic_vector(3 downto 0);
        ra2             : in     vl_logic_vector(3 downto 0);
        wa3             : in     vl_logic_vector(3 downto 0);
        wd3             : in     vl_logic_vector(7 downto 0);
        rd1             : out    vl_logic_vector(7 downto 0);
        rd2             : out    vl_logic_vector(7 downto 0)
    );
end regfile;
