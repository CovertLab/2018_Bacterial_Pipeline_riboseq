FROM spanglry/bcbio:0.0.1

# install skewer
RUN wget https://github.com/relipmoc/skewer/archive/0.2.2.tar.gz \
    && tar xzvf 0.2.2.tar.gz \
    && cd skewer-0.2.2 \
    && make \
    && make install

RUN git clone https://github.com/bcbio/bcbio-nextgen.git
RUN git clone https://github.com/greenlabjhmi/2018_Bacterial_Pipeline_riboseq

RUN apt update
RUN apt install tree

RUN pip install jupyter "biopython==1.68" pandas seaborn sklearn plotly bcbio-gff


# To run this container:
#
#     docker run -it -p 8888:8888 -v /path/to/repo/2018_Bacterial_Pipeline_riboseq:/pipeline greenlab:latest bash

# Once in the container, to start the jupyter notebooks:
#
#     /usr/local/share/bcbio/anaconda/bin/python -m jupyter notebook --ip 0.0.0.0 --no-browser --allow-root Github-Ribo_Density.ipynb