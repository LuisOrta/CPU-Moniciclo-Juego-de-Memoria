library verilog;
use verilog.vl_types.all;
entity microc is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        s_inc           : in     vl_logic;
        s_inm           : in     vl_logic;
        we3             : in     vl_logic;
        s_out           : in     vl_logic;
        s_in            : in     vl_logic;
        s_inst          : in     vl_logic;
        s_rel           : in     vl_logic;
        op              : in     vl_logic_vector(2 downto 0);
        entrada1        : in     vl_logic_vector(7 downto 0);
        entrada2        : in     vl_logic_vector(7 downto 0);
        entrada3        : in     vl_logic_vector(7 downto 0);
        entrada4        : in     vl_logic_vector(7 downto 0);
        z               : out    vl_logic;
        opcode          : out    vl_logic_vector(5 downto 0);
        salida1         : out    vl_logic_vector(7 downto 0);
        salida2         : out    vl_logic_vector(7 downto 0);
        salida3         : out    vl_logic_vector(7 downto 0);
        salida4         : out    vl_logic_vector(7 downto 0);
        pco             : out    vl_logic_vector(9 downto 0)
    );
end microc;
