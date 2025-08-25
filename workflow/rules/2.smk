# Scripts
# snakemake all2 --dag | dot -Tpdf > dag2.pdf
# snakemake -c 1 all2

rule all2:
    input:
        "results/fasta/summary.txt"

rule reverse_complement:
    input:
        "results/fasta/{sample}.fasta"
    output:
        "results/rev/{sample}.fasta"
    script:
        "../scripts/rev_fasta.py"

rule reverse_complement_again:
    input:
        "results/rev/{sample}.fasta"
    output:
        "results/rev_rev/{sample}.fasta"
    script:
        "../scripts/rev_fasta.py"

rule summarize:
    input:
        fas=expand("results/rev_rev/{sample}.fasta", sample=SAMPLES)
    output:
        report="results/fasta/summary.txt"
    script:
        "../scripts/summarize_fasta.py"