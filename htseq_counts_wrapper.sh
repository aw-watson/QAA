#!/bin/bash
#SBATCH --account=bgmp                    #REQUIRED: which account to use
#SBATCH --partition=bgmp               #REQUIRED: which partition to use
#SBATCH --cpus-per-task=1                 #optional: number of cpus, default is 1
#SBATCH --mem=16GB                        #optional: amount of memory, default is 4GB
#SBATCH --output=/projects/bgmp/apwat/bioinfo/Bi623/QAA/logs/htseq_out_%j.log
#SBATCH --error=/projects/bgmp/apwat/bioinfo/Bi623/QAA/logs/htseq_err_%j.log

conda activate QAA

cd /projects/bgmp/apwat/bioinfo/Bi623/QAA/htseq

/usr/bin/time -v htseq-count --stranded=yes \
../star/bAligned.out.sam ../star/Mus_musculus.GRCm39.110.chr.gtf \
>./both_counts_stranded.txt

/usr/bin/time -v htseq-count --stranded=reverse \
../star/bAligned.out.sam ../star/Mus_musculus.GRCm39.110.chr.gtf \
>./both_counts_reverse_stranded.txt

/usr/bin/time -v htseq-count --stranded=yes \
../star/fAligned.out.sam ../star/Mus_musculus.GRCm39.110.chr.gtf \
>./fox_counts_stranded.txt


/usr/bin/time -v htseq-count --stranded=reverse \
../star/fAligned.out.sam ../star/Mus_musculus.GRCm39.110.chr.gtf \
>./fox_counts_reverse_stranded.txt