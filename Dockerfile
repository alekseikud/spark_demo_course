FROM openjdk:17-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends python3 python3-pip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PySpark + Jupyter
RUN pip3 install --no-cache-dir pyspark jupyter notebook ipykernel

WORKDIR /workspace

CMD ["jupyter", "notebook", \
     "--ip=0.0.0.0", \
     "--port=8888", \
     "--allow-root", \
     "--no-browser", \
     "--IdentityProvider.token=1234", \
     "--IdentityProvider.password="]