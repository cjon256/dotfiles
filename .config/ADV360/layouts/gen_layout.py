BASE_LAYOUT = """\
<base>
[q]>[apos]
[w]>[comm]
[e]>[perd]
[r]>[p]
[t]>[y]
[y]>[f]
[u]>[g]
[i]>[c]
[o]>[r]
[p]>[l]
[bsls]>[fsls]
[s]>[o]
[d]>[e]
[f]>[u]
[g]>[i]
[hk2]>[caws]
[hk4]>[caws]
[h]>[d]
[j]>[h]
[k]>[t]
[l]>[n]
[scol]>[s]
[apos]>[bsls]
[z]>[scol]
[x]>[q]
[c]>[j]
[v]>[k]
[b]>[x]
[n]>[b]
[comm]>[w]
[perd]>[v]
[fsls]>[z]
[rwin]>[ralt]
[home]>[fn1s]
[pgup]>[fn1s]
[end]>[lwin]
[pgdn]>[rwin]
"""

KEYPAD_LAYOUT = """\
<keypad>
[hk2]>[caws]
[hk4]>[caws]
[rwin]>[ralt]
[home]>[null]
[pgup]>[null]
[end]>[lwin]
[pgdn]>[rwin]
"""
FN1_LAYOUT = """
<function1>
[hk2]>[caws]
[hk4]>[caws]
[rwin]>[ralt]
[home]>[defs]
[pgup]>[defs]
[end]>[lwin]
[pgdn]>[rwin]
"""

FN2_LAYOUT = """\
<function2>
[rwin]>[ralt]
"""

FN3_LAYOUT = """\
<function3>
[rwin]>[ralt]
"""

MACROS_FOR_CHARACTERS = {
    "{~}": "{s5}{x1}{-lshf}{grav}{+lshf}",
    "{5}": "{s5}{x1}{5}",
    "{3}": "{s5}{x1}{3}",
    "{{}": "{s5}{x1}{-lshf}{obrk}{+lshf}",
    "{#}": "{s5}{x1}{-lshf}{3}{+lshf}",
    "{(}": "{s5}{x1}{-lshf}{9}{+lshf}",
    "{[}": "{s5}{x1}{obrk}",
    "{]}": "{s5}{x1}{cbrk}",
    "{*}": "{s5}{x1}{-lshf}{8}{+lshf}",
    "{)}": "{s5}{x1}{-lshf}{0}{+lshf}",
    "{}}": "{s5}{x1}{-lshf}{cbrk}{+lshf}",
    "{|}": "{s5}{x1}{-lshf}{bsls}{+lshf}",
    "{7}": "{s5}{x1}{7}",
    "{6}": "{s5}{x1}{6}",
    "{\\}": "{s5}{x1}{bsls}",
    "{?}": "{s5}{x1}{-lshf}{fsls}{+lshf}",
    "{!}": "{s5}{x1}{-lshf}{1}{+lshf}",
    "{$}": "{s5}{x1}{-lshf}{4}{+lshf}",
    "{/}": "{s5}{x1}{fsls}",
    "{%}": "{s5}{x1}{-lshf}{5}{+lshf}",
    "{&}": "{s5}{x1}{-lshf}{7}{+lshf}",
    "{4}": "{s5}{x1}{4}",
    "{@}": "{s5}{x1}{-lshf}{2}{+lshf}",
    "{2}": "{s5}{x1}{2}",
    "{^}": "{s5}{x1}{-lshf}{6}{+lshf}",
    "{1}": "{s5}{x1}{1}",
    "{=}": "{s5}{x1}{eql}",
    "{+}": "{s5}{x1}{-lshf}{eql}{+lshf}",
    "{8}": "{s5}{x1}{8}",
    "{9}": "{s5}{x1}{9}",
    "{0}": "{s5}{x1}{0}",
    "{`}": "{s5}{x1}{grav}",
}


FN1_MACRO_MAP = {
    "{a}": "{~}",
    "{b}": "{5}",
    "{c}": "{3}",
    "{d}": "{{}",
    "{e}": "{#}",
    "{f}": "{(}",
    "{g}": "{[}",
    "{h}": "{]}",
    "{i}": "{*}",
    "{j}": "{)}",
    "{k}": "{}}",
    "{l}": "{|}",
    "{m}": "{7}",
    "{n}": "{6}",
    "{o}": "{\\}",
    "{p}": "{?}",
    "{q}": "{!}",
    "{r}": "{$}",
    "{s}": "{/}",
    "{t}": "{%}",
    "{u}": "{&}",
    "{v}": "{4}",
    "{w}": "{@}",
    "{x}": "{2}",
    "{y}": "{^}",
    "{z}": "{1}",
    "{bsls}": "{=}",
    "{apos}": "{+}",
    "{comm}": "{8}",
    "{perd}": "{9}",
    "{fsls}": "{0}",
    "{scol}": "{`}",
}


def mk_macro(mkey, macro):
    return f"{mkey}>{macro}"


