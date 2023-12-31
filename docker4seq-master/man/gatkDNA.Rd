% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gatkDna.R
\name{gatkDNA}
\alias{gatkDNA}
\title{Running realignment and recalibration, GATK}
\usage{
gatkDNA(
  group = c("sudo", "docker"),
  bam.folder = getwd(),
  scratch.folder = "/data/scratch",
  gatk.filename,
  genome.folder,
  threads = 1
)
}
\arguments{
\item{group, }{a character string. Two options: \code{"sudo"} or \code{"docker"}, depending to which group the user belongs}

\item{bam.folder, }{a character string indicating where bam files generated with bwa.R are located. In this folder should be loacted also the GATK file GenomeAnalysisTK-X.X-0.tar.bz2.}

\item{scratch.folder, }{a character string indicating the scratch folder where docker container will be mounted}

\item{gatk.filename, }{a character string for GenomeAnalysisTK-X.X-0.tar.bz2.}

\item{genome.folder, }{a character string indicating the folder where the indexed reference genome for bwa is located}

\item{threads, }{a number indicating the number of cores to be used from the application}
}
\value{
three files: dedup_reads.bam, which is sorted and duplicates marked bam file, dedup_reads.bai, which is the index of the dedup_reads.bam, and dedup_reads.stats, which provides mapping statistics
}
\description{
This function executes the docker container snv.1 where GATK software is used to do INDEL realignment and quality recalibration. This analysis is required only to run mutect1. The bwa index has to be prepared with bwaIndex
}
\examples{
\dontrun{
    #downloading fastq files
    system("wget http://130.192.119.59/public/test_R1.fastq.gz")
    system("wget http://130.192.119.59/public/test_R2.fastq.gz")
    #running bwa
    gatkDNA(group="sudo",bam.folder=getwd(), scratch.folder="/data/scratch",
    gatk.filename="GenomeAnalysisTK-3.7.tar.bz2"
    genome.folder="/data/scratch/hg19_bwa", threads=24)
}
}
