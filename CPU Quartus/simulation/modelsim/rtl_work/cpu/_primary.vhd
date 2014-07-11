library verilog;
use verilog.vl_types.all;
entity cpu is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        ent1            : in     vl_logic_vector(7 downto 0);
        ent2            : in     vl_logic_vector(7 downto 0);
        ent3            : in     vl_logic_vector(7 downto 0);
        ent4            : in     vl_logic_vector(7 downto 0);
        sal1            : out    vl_logic_vector(7 downto 0);
        sal2            : out    vl_logic_vector(7 downto 0);
        sal3            : out    vl_logic_vector(7 downto 0);
        sal4            : out    vl_logic_vector(7 downto 0);
        pco             : out    vl_logic_vector(9 downto 0)
    );
end cpu;
