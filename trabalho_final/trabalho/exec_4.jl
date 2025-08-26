### A Pluto.jl notebook ###
# v0.20.8

using Markdown
using InteractiveUtils

# ╔═╡ 0f8211e4-8213-11f0-3486-65a5aeaa4e07
md"""
# Comparar L2 - Boosting

Usar "Trees", "Splines", Local Linear Regression.

Focando em 1) erro de estimação/previsão e 2) tempo de processamento.

Fazendo um loooping com resíduos do passo anterior.
(De repente, usa o pacote gbm só para trees, e implementa splines e LLG à mão).
"""

# ╔═╡ 1b04dc58-f647-4c14-b97d-04978ba4d7eb


# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.11.6"
manifest_format = "2.0"
project_hash = "da39a3ee5e6b4b0d3255bfef95601890afd80709"

[deps]
"""

# ╔═╡ Cell order:
# ╠═0f8211e4-8213-11f0-3486-65a5aeaa4e07
# ╠═1b04dc58-f647-4c14-b97d-04978ba4d7eb
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
