# snakemake_demo
A quick intro to snakemake for bioinformatics.

This repository contains a minimal workflow illustrating how to use
[Snakemake](https://snakemake.readthedocs.io).

## Usage

Prep environment:

```bash
conda create -n demo -c conda-forge -c bioconda snakemake
conda activate demo
```

Run the workflow:

```bash
snakemake --cores 1 all1
```

Outputs are written to `results/`. Targets are `all1`, `all2`, `all3`, and `all4`.

Generate DAG PDF with:

```bash
snakemake all1 --dag | dot -Tpdf > dag.pdf
```