#!/usr/bin/perl
if (!$::Driver) { use FindBin; exec("$FindBin::Bin/bootstrap.pl", @ARGV, $0); die; }
# DESCRIPTION: Verilator: Verilog Test driver/expect definition
#
# Copyright 2003 by Wilson Snyder. This program is free software; you can
# redistribute it and/or modify it under the terms of either the GNU
# Lesser General Public License Version 3 or the Perl Artistic License
# Version 2.0.

compile (
	 v_flags2 => ["--lint-only"],
	 fails=>1,
	 expect=>
q{%Error: t/t_func_const_bad.v:\d+: Expecting expression to be constant, but can't convert a FUNCREF 'f_bad_output' to constant.
%Error: t/t_func_const_bad.v:\d+: Expecting expression to be constant, but can't convert a FUNCREF 'f_bad_dotted' to constant.
%Error: t/t_func_const_bad.v:\d+: Expecting expression to be constant, but can't convert a FUNCREF 'f_bad_nonparam' to constant.
%Error: Exiting due to.*},
	 );

ok(1);
1;