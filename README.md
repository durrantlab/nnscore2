# nnscore

<div align="center">

<b>Neural network scoring function for drug discovery</b>

[![Build status](https://github.com/durrantlab/nnscore/workflows/build/badge.svg?branch=master&event=push)](https://github.com/durrantlab/nnscore/actions?query=workflow%3Abuild)
[![Python Version](https://img.shields.io/pypi/pyversions/nnscore.svg)](https://pypi.org/project/nnscore/)
[![Dependencies Status](https://img.shields.io/badge/dependencies-up%20to%20date-brightgreen.svg)](https://github.com/durrantlab/nnscore/pulls?utf8=%E2%9C%93&q=is%3Apr%20author%3Aapp%2Fdependabot)

[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)
[![Security: bandit](https://img.shields.io/badge/security-bandit-green.svg)](https://github.com/PyCQA/bandit)
[![Pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/durrantlab/nnscore/blob/main/.pre-commit-config.yaml)
[![Semantic Versions](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--versions-e10079.svg)](https://github.com/durrantlab/nnscore/releases)
[![License](https://img.shields.io/github/license/durrantlab/nnscore)](https://github.com/durrantlab/nnscore/blob/main/LICENSE)

</div>

## Motivation

As high-throughput biochemical screens are both expensive and labor intensive, researchers in academia and industry are turning increasingly to virtual-screening methodologies.
Virtual screening relies on scoring functions to quickly assess ligand potency.
Unfortunately, these scoring functions generally have many false positives and negatives; indeed, a properly trained human being can often assess ligand potency by visual inspection with greater accuracy.

## Approach

Given the success of the human mind at receptor-ligand complex characterization, we here present two scoring functions based on neural networks, computational models that simulate the microscopic organization of the brain.
Computer-aided drug design depends on fast and accurate scoring functions to aid in the identification of small-molecule ligands.
The scoring functions presented here, either on their own or used in conjunction with other more traditional functions, may prove useful in drug-discovery projects.
Additional information about NNScore 1 can be found [in the original paper](http://pubs.acs.org/doi/full/10.1021/ci100244v).
NNScore 2 is described in [a separate publication](https://pubs.acs.org/doi/abs/10.1021/ci2003889).

## License

[![License](https://img.shields.io/github/license/durrantlab/nnscore)](https://github.com/durrantlab/nnscore/blob/main/LICENSE)

This project is licensed under the terms of the `GNU GPL v3.0` license.
See [LICENSE](https://github.com/durrantlab/nnscore/blob/main/LICENSE) for more details.

## Citation

```bibtex
@article{durrant2011nnscore,
  title={{NNScore} 2.0: {A} neural-network receptor--ligand scoring function},
  author={Durrant, Jacob D and McCammon, J Andrew},
  journal={J. Chem. Inf. Model.},
  volume={51},
  number={11},
  pages={2897--2903},
  year={2011},
  publisher={ACS Publications},
  doi={10.1021/ci2003889}
}
```
