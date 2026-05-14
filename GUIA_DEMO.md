# Guia da demo — GitHub Copilot para Infra: além do código

## Estratégia geral

Três arquivos. Três conversas com a IA. Nenhum deploy real, nenhuma credencial.

A demo prova uma tese simples: o Copilot reduz atrito entre intenção e artefato. Você mostra o arquivo, pede ajuda, recebe uma proposta, e então assume o papel de quem interpreta, valida e decide. Isso faz a audiência entender que o ganho não está em terceirizar responsabilidade, mas em reduzir o tempo até uma primeira versão útil.

Tempo total: 10 minutos.

---

## O que deixar pronto antes de subir no palco

- Abrir o editor com as três abas já nomeadas e visíveis
- Confirmar que o Copilot está logado e funcional
- Aumentar a fonte para leitura em auditório (mínimo 16pt)
- Fechar notificações, apps de chat e abas irrelevantes
- Testar conectividade — e ter o plano B pronto se cair

---

## Ordem recomendada

A sequência foi invertida em relação ao guia anterior de propósito: começamos pelo mais simples e familiar, subindo complexidade junto com o engajamento da plateia.

| Ordem | Arquivo | Tempo | Mensagem |
|-------|---------|-------|----------|
| 1 | `.github/workflows/ci.yml` | 3 min | Copilot ajuda a montar e melhorar pipelines |
| 2 | `k8s/deployment.yaml` | 3 min | Copilot revisa manifestos e aponta boas práticas |
| 3 | `terraform/main.tf` | 3 min | Copilot explica e melhora IaC |
| — | Fechamento oral | 1 min | Gerar, revisar e validar |

---

## Passo a passo

### Parte 1 — GitHub Actions

Abra `.github/workflows/ci.yml`. Diga que a estrutura já está funcional mas intencionalmente simples, e que você quer ver o que o Copilot sugere para torná-la mais clara para quem está aprendendo.

Prompt sugerido:

```
Revise este workflow e me diga como eu poderia deixá-lo mais
didático para uma palestra sobre infraestrutura e automação.
```

O que o Copilot vai fazer: sugerir comentários explicativos nos steps, possivelmente propor um step de lint antes do dry-run, e reforçar a ideia de validação antes de deploy.

Sua fala ao receber a resposta: "Veja que ele não apenas sugeriu uma mudança — ele explicou o raciocínio. Isso é o que acelera o aprendizado, não só a escrita."

---

### Parte 2 — Kubernetes

Abra `k8s/deployment.yaml`. Avise a audiência que o arquivo está **intencionalmente incompleto** — sem `resources` e sem `readinessProbe`. Esse é o ponto: você quer que o Copilot encontre o que está faltando.

Prompt sugerido:

```
Revise este manifesto Kubernetes e me diga se ele está adequado
para um serviço web simples. Se houver melhoria, explique antes
de sugerir alteração.
```

O que o Copilot vai apontar: falta de `resources` (cpu e memory limits), falta de `readinessProbe`, possivelmente `livenessProbe` e `securityContext`.

Sua fala: "Antes eu teria que lembrar tudo isso de cabeça ou abrir a documentação. Agora eu recebo uma proposta estruturada e decido o que faz sentido para o meu contexto."

Não transforme a demo em aula de Kubernetes. O foco é no papel do Copilot como revisor, não no manifesto em si.

---

### Parte 3 — Terraform

Abra `terraform/main.tf`. Contextualize: você escolheu o provider `local` para não depender de credenciais e manter o foco no raciocínio, não na infraestrutura do provedor.

Prompt sugerido:

```
Explique este arquivo Terraform para alguém que está começando
em infraestrutura como código. Depois, sugira duas melhorias
simples sem depender de recursos reais em cloud.
```

O que o Copilot vai fazer: explicar variável, resource e output em linguagem acessível, sugerir melhorias de naming ou um segundo output descritivo.

Sua fala: "O arquivo tem três conceitos fundamentais de IaC. O Copilot conseguiu explicar todos eles em sequência — isso é o que ele faz de melhor: encurtar o caminho entre sintaxe e entendimento."

---

## Frases prontas para usar no palco

| Momento | Frase |
|---------|-------|
| Abertura da demo | "Eu não estou tentando provar que a IA faz tudo. Estou mostrando onde ela tira atrito." |
| Após primeira resposta | "Isso já me economiza tempo de estrutura e de explicação." |
| Ao revisar uma sugestão | "Nem tudo eu aceito. O valor está em receber uma boa proposta inicial." |
| Antes do fechamento | "Em infraestrutura, velocidade sem validação vira risco." |
| Fechamento | "A IA reduz o caminho até um artefato útil, mas não elimina a responsabilidade técnica." |

---

## O que evitar

- Navegar em pastas ao vivo — as três abas devem estar abertas antes de começar
- Aceitar sugestões sem comentar — a audiência precisa ver você decidindo
- Transformar qualquer parte em aula profunda do tema — o foco é sempre o papel do Copilot
- Improvisar um deploy real — sem credencial, sem risco

---

## Plano B

Se a internet cair ou o Copilot não responder: abra a versão final dos arquivos (deixe salva em aba separada) e narre o fluxo. Diga o que você pediu, mostre a resposta que havia preparado e comente o que aceitou e o que ajustou. A tese da palestra se sustenta mesmo sem a IA respondendo ao vivo — porque revisão humana é parte da mensagem.

---

## Checklist de ensaio

Antes de sair para o evento:

- [ ] Ensaio completo cronometrado (meta: 10 min na demo)
- [ ] Três abas abertas e nomeadas no editor
- [ ] Fonte legível em auditório
- [ ] Copilot logado e funcional
- [ ] Versão final dos arquivos salva como plano B
- [ ] Prompts memorizados ou anotados em papel
