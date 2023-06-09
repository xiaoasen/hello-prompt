FROM python:3.9.0-alpine

RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip
RUN pip install mkdocs-material==9.1.15
RUN pip install neoteroi-mkdocs

WORKDIR /app

COPY docs /app/build
COPY mkdocs.yml /app/mkdocs.yml

RUN mkdir -p ./build/overrides && mkdocs build

EXPOSE 9000

CMD ["mkdocs", "serve", "-a", "0.0.0.0:9000"]