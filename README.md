# GenMol

Codebase for SHOC2 containerised version of GenMol. Files:

- genmol.def:	Apptainer definition file to build a container for genmol
- build_genmol.sh:Bash script to build genmol container
- genmol.ipynb:	Jupyter notebook to use genmol interactively
- run_genmol.sl:	SLURM script to run genmol.ipynb non-interactively

Suggested usage:

1. Run ./build_genmol.sh and make sure genmol.sif is built
2. Goto https://ondemand.nesi.org.nz/public/ and select Jupyter Lab
    - Cluster: SLURM HPC
    - Project Code: uoa04517
    - JupyterLab Module: 2026.7.0-foss-2026-4.6.0
    - Number of Hours: 2
    - Number of Cores: 4
    - Memory per Job: 20 GB
    - GPU: L4
3. When Open Ondemand starts, choose the select the file 'genmol.ipynb' from the chooser
4. Modify file to run your workflow
5. If you need to run for longer, or a GPU is not available, save changes in genmol.ipynb, open a terminal kernel in Open Ondemand, and type:
6. sbatch run_genmol.sl
