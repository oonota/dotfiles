#!/usr/bin/perl
$latex	= 'platex -synctex=1 -halt-on-error -interaction=batchmode %O %S';
$bibtex	= 'pbibtex %O %B';
$dvipdf = 'dvipdfmx %O %S';
$pdf_mode = 3; #use dvipdf
$pdf_update_command = 'open %S';
$max_repeat = 5;
$pdf_previewer = "open -ga /Applications/Skim.app";
$pvc_view_file_via_temporary = 0;
