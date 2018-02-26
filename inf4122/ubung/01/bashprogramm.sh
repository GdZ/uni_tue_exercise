#!/bin/bash

for ((I=0; $I<50; I++))
do
  man gcc >> src/gcc.man;
done
