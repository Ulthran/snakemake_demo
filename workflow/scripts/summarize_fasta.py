# Summary script
fas_in = snakemake.input.fas
fa_out = snakemake.output.report

print(f"Summarizing {fas_in} to {fa_out}")
for fa in fas_in:
    with open(fa) as fin, open(fa_out, "a") as fout:
        seq_count = 0
        base_count = 0
        for line in fin:
            if not line.startswith(">"):
                seq_count += 1
                base_count += len(line.strip())
        fout.write(f"{fa}\t{seq_count}\t{base_count}\n")