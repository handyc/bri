#!/bin/bash
framerate=1
randomcall=0
monstertrigger=20
rt=100

xman=40
yman=7

string1="  c   2   c   c   c   c   c"
string2=" c   c   5   5   5   c   c"
string3="   c   5   5   5   5   c"
string4=" c   c   5   5   5   c"
string5="   c   c   c   c   c"

inventory=(
"bee"
"tree"
"sword of chaos"
)

sframe=(
"    a       a       a       a               a       a       a       a      \n"
"a       a       a       a       a       a       a       a       a       a  \n"
"    a       a       a       a               a       a       a       a      \n"
"        a       a       a                       a       a       a          \n"
"            a       a               a               a       a               a \n"
"a               a               a       a               a               a\n"
"    a                       a       a       a                       a       a\n"
"a       a               a       a       a       a               a       a\n"
"    a       a       a       a       a       a       a       a       a       a\n"
"a       a               a       a       a       a               a       a    \n"
"    a       a       a       a       a       a       a       a       a       a\n"
"a       a               a       a       a       a               a       a    \n"
"    a       a       a       a       a       a       a       a       a       a\n"
"a       a               a       a       a       a               a       a    \n"
"    a       a       a       a       a       a       a       a       a       a\n"
"a       a               a       a       a       a               a       a    \n"
"    a       a       a       a       a       a       a       a       a       a\n"
"a       a               a       a       a       a               a       a    \n"
"    a                       a       a       a                       a       a\n"
"a               a               a       a               a               a    \n"
"            a       a               a               a       a               a\n"
"        a       a       a                       a       a       a            \n"
"    a       a       a       a               a       a       a       a        \n"
"a       a       a       a       a       a       a       a       a       a    \n"
"    a       a       a       a               a       a       a       a        \n"
)

wframe=(
"     -       -       a       -       -  Africa\n"
" -       -       -       -       -      North America\n"
"     K       K       K       K       K  South America\n"
" a       a       a       a       a      Europe\n"
"     K       K       K       K       K  Asia\n"
" K       K       K       K       K      Antarctica\n"
"     a       a       a       a       a  Australia/Oceania\n"
" K       K       K       K       K     \n"
"     -       -       -       -       - \n"
" -       -       -       a       -     \n"
)

