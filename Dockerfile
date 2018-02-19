FROM continuumio/miniconda3:latest

# get latest fixes for conda
RUN /opt/conda/bin/conda update conda -y

# Disable Intel optimizations (takes a lot of extra space). (tnx kennethreitz)
RUN /opt/conda/bin/conda install nomkl -y

# Install desired packages
RUN /opt/conda/bin/conda install -y scipy pandas matplotlib scikit-learn jupyter

# Cleanup conda files
RUN /opt/conda/bin/conda clean -a -y

# Create Jupyter notebook folder
RUN mkdir /opt/notebooks

# Add conda to path
ENV PATH /opt/conda/bin:$PATH

# Start jupyter notebook // auth token will show in log
CMD [ "/bin/bash", "-c", "/opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=$PORT --no-browser --allow-root" ]

