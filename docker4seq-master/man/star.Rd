% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/star.R
\name{star}
\alias{star}
\title{Running Star two steps for variant calls}
\usage{
star(
  group = c("sudo", "docker"),
  fastq.folder = getwd(),
  scratch.folder = "/data/scratch",
  genome.folder,
  groupid,
  threads = 1,
  version = 2
)
}
\arguments{
\item{group, }{a character string. Two options: \code{"sudo"} or \code{"docker"}, depending to which group the user belongs}

\item{fastq.folder, }{a character string indicating where gzip fastq files are located}

\item{scratch.folder, }{a character string indicating the scratch folder where docker container will be mounted}

\item{genome.folder, }{a character string indicating the folder where the indexed reference genome for STAR is located.}

\item{groupid, }{a character string to be inserted in the bam as identifier for the sample}

\item{threads, }{a number indicating the number of cores to be used from the application}

\item{version, }{a number indicating version in use}
}
\value{
three files: sorted_reads.bam, which is sorted and duplicates marked bam file, sort_reads.bai, and sort_reads.stats, which provides mapping statistics
}
\description{
This function executes the two steps STAR as sugested by best practice GATK for calling variants on RNAseq data only PE data are accepted
}
\examples{
\dontrun{
    #downloading fastq files
    system("wget http://130.192.119.59/public/test_R1.fastq.gz")
    system("wget http://130.192.119.59/public/test_R2.fastq.gz")
    #running star nostrand pe
    star(group="docker",fastq.folder=getwd(), scratch.folder="/data/scratch",
    genome.folder="/data/scratch/hg38star", groupid="test", threads=12)

}
}
\author{
Raffaele Calogero, raffaele.calogero [at] unito [dot] it, Bioinformatics and Genomics unit, University of Torino Italy
}
