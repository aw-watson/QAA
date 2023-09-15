#!/usr/bin/env python
import argparse

def get_args():
    parser = argparse.ArgumentParser(description = "Count mapped and unmapped reads from a sam file. Prints output.")
    parser.add_argument("-f", "--filename", help="SAM file", required = True)
    return parser.parse_args()

mapped_reads: int = 0
unmapped_reads: int = 0
args = get_args()

with open(args.filename, 'rt') as rsam:
    while True:
        line: str = rsam.readline()
        if not line:
            break
        if line.startswith("@"):
            continue
        sam_fields: list = line.split("\t")
        flag:int = int(sam_fields[1])
        if((flag & 256) == 256): #ignore secondary alignments
            continue
        if((flag & 4) != 4): #mapped
            mapped_reads += 1
        else:
            unmapped_reads += 1

print(f"Mapped Reads: {mapped_reads}\nUnmapped Reads: {unmapped_reads}")
