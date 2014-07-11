library verilog;
use verilog.vl_types.all;
entity clonador is
    port(
        \in\            : in     vl_logic;
        \out\           : out    vl_logic_vector(7 downto 0)
    );
end clonador;
