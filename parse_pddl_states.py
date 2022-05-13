import os
from unicodedata import name


def parse_line(line):

    state, _ = str.split(line, ";")
    init_idx = state.find("{")
    last_idx = state.find("}")
    state = state[init_idx:last_idx]
    predicates = state.split


if __name__ == "__main__":

    filepath = None

    with open(filepath, "rb") as file:

        pass
