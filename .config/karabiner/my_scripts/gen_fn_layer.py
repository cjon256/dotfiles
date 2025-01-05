HEADER = """\
{
  "description": "Mappings for fn1 layer without kinesis support",
  "manipulators": [\
"""
TRAILER = """\
  ]
}\
"""

MODIFERS = '"fn"'


def keymap(key_in, key_out, shifted):
    return f"""\
    {{
      "from": {{
        "key_code": "{key_in}",
        "modifiers": {{ "mandatory": [{MODIFERS}], "optional": ["shift", "control", "command", "option"] }}
      }},
      "to": [
        {{
          "key_code": "{key_out}"\
{ ',\n         "modifiers": ["shift"]' if shifted else '' }
        }}
      ],
      "type": "basic"
    }}\
"""


hotkey_mappings = {
    "q": ("1", False),
    "w": ("2", False),
    "e": ("3", False),
    "r": ("4", False),
    "t": ("5", False),
    # -
    "y": ("hyphen", False),
    "u": ("equal_sign", False),
    "i": ("8", True),
    "o": ("6", True),
    "p": ("4", True),
    # ---
    "a": ("1", True),
    "s": ("open_bracket", True),
    "d": ("3", True),
    "f": ("5", True),
    "g": ("7", True),
    # -
    "h": ("9", True),
    "j": ("0", True),
    "k": ("z", True),
    "l": ("q", True),
    "semicolon": ("close_bracket", False),
    # ---
    "z": ("6", False),
    "x": ("7", False),
    "c": ("8", False),
    "v": ("9", False),
    "b": ("0", False),
    # -
    "n": ("hyphen", True),
    "m": ("equal_sign", True),
    "comma": ("grave_accent_and_tilde", True),
    "period": ("open_bracket", False),
    "slash": ("backslash", True),
    # --
    # "close_bracket": ("grave_accent_and_tilde", False),
    "tab": ("out", False),
    "escape": ("out", False),
    "grave_accent_and_tilde": ("grave_accent_and_tilde", False),
    # --
    "open_bracket": ("2", True),
    "quote": ("close_bracket", True),
    "equal_sign": ("grave_accent_and_tilde", False),
    "hyphen": ("backslash", False),
    # ---
    "close_bracket": ("f1", False),
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
    "backslash": ("f12", False),
}


print(HEADER)
print(",\n".join(keymap(key_in, *out) for key_in, out in hotkey_mappings.items()))
print(TRAILER)
