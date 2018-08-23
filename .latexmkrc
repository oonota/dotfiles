#!/usr/bin/perl
$latex	= 'platex -halt-on-error %O %S';
$bibtex	= 'pbibtex %O %B';
$dvipdf = 'dvipdfmx %O %S';
$pdf_mode = 3; #use dvipdf
$pdf_update_method = 4;
#$pdf_update_command = 'open -ga /Applications/Skim.app %S';
$max_repeat = 5;
$pvc_view_file_via_temporary = 0;
$pdf_previewer = "open -ga /Applications/Skim.app";