mframe=(
"$string1         RRRRRLLL      c   c   c   c   c   c   c   \n"
"$string2     d   d RRRRR L   d     c   c   c   c   c   c   c\n"
"$string3     d   d   dR0Rd   d   d     c   c   c   c   c   c  \n"
"$string4     d   d   d  R0R  d   d   d     c   c   c   c   c   c\n"
"$string5     d   d   d   dR0Rd   d   d   d     c   c   c   c   c  \n"
"                       d   d   d   d  RRR  d   d   d   d                      \n"
"   b   b   b   b   b     d   d   d   RRRRR   d   d   d     b   b   b   b   b  \n"
" b   b   b   I   b   b     d   d   d   d   d   d   d     b   b   b   b   b   b\n"
"   b   b   I   I   b   b     d   d   d   d   d   d     b   b   b   b   b   b  \n"
" b   b   I   I   b   b   b     d   d   d   d   d     b   b   b   b   b   b   b\n"
)
mframe2=(
"   c   c   I   I   I   c   c                       c   c   c   c   c   c   c   \n"
" c   c   I   I   I   c   c     d   d   d   d   d     c   c   c   c   c   c   c\n"
"   c   c   I   c   c   c     d   d   d   d   d   d     c   c   c   c   c   c  \n"
" c   c   c   c   c   c     d   d   d   6   6   d   d     c   c   c   c   c   c\n"
"   c   c   c   c   c     d   d   d   d   4   d   d   d     c   c   c   c   c  \n"
"                       d   d   d   9   2   2   9   d   d                      \n"
"   b   b   b   b   b     d   d   d   d   0   d   d   d     b   b   b   b   b  \n"
" b   b   b   b   b   b     d   d   d   F   F   d   d     b   b   K   K   b   b\n"
"   b   b   b   b   b   b     d   d   d   F   d   d     b   b   K   K   K   b  \n"
" b   b   b   b   b   b   b     d   d   F   F   d     b   b   b   K   K   b   b\n"
)
mframe3=(
"   c   c   c   c   c   c   c                       c   c   c   K   K   K   c   \n"
" c   c   c   c   c   c   c     d   d   d   d   d     c   c   c   K   K   K   c\n"
"   c   c   c   c   c   c     d   d   d   d   d   d     c   c   c   c   c   c  \n"
" c   c   c   c   c   c     d   d   d   d   d   d   d     c   c   c   c   c   c\n"
"   c   c   c   c   c     d   d   d   d   d   d   d   d     c   c   c   c   c  \n"
"                       d   d   d   d   d   d   d   d   d                      \n"
"   b   b   b   b   b     d   d   d   d   d   d   d   d     b   b   b   b   b  \n"
" b   b   b   b   b   b     d   d   d   d   d   d   d     b   b   b   b   b   b\n"
"   b   b   b   b   b   b     d   d   d   d   d   d     b   b   b   b   b   b  \n"
" b   b   b   b   b   b   b     d   d   d   d   d     b   b   b   b   b   b   b\n"
)
mframe4=(
"   c   c   c   c   c   c   c                       c   c   c   c   c   c   c   \n"
" c   c   c   c   c   c   c     d   d   d   d   d     c   c   c   c   c   c   c\n"
"   c   c   c   c   c   c     d   d   d   d   d   d     c   c   c   c   c   c  \n"
" c   c   c   c   c   c     d   d   d   d   d   d   d     c   c   c   c   c   c\n"
"   c   c   c   c   c     d   d   d   d   d   d   d   d     c   c   c   c   c  \n"
"                       d   d   d   d   d   d   d   d   d                      \n"
"   b   b   b   b   b     d   d   d   d   d   d   d   d     b   b   b   b   b  \n"
" b   b   b   b   b   b     d   d   d   d   d   d   d     b   b   b   b   b   b\n"
"   b   b   b   b   b   b     d   d   d   d   d   d     b   b   b   b   b   b  \n"
" b   b   b   b   b   b   b     d   d   d   d   d     b   b   b   b   b   b   b\n"
)
fmframe2=(
"   c   c   F   F   c   c   c         RR000LLL      c   c   c   c   c   c   c   \n"
" c   c   F   F   c   c   c     d   d R000R L   d     c   c   c   c   c   c   c\n"
"   c   c   F   F   c   c     d   d   d000d   d   d     c   c   c   c   c   c  \n"
" c   c   c   c   c   c     d   d   d  000  d   d   d     c   c   c   c   c   c\n"
"   c   c   c   c   c     d   d   d   d000d   d   d   d     c   c   c   c   c  \n"
"                       d   d   d   d  000  d   d   d   d                      \n"
"   b   b   b   b   b     d   d   d   R000R   d   d   d     b   b   b   b   b  \n"
" b   b   b   b   b   b     d   d   d   d   d   d   d     b   b   F   F   F   b\n"
"   b   b   b   b   b   b     d   d   d   d   d   d     b   b   F   F   F   b  \n"
" b   b   b   b   b   b   b     d   d   d   d   d     b   b   b   b   F   F   b\n"
)
fmframe3=(
"  c   c   F   F   c   c   c         R    L L      c   c   c   c   c   c   c   \n"
" c   c   F   F   c   c   c     d   d       L   d     c   c   c   c   c   c   c\n"
"   c   c   F   F   c   c     d   d   d   d   d   d     c   c   c   c   c   c  \n"
" c   c   c   c   c   c     d   d   d       d   d   d     c   c   c   c   c   c\n"
"   c   c   c   c   c     d   d   d   d   d   d   d   d     c   c   c   c   c  \n"
"                       d   d   d   d  0    d   d   d   d                      \n"
"   b   b   b   b   b     d   d   d   R   R   d   d   d     b   b   b   b   b  \n"
" b   b   b   b   b   b     d   d   d   d   d   d   d     b   b   F   F   F   b\n"
"   b   b   b   b   b   b     d   d   d   d   d   d     b   b   F   F   F   b  \n"
" b   b   b   b   b   b   b     d   d   d   d   d     b   b   b   b   F   F   b\n"
)
frame=(
"c  c   c   c   c   c   c   c                       c   c   c   c   c   c   c   \n"
" c   c   c   c   c   c   c     d   d   d   d   d     c   c   c   c   c   c   c\n"
"   c   c   c   c   c   c     d   d   d   d   d   d     c   c   c   c   c   c  \n"
" c   c   c   c   c   c     d   d   d   d   d   d   d     c   c   c   c   c   c\n"
"   c   c   c   c   c     d   d   d   d   d   d   d   d     c   c   c   c   c  \n"
"                       d   d   d   d   d   d   d   d   d                      \n"
"   b   b   b   b   b     d   d   d   d   d   d   d   d     b   b   b   b   b  \n"
" b   b   b   b   b   b     d   d   d   d   d   d   d     b   b   b   b   b   b\n"
"   b   b   b   b   b   b     d   d   d   d   d   d     b   b   b   b   b   b  \n"
" b   b   b   b   b   b   b     d   d   d   d   d     b   b   b   b   b   b   b\n"
)

