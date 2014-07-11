library verilog;
use verilog.vl_types.all;
entity read_reg is
    generic(
        WIDTH           : integer := 8
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        enable          : in     vl_logic;
        s_out           : in     vl_logic;
        s_inst          : in     vl_logic;
        d0              : in     vl_logic_vector;
        d1              : in     vl_logic_vector;
        q               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end read_reg;
