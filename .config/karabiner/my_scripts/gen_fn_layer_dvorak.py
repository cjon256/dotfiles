HEADER = """\
{
  "description": "Mappings for fn1 layer without kinesis support",
  "manipulators": [\
"""
TRAILER = """\
  ]
}

"""

DVORAK_TO_US = {
    "hyphen": "quote",
    "open_bracket": "hyphen",
    "close_bracket": "equal_sign",
    "quote": "from_quote",
    "equal_sign": "close_bracket",
    "grave_accent_and_tilde": "grave_accent_and_tilde",
    "backslash": "backslash",
    "slash": "open_bracket",
}

CHAR_TO_NAME = {
    "-": "hyphen",
    "[": "open_bracket",
    "]": "close_bracket",
    "'": "quote",
    "/": "slash",
    ",": "comma",
    ".": "period",
    "\\": "backslash",
    ";": "semicolon",
    "=": "equal_sign",
    "`": "grave_accent_and_tilde",
    "out": "vk_none",
}


def shifted_keymap(key_in, key_out):
    return f"""\
    {{
      "from": {{
          "key_code": "{key_in}",
          "modifiers": {{ "mandatory": ["fn"], "optional": ["shift", "control", "command", "option"] }}
      }},
      "to": [
        {{
          "key_code": "{key_out}",
          "modifiers": ["shift"]
        }}
      ],
      "type": "basic"
    }}\
"""


def reverse_shifted_keymap(key_in, key_out):
    return f"""\
    {{
      "from": {{
        "key_code": "{key_in}",
        "modifiers": {{ "mandatory": ["fn"], "optional": ["control", "command", "option"] }}
      }},
      "to": [
        {{
          "key_code": "{key_out}",
          "modifiers": ["shift"]
        }}
      ],
      "type": "basic"
    }},
    {{
      "from": {{
        "key_code": "{key_in}",
        "modifiers": {{ "mandatory": ["fn", shift], "optional": ["control", "command", "option"] }}
      }},
      "to": [
        {{
          "key_code": "{key_out}",
        }}
      ],
      "type": "basic"
    }}\
"""


def unshifted_keymap(key_in, key_out):
    return f"""\
    {{
      "from": {{
        "key_code": "{key_in}",
        "modifiers": {{ "mandatory": ["fn"], "optional": ["shift", "control", "command", "option"] }}
      }},
      "to": [
        {{
          "key_code": "{key_out}"
        }}
      ],
      "type": "basic"
    }}\
"""


def keymap(key_in_raw, key_out_raw, shifted):
    key_in = char_to_name(key_in_raw)
    key_out = dvorak_to_us(char_to_name(key_out_raw))
    if shifted is True:
        return shifted_keymap(key_in, key_out)
    # elif shifted == "reverse":
    #     return reverse_shifted_keymap(key_in, key_out)
    else:
        return unshifted_keymap(key_in, key_out)


def dvorak_to_us(key):
    if key in DVORAK_TO_US:
        return DVORAK_TO_US[key]
    else:
        return key


def char_to_name(key):
    if key in CHAR_TO_NAME:
        return CHAR_TO_NAME[key]
    else:
        return key


hotkey_mappings = {
    "q": ("1", False),
    "w": ("2", False),
    "e": ("3", False),
    "r": ("4", False),
    "t": ("5", False),
    # -
    "y": ("[", False),
    "u": ("]", False),
    "i": ("8", True),
    "o": ("6", True),
    "p": ("4", True),
    # ---
    "a": ("grave_accent_and_tilde", False),
    "s": ("off", False),
    "d": ("off", False),
    "f": ("1", True),
    "g": ("=", True),
    # -
    "h": ("9", True),
    "j": ("0", True),
    "k": ("z", True),
    "l": ("q", True),
    ";": ("=", False),
    # ---
    "z": ("6", False),
    "x": ("7", False),
    "c": ("8", False),
    "v": ("9", False),
    "b": ("0", False),
    # -
    "n": ("[", True),
    "m": ("]", True),
    "N": (",", True),
    "M": (".", True),
    ",": ("`", True),
    ".": ("/", False),
    "/": ("\\", False),
    # --
    # "close_bracket": ("grave_accent_and_tilde", False),
    "tab": ("out", False),
    "escape": ("out", False),
    "`": ("`", False),
    # --
    "[": ("out", False),
    "'": ("-", False),
    "=": ("out", False),
    "-": ("out", False),
    # ---
    "]": ("f1", False),
    "1": ("f2", False),
    "2": ("f3", False),
    "3": ("f4", False),
    "4": ("f5", False),
    "5": ("f6", False),
    "6": ("f7", False),
    "7": ("f8", False),
    "8": ("f9", False),
    "9": ("f10", False),
    "0": ("f11", False),
    "\\": ("f12", False),
    "delete_or_backspace": ("delete_or_backspace", False),
    "escape": ("escape", False),
}


print(HEADER)
hotkey_statements = []
for key_in_raw, (key_out_raw, shifted) in hotkey_mappings.items():
    hotkey_statements.append(keymap(key_in_raw, key_out_raw, shifted))
print(",\n".join(hotkey_statements))
print(TRAILER)
