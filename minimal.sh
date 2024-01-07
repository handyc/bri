#!/bin/bash
framerate=1
randomcall=0
monstertrigger=20
rt=20
frame=(
"  c   c   c   c   c   c   c         RRRRRLLL      c   c   c   c   c   c   c   \n"
" c   c   c   c   c   c   c     d   d RRRRR L   d     c   c   c   c   c   c   c\n"
"   c   c   c   c   c   c     d   d   dRRRd   d   d     c   c   c   c   c   c  \n"
" c   c   c   c   c   c     d   d   d  RRR  d   d   d     c   c   c   c   c   c\n"
"   c   c   c   c   c     d   d   d   dRRRd   d   d   d     c   c   c   c   c  \n"
"                       d   d   d   d  RRR  d   d   d   d                      \n"
"   b   b   b   b   b     d   d   d   RRRRR   d   d   d     b   b   b   b   b  \n"
" b   b   b   b   b   b     d   d   d   d   d   d   d     b   b   b   b   b   b\n"
"   b   b   b   b   b   b     d   d   d   d   d   d     b   b   b   b   b   b  \n"
" b   b   b   b   b   b   b     d   d   d   d   d     b   b   b   b   b   b   b\n"
)
quack () { for i in $( seq 0 "${#frame[@]}" ) ; do printf "${frame[$i]}" ; done }
quack;
i=1; ucursor=0; while [ "$key" != "q" ] ; do
randomcall=$((RANDOM % $((rt+1))))
if (( $SECONDS > $((1 / framerate)) )) ; then quack; SECONDS=0; fi
if (( $randomcall < $((monstertrigger)) )) ; then echo "monster"; fi
read -sn1 -t 1 key # 1 char (not delimiter), silent
  case "$key" in
    d) # d: date
        echo $(date);;
    q) # q: quit
        echo Bye!
        exit;;
   esac
done
