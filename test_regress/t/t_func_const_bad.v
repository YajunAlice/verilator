// DESCRIPTION: Verilator: Verilog Test module
//
// This file ONLY is placed into the Public Domain, for any use,
// without warranty, 2009 by Wilson Snyder.

module t;

   // Speced ignored: system calls.  I think this is nasty, so we error instead.
   // Speced Illegal: inout/output/ref not allowed
   localparam B1 = f_bad_output(1,2);
   function integer f_bad_output(input [31:0] a, output [31:0] o);
      f_bad_output = 0;
   endfunction
   // Speced Illegal: void
   // Speced Illegal: dotted 
   localparam EIGHT = 8;
   localparam B2 = f_bad_dotted(2);
   function integer f_bad_dotted(input [31:0] a);
      f_bad_dotted = t.EIGHT;
   endfunction
   // Speced Illegal: ref to non-local var
   integer modvar;
   localparam B3 = f_bad_nonparam(3);
   function integer f_bad_nonparam(input [31:0] a);
      f_bad_nonparam = modvar;
   endfunction
   // Speced Illegal: needs constant function itself
endmodule