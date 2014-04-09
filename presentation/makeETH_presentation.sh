#! /bin/sh

#============================================#
# (c) 2005 Robert Mach (rmach@ethz.ch)	     #
# Chair of Systems Design, ETH Zurich	     #
# Kreuzplatz 5, CH-8032 Zurich		     #
#                                            #
# All rights reserved. You can modify and    #
# distribute this file provided that the     #
# above copyright notice stays intact.       #
#                                            #
#============================================#

file=$1

echo $file | egrep -q '.tex'
# $? is 0 if true, else 1;
if [ $? = "0" ] ; then
echo "File is a tex-file"
else
echo "$file is not a tex-file. Exiting!"
exit 1;
fi

core=`echo "$file" | perl -e '$name=<STDIN>; $name =~ m/(.*?)\.tex$/ ; print $1;'`

#echo $core

#latex $file
#dvips -Ppdf -o $core-pics.ps $core.dvi
#ps2pdf $core-pics.ps $core-pics.pdf
#rm -f $core-pics.ps

#pdflatex '\PassOptionsToPackage{pdftex,bookmarksopen,bookmarksnumbered}{hyperref} \input{'$file'}'
pdflatex '\PassOptionsToPackage{pdftex,first,handout,notes,last,bookmarksopen,bookmarksnumbered}{hyperref} \input{'$file'}'

rm -f $core.aux $core.dvi $core.log $core.nav $core.out $core.snm $core.toc $core-pics.pdf


echo ""
echo ""
echo ""
echo "======================================================"
echo " You can now view your presentation with:             "
echo " acroread $core.pdf                                   "
echo ""
echo " If you intended to create a HANDOUT, you might want  "
echo " include 'handout' and 'notes' in the                 "
echo " \documentclass[handout,notes]{beamer}                "
echo " preamble. Then, compile the tex-file again using this"
echo " script.                                              "
echo ""
echo " After this, proceed as follows:                      "
echo " pdflatex build-handout.tex                         "
echo " At the pdf-input prompt insert: $core.pdf           "
echo "======================================================"