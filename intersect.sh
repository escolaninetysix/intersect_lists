#!/bin/bash
if [ -f "$1" ]; then
  cp "$1" temp1.txt
else
  echo "needs 2 file arguments"
  echo "usage:"
  echo "./intersect file1 file2"
  exit 1
fi
if [ -f "$2" ]; then
  cp "$2" temp2.txt
else
  echo "needs 2 file arguments"
  echo "usage:"
  echo "./intersect file1 file2"
  exit 1
fi
cat temp1.txt | sort | uniq > temp1clean.txt
cat temp2.txt | sort | uniq > temp2clean.txt
cat temp1clean.txt temp2clean.txt | sort | uniq -d > tempintersect.txt
echo "in common between $1 and $2:"
cat temp1clean.txt temp2clean.txt | sort | uniq -d | wc -l
cat temp1clean.txt tempintersect.txt | sort | uniq -u > temp1unique.txt
echo "only found in $1:"
cat temp1clean.txt tempintersect.txt | sort | uniq -u | wc -l
cat temp2clean.txt tempintersect.txt | sort | uniq -u > temp2unique.txt
echo "only found in $2:"
cat temp2clean.txt tempintersect.txt | sort | uniq -u | wc -l
exit 0
