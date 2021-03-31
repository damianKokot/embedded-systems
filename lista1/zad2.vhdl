--  Hello world program
use std.textio.all; -- Imports the standard textio package.

--  Defines a design entity, without any ports.
entity hello_world is
end hello_world;

architecture behaviour of hello_world is
begin
  process
    variable l : line;
    variable my_line : line;
  begin
    write (l, String'("Hello world!"));
    writeline (output, l);

    readline(input, my_line);
    writeline(output, my_line);
    wait;
  end process;
end behaviour;
