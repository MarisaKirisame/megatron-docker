FROM ocaml/opam:debian-12-ocaml-4.13
RUN git clone https://github.com/MarisaKirisame/megatron.git --depth=1
WORKDIR megatron
RUN sudo apt-get update && sudo apt-get install -y python3 python3-pip python3-venv
RUN opam update && opam install . --deps-only && opam install core dune menhir ppx_deriving ppx_sexp_conv yojson core_unix -y
RUN python3 -m venv .venv
RUN .venv/bin/pip install dominate scikit-learn matplotlib
COPY entrypoint.sh .
COPY docker_report.py .
EXPOSE 8080/tcp
ENTRYPOINT ["bash", "entrypoint.sh"]