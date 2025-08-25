FROM gcc:latest

# Setup
WORKDIR /seqtk

# Install environment
RUN git clone https://github.com/lh3/seqtk.git && cd seqtk && make

# Run
CMD ["bash"]