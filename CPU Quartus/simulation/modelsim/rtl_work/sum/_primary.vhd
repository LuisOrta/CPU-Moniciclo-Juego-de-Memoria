library verilog;
use verilog.vl_types.all;
entity sum is
    port(
        a               : in     vl_logic_vector(9 downto 0);
        b               : in     vl_logic_vector(9 downto 0);
        y               : out    vl_logic_vector(9 downto 0)
    );
end sum;
