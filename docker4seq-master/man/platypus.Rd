% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/platypus.R
\name{platypus}
\alias{platypus}
\title{Platypus analysis NOT READY TO GO ON STABLE missing test set}
\usage{
platypus(
  group = c("sudo", "docker"),
  data.folder = getwd(),
  scratch.folder,
  pathRef,
  nameRef,
  threads,
  GQ,
  minSampGQ,
  NR,
  minSampNR,
  NV,
  minSampNV,
  normal_samples,
  GT_normal,
  minSampGT_normal,
  tumoral_samples,
  GT_tumoral,
  minSampGT_tumoral,
  stringent_filter = 0,
  annotation = c("hg19", "mm10")
)
}
\arguments{
\item{group, }{a character string. Two options: sudo or docker, depending to which group the user belongs}

\item{data.folder, }{a character string indicating the folder where bams and vcf files are located and where output will be written}

\item{scratch.folder, }{a character string indicating the path of the scratch folder}

\item{pathRef, }{Path of the foldert that contains the fasta file of the genome}

\item{nameRef, }{name of the fasta file inside pathRef, the fastq has to be indexed with samtools faidx}

\item{threads, }{a number indicating the number of cores to be used from the application}

\item{GQ, }{min GQ value to consider (extreme included)}

\item{minSampGQ, }{min number of samples with GQ value (extreme included), usually we start with 85\% of the samples}

\item{NR, }{min NR value to consider (extreme included), the number of reads covering the SNV region}

\item{minSampNR, }{min number of samples with NR value (extreme included), usually we start with 85\% of the samples}

\item{NV, }{min NV value to consider (extreme included), the n of reads with the SNV}

\item{minSampNV, }{min number of samples with NV value (extreme included)}

\item{normal_samples, }{string with names (group names of bam files) of normal samples separated by hash, write NULL if you do not want to use GT filter in normal samples}

\item{GT_normal, }{GT value in normal samples to consider, type "NO" if you do not want to use this filter, else e.g. you might use 0/0}

\item{minSampGT_normal, }{min number of normal samples with GT value}

\item{tumoral_samples, }{string with names (group names of bam files) of tumoral samples separated by &, write NULL if you do not want to use GT filter in normal samples}

\item{GT_tumoral, }{GT value in tumoral samples to consider, type "NO" if you do not want to use this filter. Type e.g. 0/0 if you do not want to consider this genotype.}

\item{minSampGT_tumoral, }{min number of tumoral samples in which the GT value is NOT present}

\item{stringent_filter, }{To enable the filter (it keeps only the variants with "PASS" value or the variants that have only the "alleleBias" value) use 1 or 0 to disable it}

\item{annotation, }{hg19 and mm10 are actually available for the annotation of the detected SNVs}
}
\description{
This function executes Platypus: A Haplotype-Based Variant Caller For Next Generation Sequence Data. Platypus requires as input bam and bai files. In case vcf.gz and vcf.idx files are located in the bam folder  platypus will use only those positions for SNV calling
}
\examples{
\dontrun{
    #running platypus with some threshold provided by sottoriva analysis
 platypus(group="docker", data.folder="/archive/home/rcaloger/data/platypus_tests/hg19UCSC", 
        scratch.folder="/scratch/users/rcaloger/", pathRef="/archive/home/rcaloger/hg19_exome", 
        nameRef="hg19_clean.fasta", threads=96, GQ=10, minSampGQ=2, NR=10, minSampNR=2, NV=3, 
        minSampNV=1, normal_samples="475blood", GT_normal="0/0", 
        minSampGT_normal=1, tumoral_samples="1864p1#1864p22", GT_tumoral="0/0", 
        minSampGT_tumoral=1, stringent_filter=0, annotation="hg19")
 platypus(group="docker", data.folder="/archive/home/rcaloger/data/platypus_tests/hg19ENSEMBL", 
        scratch.folder="/scratch/users/rcaloger/", pathRef="/archive/home/rcaloger/hg19star", 
        nameRef="genome.fa", threads=96,GQ=10, minSampGQ=2, NR=10, minSampNR=2, NV=3, 
        minSampNV=1, normal_samples="5275001-HS", GT_normal="0/0", 
        minSampGT_normal=1, tumoral_samples="5275001-LSG1#5275001-LSGIII", 
        GT_tumoral="0/0", minSampGT_tumoral=1, stringent_filter=0, annotation="hg19")
 platypus(group="docker", data.folder="/archive/home/rcaloger/data/platypus_tests/mm10ENSEMBL", 
        scratch.folder="/scratch/users/rcaloger/", pathRef="/archive/home/rcaloger/mm10star", 
        nameRef="genome.fa", threads=96, GQ=10, minSampGQ=2, NR=10, minSampNR=2, NV=3, 
        minSampNV=1, normal_samples="MAMBO43", GT_normal="0/0", 
        minSampGT_normal=1, tumoral_samples="MAMBO43TRT#MAMBO43TRNT", GT_tumoral="0/0", 
        minSampGT_tumoral=1, stringent_filter=0, annotation="mm10")
}
}
\author{
Riccardo Panero, riccardo.panero[at]gmail[dot]com, Bioinformatics and Genomics unit, University of Torino Italy
}
