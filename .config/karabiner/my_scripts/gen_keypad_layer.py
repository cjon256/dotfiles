HEADER = """\
{
  "description": "Mappings for keypad layer without kinesis support",
  "manipulators": [\
"""
TRAILER = """\
  ]
}\
"""

MODIFERS = '"fn", "right_option"'


def keymap(key_in, key_out, shifted):
    return f"""\
    {{
      "from": {{
        "key_code": "{key_in}",
        "modifiers": {{ "mandatory": [{MODIFERS}] }}
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
    "q": ("vk_none", False),
    "w": ("vk_none", False),
    "e": ("vk_none", False),
    "r": ("vk_none", False),
    "t": ("vk_none", False),
    # -
    "y": ("close_bracket", True),
    "u": ("7", False),
    "i": ("8", False),
    "o": ("9", False),
    "p": ("0", False),
    # ---
    "a": ("vk_none", False),
    "s": ("vk_none", False),
    "d": ("vk_none", False),
    "f": ("vk_none", False),
    "g": ("vk_none", False),
    # -
    "h": ("close_bracket", False),
    "j": ("4", False),
    "k": ("5", False),
    "l": ("6", False),
    "semicolon": ("0", False),
    # ---
    "z": ("vk_none", False),
    "x": ("vk_none", False),
    "c": ("vk_none", False),
    "v": ("vk_none", False),
    "b": ("vk_none", False),
    # -
    "n": ("quote", False),
    "m": ("1", False),
    "comma": ("2", False),
    "period": ("3", False),
    "slash": ("0", False),
    # --
    "up_arrow": ("0", False),
    "down_arrow": ("e", False),
    "hyphen": ("w", False),
    "tab": ("vk_none", False),
    "escape": ("vk_none", False),
    "grave_accent_and_tilde": ("vk_none", False),
    # --
    "close_bracket": ("vk_none", False),
    "open_bracket": ("vk_none", False),
    "quote": ("vk_none", False),
    "equal_sign": ("vk_none", False),
    "backslash": ("vk_none", False),
    # ---
    "1": ("vk_none", False),
    "2": ("vk_none", False),
    "3": ("vk_none", False),
    "4": ("vk_none", False),
    "5": ("vk_none", False),
    "6": ("vk_none", False),
    "7": ("vk_none", False),
    "8": ("vk_none", False),
    "9": ("vk_none", False),
    "0": ("vk_none", False),
}


print(HEADER)
print(",\n".join(keymap(key_in, *out) for key_in, out in hotkey_mappings.items()))
print(TRAILER)