inv () {
for i in $( seq 0 "${#inventory[@]}" ) ; do printf "${inventory[$i]}, " ; done
read -sn1 -t 10 key # 1 char (not delimiter), silent
}

wuack () {
for i in $( seq 0 "${#wframe[@]}" ) ; do printf "${wframe[$i]}" ; done
read -sn1 -t 10 key # 1 char (not delimiter), silent
}

lack () {
for i in $( seq 0 "${#sframe[@]}" ) ; do printf "${sframe[$i]}" ; done
read -sn1 -t 10 key # 1 char (not delimiter), silent
}

quack () {
for i in $( seq 0 "${#frame[@]}" ) ; do printf "${frame[$i]}" ; done
for i in $( seq 0 "${#frame[@]}" ) ; do printf "${frame[$i]}" ; done
for i in $( seq 0 "${#frame[@]}" ) ; do printf "${frame[$i]}" ; done
}

mquack () {
for i in $( seq 0 "${#mframe[@]}" ) ; do printf "${mframe[$i]}" ; done
for i in $( seq 0 "${#mframe2[@]}" ) ; do printf "${mframe2[$i]}" ; done
for i in $( seq 0 "${#mframe3[@]}" ) ; do printf "${mframe3[$i]}" ; done
}

full () {
quack;
SECONDS=0;
if (( $randomcall < $((monstertrigger)) )) ; then mquack; SECONDS=0; fi;


tput setaf 3; tput cup $((yman)) $((xman + 1)); echo "F";
tput setaf 3; tput cup $((yman + 1)) $((xman + 0)); echo "FFF";
tput setaf 3; tput cup $((yman + 2)) $((xman + 0)); echo "F F";
tput sgr0;

#tput setaf 3; tput cup 7 40; echo "F";
#tput setaf 3; tput cup 8 39; echo "FFF";
#tput setaf 3; tput cup 9 39; echo "F F"; tput sgr0;

#tput setaf 6; tput cup 23 0; echo $(date)" framerate: "$framerate" frame(s) per minute"; tput sgr0;

encount=$((RANDOM % 3));
#enx=$((RANDOM % 3));
#eny=$((RANDOM % 3));

enemies=$encount;
for i in $( seq 0 "$enemies" ); do
testx=$((RANDOM % 80));
testy=$((RANDOM % 21));
tput setaf 5; tput cup $((testy + 0)) $((testx + 1)); echo "F";
tput setaf 7; tput cup $((testy + 1)) $((testx + 0)); echo "FFF";
tput setaf 6; tput cup $((testy + 2)) $((testx + 0)); echo "F F";
tput sgr0; done;
tput setaf 1; tput cup 23 0; echo $(date)" framerate: "$framerate" frame(s) per minute"; tput sgr0;
}

full; i=1; ucursor=0; while [ "$key" != "q" ] ; do
if (( $SECONDS >= $(( ((60 / framerate )) )) )) ; then
randomcall=$((RANDOM % $((rt+1))))
full; fi;
read -sn1 -t 1 key # 1 char (not delimiter), silent
  case "$key" in
    a) framerate=$((framerate - 1)); if (( $framerate < 1 )) ; then framerate=1; fi; full;;
    s) framerate=$((framerate + 1)); if (( $framerate > 120 )) ; then framerate=120; fi; full;;
    w) wuack; full;;
    l) lack; full;;
    e) inv; full;;
    x) full;;
    h) xman=$((xman - 4)); if (( $xman < 1 )) ; then xman=1; fi;
       full;;
    k) xman=$((xman + 4));
       if (( $xman > 77 )) ; then xman=77; fi;
       full;;
    u) xman=$((xman - 2));
       yman=$((yman - 1));
       if (( $xman < 1 )) ; then xman=1; fi;
       if (( $yman < 0 )) ; then yman=0; fi;
       full;;
    i) # d: date
        xman=$((xman + 2)); yman=$((yman - 1));
        if (( $xman > 77 )) ; then xman=77; fi;
        if (( $yman < 0 )) ; then yman=0; fi;
        full;;
    n) # d: date
        xman=$((xman - 2)); yman=$((yman + 1));
        if (( $xman < 1 )) ; then xman=1; fi;
        if (( $yman > 22 )) ; then yman=22; fi;
        full;;
    m) # d: date
        xman=$((xman + 2)); yman=$((yman + 1));
        if (( $xman > 77 )) ; then xman=77; fi;
        if (( $yman > 22 )) ; then yman=22; fi;
        full;;
    d) echo $(date);;
    q) echo Bye!; exit;;
   esac
done
