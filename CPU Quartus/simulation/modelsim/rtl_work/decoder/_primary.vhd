library verilog;
use verilog.vl_types.all;
entity decoder is
    port(
        \in\            : in     vl_logic_vector(1 downto 0);
        e0              : out    vl_logic;
        e1              : out    vl_logic;
        e2              : out    vl_logic;
        e3              : out    vl_logic
    );
end decoder;
