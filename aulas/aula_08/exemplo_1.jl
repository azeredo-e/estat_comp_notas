### A Pluto.jl notebook ###
# v0.20.8

using Markdown
using InteractiveUtils

# ╔═╡ 92b8a901-7efd-4247-80ea-fae6ed160ce5
md"""
# Gibbs Sampling

Para Inferência Bayesiana.

Gibbs Sampling é um caso particular de MCMC (Markov Chain Mnonte Carlo)

Para inferência o Teorema de Bayes é

$f(\theta;x) = \frac{f(x;\theta)f(\theta)}{f(x)}$

onde $f(x)$ é a função preditora, $f(\theta)$ é a priori e $f(x;\theta)$ é a função de verossimilhança. Definimos a função preditora como a integral de $f(\theta;x)$ com respeito a $\theta$. Temos então

$f(\theta;x) \propto f(\theta) f(x;\theta)$

o que define então o "razão" dessa proporção é o justamente a função preditora que não depende de $\theta$.

Vamos supor x segue uma bernoulli.

Para a priori podemos usar uma distribuição Beta.

Podemos então escrever

$f(\theta;x) \propto (\theta^{\alpha-1}(1-\theta)^{\beta-1}) (\theta^{\sum x}(1-\theta)^{n-\sum x})$

Logo

$\theta;x \sim Beta(\alpha+\sum^n_{i=1}x_i;\beta+n-\sum^n_{i=1}x_i)$
"""

# ╔═╡ a116dc36-797b-4662-8ca5-72d8671a6f5b
md"""
## Exemplo

Considere um vetor de parâmetros desconhecidos $\vec\theta=(\theta_1, \dots, \theta_k), k \geq 2$. Desejamos obter a dist. post. $f(\vec\theta, \vec x)$, mas a mesma não pode ser obtida analiticamente (razão, integral do denominador). Considere as dist. condicionais completas a posteriori $f(\theta_i;\vec\theta_{-i}, \vec x), i=1, \dots, k$ onde $\vec\theta_{-i} = (\theta_1, \dots, \theta_{i=1}, \theta_{i+1}, \dots, \theta_k)$.

Se soubermos simular valores de todas as condicionais completas, podemos usar Gibbs Sampling. Por exemplo, considere $k=3$, e considere a dist. posteriori

$f(\theta_1, \theta_2, \theta_3; \vec x) \propto f(\theta_1, \theta_2, \theta_3)f(\vec x; \theta_1, \theta_2, \theta_3)$

ainda,

$f(\theta_1; \theta_2, \theta_3, \vec x) = \frac{f(\theta_1, \theta_2, \theta_3; \vec x)}{f(\theta_2, \theta_3; \vec x)} = \frac{f(\theta_1, \theta_2, \theta_3)f(\vec x; \theta_1, \theta_2, \theta_3)}{f(\theta_2, \theta_3; \vec x)}$

Podemos repetir esse mesmo procedimento para todas os $\theta$s.

### Algoritmo Gibbs Sampling

1) Chutes iniciais para $\theta^{(0)}_1, \dots, \theta^{(0)}_k$
2) Simular via condicionais completas a posteriori a próxima versão dos parâmetros, $\theta^{(1)}_1, \dots, \theta^{(1)}_k$, usando o seguinte:

2.1) $\theta^{(1)}_1$ de $f(\theta_i;\theta^{(0)}_2, \dots, \theta^{(0)}_k, \vec x)$

2.2) $\theta^{(1)}_2$ de $f(\theta_2;\theta^{(0)}_1, \theta^{(0)}_3, \dots, \theta^{(0)}_k, \vec x)$

2.2) $\theta^{(1)}_3$ de $f(\theta_3;\theta^{(0)}_1, \theta^{(0)}_2, \theta^{(0)}_4, \dots, \theta^{(0)}_k, \vec x)$

2.k) $\theta^{(1)}_k$ de $f(\theta_k;\theta^{(0)}_1, \dots, \theta^{(0)}_{k-1}, \vec x)$

2.j.1) $\theta^j_1$ de $f(\theta_1; \theta_2^{j-1}, \dots, \theta_k^{j-1}, \vec x)$

2.j.2)  $\theta^{(j)}_2$ de $f(\theta_2;\theta^{(j)}_1, \theta^{(j-1)}_3, \dots, \theta^{(j-1)}_k, \vec x)$

2.j.k) $\theta^{(j)}_k$ de $f(\theta_k;\theta^{(j)}_1, \dots, \theta^{(j)}_{k-1}, \vec x)$

Obs. As primeiras $n_b$ simulações são descartadas por os valores gerados ainda serem influenciados pelo chute inicial (em termos técnicos, ela está longe da distribuição estacionária), "burn-in period".
Obs2. No final para obtermos uma a.a. alternamos as observações retidas, assim não há correlação entre elas.

Mostra-se que os valores simulados dessa forma aderem aos valores simulados da conjunta a posteriori e das marginais a posteriori. O histograma dessa a.a. btida por simulação tende para essas distribuição.
"""

# ╔═╡ fbc5ae42-9d45-40bf-b314-a5824c215e7b


# ╔═╡ f96f3f37-8f25-4cbd-bd9c-b6b02ce75383


# ╔═╡ be5a43ad-17fc-44f7-91bc-3f91f9161b93


# ╔═╡ c660555c-d458-465a-9788-6bcbc62fd260


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
# ╟─92b8a901-7efd-4247-80ea-fae6ed160ce5
# ╠═a116dc36-797b-4662-8ca5-72d8671a6f5b
# ╠═fbc5ae42-9d45-40bf-b314-a5824c215e7b
# ╠═f96f3f37-8f25-4cbd-bd9c-b6b02ce75383
# ╠═be5a43ad-17fc-44f7-91bc-3f91f9161b93
# ╠═c660555c-d458-465a-9788-6bcbc62fd260
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