for key, char in FN1_MACRO_MAP.items():
    base_mk_macro = mk_macro(key, MACROS_FOR_CHARACTERS[char])
    print(base_mk_macro)
    print(f"{{lshf}}{base_mk_macro}")
    print(f"{{rshf}}{base_mk_macro}")

"""    
{rshf}{scol}>{s5}{x1}{-lshf}{5}{+lshf}
{q}>{s5}{x1}{1}
{w}>{s5}{x1}{2}
{e}>{s5}{x1}{3}
{r}>{s5}{x1}{4}
{t}>{s5}{x1}{5}
{y}>{s5}{x1}{6}
{u}>{s5}{x1}{7}
{i}>{s5}{x1}{8}
{o}>{s5}{x1}{9}
{p}>{s5}{x1}{0}
{bsls}>{s5}{x1}{-lshf}{1}{+lshf}
{apos}>{s5}{x1}{-lshf}{eql}{+lshf}
{lshf}{apos}>{s5}{x1}{-lshf}{eql}{+lshf}
{lwin}{apos}>{s5}{x1}{-lshf}{eql}{+lshf}
{lalt}{apos}>{s5}{x1}{-lshf}{eql}{+lshf}
{lwin}{lalt}{apos}>{s5}{x1}{-lshf}{eql}{+lshf}
{lwin}{lalt}{lshf}{apos}>{s5}{x1}{-lshf}{eql}{+lshf}

<base>
[b]>[x]
[c]>[j]
[d]>[e]
[e]>[perd]
[f]>[u]
[g]>[i]
[h]>[d]
[i]>[c]
[j]>[h]
[k]>[t]
[l]>[n]
[n]>[b]
[o]>[r]
[p]>[l]
[q]>[apos]
[r]>[p]
[s]>[o]
[t]>[y]
[u]>[g]
[v]>[k]
[w]>[comm]
[x]>[q]
[y]>[f]
[z]>[scol]
[apos]>[hyph]
[bsls]>[fsls]
[comm]>[w]
[del]>[tab]
[end]>[lwin]
[fsls]>[z]
[hk2]>[caws]
{hk1}>{s5}{x1}{-caws}{spc}{+caws}
[hk4]>[caws]
{hk3}>{s5}{x1}{-caws}{spc}{+caws}
[home]>[fn1s]
[hyph]>[bsls]
[lctr]>[fn1s]
[lfn]>[lctr]
[perd]>[v]
[pgdn]>[rwin]
[pgup]>[fn1s]
[rctr]>[fn1s]
[rfn]>[rctr]
[rwin]>[ralt]
[scol]>[s]
<keypad>
[del]>[tab]
[end]>[lwin]
[hk2]>[caws]
[hk4]>[caws]
[home]>[null]
[lctr]>[null]
[lfn]>[lctr]
[pgdn]>[rwin]
[pgup]>[null]
[rctr]>[null]
[rfn]>[rctr]
[rwin]>[ralt]
<function1>
[del]>[tab]
[end]>[lwin]
[hk2]>[caws]
[hk4]>[caws]
[home]>[defs]
[lctr]>[keys]
[lfn]>[lctr]
[pgdn]>[rwin]
[pgup]>[defs]
[rctr]>[defs]
[rfn]>[rctr]
[rwin]>[ralt]
{a}>{s5}{x1}{-lshf}{grav}{+lshf}
{b}>{s5}{x1}{5}
{c}>{s5}{x1}{3}
{d}>{s5}{x1}{-lshf}{obrk}{+lshf}
{e}>{s5}{x1}{-lshf}{3}{+lshf}
{f}>{s5}{x1}{-lshf}{9}{+lshf}
{g}>{s5}{x1}{obrk}
{h}>{s5}{x1}{cbrk}
{i}>{s5}{x1}{-lshf}{8}{+lshf}
{j}>{s5}{x1}{-lshf}{0}{+lshf}
{k}>{s5}{x1}{-lshf}{cbrk}{+lshf}
{l}>{s5}{x1}{-lshf}{bsls}{+lshf}
{m}>{s5}{x1}{7}
{n}>{s5}{x1}{6}
{o}>{s5}{x1}{bsls}
{p}>{s5}{x1}{-lshf}{fsls}{+lshf}
{q}>{s5}{x1}{-lshf}{1}{+lshf}
{r}>{s5}{x1}{-lshf}{4}{+lshf}
{s}>{s5}{x1}{fsls}
{t}>{s5}{x1}{-lshf}{5}{+lshf}
{u}>{s5}{x1}{-lshf}{7}{+lshf}
{v}>{s5}{x1}{4}
{w}>{s5}{x1}{-lshf}{2}{+lshf}
{x}>{s5}{x1}{2}
{y}>{s5}{x1}{-lshf}{6}{+lshf}
{z}>{s5}{x1}{1}
{bsls}>{s5}{x1}{eql}
{apos}>{s5}{x1}{-lshf}{eql}{+lshf}
{comm}>{s5}{x1}{8}
{perd}>{s5}{x1}{9}
{fsls}>{s5}{x1}{0}
<function2>
[rwin]>[ralt]
<function3>
[rwin]>[ralt]
D"""
