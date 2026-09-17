#!/bin/bash -e

#SBATCH --time          00:10:00
#SBATCH --mem           20GB
#SBATCH --cpus-per-task 8
#SBATCH --account       uoa04517
#SBATCH --gres		gpu:A100:1
#SBATCH --job-name      genmol
#SBATCH --output        genmol.log

module load JupyterLab/2026.7.0-foss-2026-4.6.0

#Check for a key at ~/.ngc/ngc_api_key.genmol
#Exit if no key
./check_genmol_api_key.sh

papermill genmol.ipynb output_genmol.ipynb -p API_KEY $(cat ~/.ngc/ngc_api_key.genmol)
