HEADER = """\
{
  "description": "Launch apps by (left) option + number.",
  "manipulators": [\
"""
TRAILER = """\
  ]
}\
"""

MODIFERS = '"left_alt", "left_command"'


def hotkey_template(key, command):
    return f"""\
    {{
      "type": "basic",
      "from": {{
        "key_code": "{key}",
        "modifiers": {{
          "mandatory": [{MODIFERS}]
        }}
      }},
      "to": [
        {{
          "shell_command": {command}
        }}
      ]
    }}\
"""


"""
{
  "description": "Launch apps by (left) option + number.",
  "manipulators": [
    {
      "type": "basic",
      "from": {
        "key_code": "a",
        "modifiers": {
          "mandatory": ["left_alt", "left_command"]
        }
      },
      "to": [
        {
          "shell_command": "open -a 'Agenda'"
        }
      ]
    }
  ]
}

"""


def open_a(app):
    return f"\"open -a '{app}'\""


hotkey_mappings = {
    "a": open_a("Agenda"),
    "r": open_a("1Password"),
}

print(HEADER)
print(",\n".join(hotkey_template(key, cmd) for key, cmd in hotkey_mappings.items()))
print(TRAILER)
