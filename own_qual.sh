#!/bin/bash
#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=bgmp               #REQUIRED: which partition to use
#SBATCH --cpus-per-task=1                 #optional: number of cpus, default is 1
#SBATCH --mem=16GB                        #optional: amount of memory, default is 4GB
#SBATCH --output=/projects/bgmp/apwat/bioinfo/Bi623/QAA/logs/base_qual_out_%j.log
#SBATCH --error=/projects/bgmp/apwat/bioinfo/Bi623/QAA/logs/base_qual_err_%j.log

conda activate QAA

DIR="/projects/bgmp/apwat/bioinfo"

/usr/bin/time -v $DIR/Bi622/Demultiplex/Assignment-the-first/qual_dist.py \
    -f /projects/bgmp/shared/2017_sequencing/demultiplexed/10_2G_both_S8_L008_R1_001.fastq.gz \
    -o $DIR/Bi623/QAA/own_plots/10_2G_R1 \
    -l 10_2G_R1

/usr/bin/time -v $DIR/Bi622/Demultiplex/Assignment-the-first/qual_dist.py \
    -f /projects/bgmp/shared/2017_sequencing/demultiplexed/10_2G_both_S8_L008_R2_001.fastq.gz \
    -o $DIR/Bi623/QAA/own_plots/10_2G_R2 \
    -l 10_2G_R2

/usr/bin/time -v $DIR/Bi622/Demultiplex/Assignment-the-first/qual_dist.py \
    -f /projects/bgmp/shared/2017_sequencing/demultiplexed/31_4F_fox_S22_L008_R1_001.fastq.gz \
    -o $DIR/Bi623/QAA/own_plots/31_4F_R1 \
    -l 31_4F_R1

/usr/bin/time -v $DIR/Bi622/Demultiplex/Assignment-the-first/qual_dist.py \
    -f /projects/bgmp/shared/2017_sequencing/demultiplexed/31_4F_fox_S22_L008_R2_001.fastq.gz \
    -o $DIR/Bi623/QAA/own_plots/31_4F_R2 \
    -l 31_4F_R2
