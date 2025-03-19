FROM ocaml/opam:debian-12-ocaml-4.13
RUN git clone --recursive -b ae https://github.com/MarisaKirisame/megatron.git --depth=1
WORKDIR megatron
RUN sudo apt-get update
RUN sudo apt-get install -y opam cmake clang clang-format python3 python3-pip python3-venv libpapi-dev libpfm4-dev
RUN opam switch create megatron --empty || true
RUN opam switch megatron
RUN opam switch set-invariant "ocaml<5" -y
RUN opam install . --deps-only && opam install core dune menhir ppx_deriving ppx_sexp_conv yojson core_unix -y
RUN eval $(opam env)
RUN python3 -m venv .venv
RUN .venv/bin/pip install dominate scikit-learn matplotlib
COPY entrypoint.sh .
COPY docker_report.py .
EXPOSE 8080/tcp