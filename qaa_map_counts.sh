#!/bin/bash
#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=bgmp               #REQUIRED: which partition to use
#SBATCH --cpus-per-task=4                 #optional: number of cpus, default is 1
#SBATCH --mem=16GB                        #optional: amount of memory, default is 4GB
#SBATCH --output=/projects/bgmp/apwat/bioinfo/Bi623/QAA/logs/mapcounts_out_%j.log
#SBATCH --error=/projects/bgmp/apwat/bioinfo/Bi623/QAA/logs/mapcounts_err_%j.log

conda activate QAA
cd /projects/bgmp/apwat/bioinfo/Bi623/QAA/

/usr/bin/time -v ./sam_parser.py -f ./star/fAligned.out.sam
/usr/bin/time -v ./sam_parser.py -f ./star/bAligned.out.sam
