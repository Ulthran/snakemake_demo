# A very useful script
fa_in = snakemake.input[0]
fa_out = snakemake.output[0]

MAP = {"A": "T", "T": "A", "C": "G", "G": "C"}

print(f"Reversing {fa_in} to {fa_out}")
with open(fa_in) as fin, open(fa_out, "w") as fout:
    for line in fin:
        if line.startswith(">"):
            fout.write(line)
        else:
            fout.write("".join(MAP.get(base, base) for base in line.strip()[::-1]) + "\n")