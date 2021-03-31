entity gate is
    -- ports as described in task description
    port (a, b, c : in bit; x, y : out bit);
end gate;

architecture rtl of gate is
    signal u1 : bit;
    signal u2 : bit;
    signal u3 : bit;
    signal u4 : bit;
    signal u5 : bit;

    begin
        u1 <= a or b;
        u2 <= b nor c;
        u3 <= a xor c;
        u4 <= (not u1) nor (not u2);
        u5 <= (not u2) and (not u3);

        -- kind of overkill
        x <= u4;
        y <= u5;
    end rtl;
