# snakemake_demo
A quick intro to snakemake for bioinformatics.

This repository contains a minimal workflow illustrating how to use
[Snakemake](https://snakemake.readthedocs.io) with the [seqtk](https://github.com/lh3/seqtk)
command line tool. The workflow performs two simple steps for each example
FASTQ file in the `data/` directory:

1. Quality statistics with `seqtk fqchk`.
2. Conversion from FASTQ to FASTA with `seqtk seq -A`.

## Usage

Install seqtk (Debian/Ubuntu):

```bash
sudo apt-get update
sudo apt-get install -y seqtk
```

Run the workflow:

```bash
snakemake --cores 1
```

Outputs are written to `results/qc/` and `results/fasta/`.
