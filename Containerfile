FROM ucsb/rstudio-base:latest

LABEL maintainer="LSIT Systems <lsitops@ucsb.edu>"

USER root

# R Package Installs
RUN R -e "install.packages(c('janitor', 'keras', 'tensorflow', 'tidymodels'), repos = 'https://cloud.r-project.org/', Ncpus = parallel::detectCores())"

# Python Installs

RUN pip install keras \
    tensorflow \
    numpy \
    pandas

RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu

# Disable downloads from JupyterHub. 
RUN jupyter labextension disable @jupyterlab/docmanager-extension:download ; \
    jupyter labextension disable @jupyterlab/filebrowser-extension:download

USER $NB_USER

