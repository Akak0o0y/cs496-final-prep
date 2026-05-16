# 🎓 Ultimate Revision Guide — AI / Agentic AI (Module 2)

## Part 1: The Core Exam Questions (Tutorial Focus — 70%)

### Tutorial 2.1 — Generative AI

**Q1. What is Generative AI? Main goal?**
- **Solution:** AI models that learn patterns from existing data and create new content — text, images, audio, video, code, designs. Goal: **model the data distribution** to generate new outputs similar in style to training data without copying.
- **Professor's Note:** Slide 010. GenAI = subset of Deep Learning ⊂ ML ⊂ AI.

**Q2. Major model families for Generative AI?**

| Model | Core Idea | Use |
|---|---|---|
| **Sequential RNN/LSTM** | Step-by-step with hidden state | Text/sequence gen |
| **GANs** | Generator vs Discriminator adversarial | Realistic images |
| **VAEs** | Probabilistic latent space (mean, variance) | Variations |
| **Transformers** | Self-attention | LLMs (GPT) |

**Q3. Seq2Seq architecture?**
- **Solution:** Encoder → context vector / hidden state → Decoder generates output one token at a time. Allows different input/output lengths.

**Q4. GAN architecture?**
- **Solution:** **Generator** transforms noise → fake samples; **Discriminator** classifies real vs fake. Adversarial training.

**Q5. VAE architecture?**
- **Solution:** **Encoder** → distribution (mean, variance) → **Decoder** samples → reconstructs/generates data.

**Q6. Transformer architecture?**
- **Solution:** Tokens → embeddings + positional info → stacked blocks of **multi-head self-attention** + feed-forward + residuals/normalisation. Original = encoder + decoder. **GPT = decoder-only with masked self-attention**.

**Q7. What is GPT?**
- **Solution:** **G**enerative **P**re-trained **T**ransformer.

**Q8. How is GPT pre-trained?**
- **Solution:** **Self-supervised autoregressive language modelling** — predict next token from previous. "The cat sat on the ___" → "mat".

**Q9. What is fine-tuning?**
- **Solution:** Continue training pre-trained model on specialised data. Modern: **instruction tuning** + **RLHF**.

**Q10. What are LLMs?**
- **Solution:** Large transformers trained on huge corpora. Strengths: flexible generation. Weaknesses: hallucination, outdated knowledge, no persistent memory.

**Q11. What is ChatGPT?**
- **Solution:** OpenAI conversational LLM (GPT-4 family). Reasoning/generation engine — **not** a database, **not** guaranteed truth.

**Q12. Self-supervised vs common deep-learning?**
- **Solution:** Self-supervised uses unlabeled data but **creates labels from the data itself** (hide token, predict it). GPT = next-token; BERT = masked-token.

### Tutorial 2.2 — Deep Learning Technologies

**Q13. Evolution of AI?**
- **Solution:** 1950s symbolic → 1970s–80s expert systems (MYCIN) → 1990s–2000s classical ML (SVMs) → 2010s deep learning → 2020s transformers + LLMs → today: **agentic AI**.

**Q14. MLP structure + training + role of weights?**
- **Solution:** Input + ≥1 hidden + output layers. Cycle: **forward → loss → backprop → optimizer update**. **Weights** = connection strength; **biases** = activation thresholds. (W, b) store learned rules.

**Q15. Activation functions — purpose?**
- **Solution:** Compute z = Σwx + b, then `f(z)`. Purpose: **non-linearity** so layers don't collapse to one linear map.
- **Professor's Note:** Slide says "controls learning rate" — technically inaccurate; the real purpose is non-linearity.

**Q16. Examples of activation functions?**

| Function | Formula | Use |
|---|---|---|
| Sigmoid | 1/(1+e⁻ᶻ), range (0,1) | Binary classification |
| Tanh | (−1, 1) | Zero-centred |
| ReLU | max(0, z) | Default hidden |
| Leaky ReLU | z if z>0 else small·z | Prevents dead neurons |
| Softmax | normalised exp | Multi-class output |

**Q17. Loss function purpose?**
- **Solution:** Measures prediction error. Backprop computes gradients; optimizer updates W, b.

**Q18. Loss/activation in course MLP?**
- **Solution:** Sigmoid activation. Loss generic — typically MSE (regression) / cross-entropy (classification).

**Q19. Output of each MLP node?**
- **Solution:** `z = w₁x₁ + … + wₙxₙ + b`, then `h = f(z)`. Vector form: **h = f(Wx + b)**.

**Q20. How do MLPs learn?**
- **Solution:** Backprop + optimizer (GD/SGD).

**Q21. Backpropagation in detail?**
- **Solution:** Chain rule propagates gradients output→hidden→input. Optimizer updates W, b.

**Q22. Roles of activation + loss?**
- **Solution:** Activation = non-linearity + gradient shaping. Loss = training objective.

**Q23. Where are learned rules stored?**
- **Solution:** Trained **weights W and biases b**.

**Q24. MLP in production?**
- **Solution:** Inference = load W, b → preprocess → **forward pass only** → output. No backprop.

**Q25. Transformer in detail?**
- **Solution:** Tokens → embeddings + position → blocks of multi-head self-attention + FFN. GPT = decoder-only. **Loss = cross-entropy**. **Evaluation = perplexity** (pre-train) / accuracy (downstream). Self-supervised: next-token (GPT) or masked-token (BERT).

### Tutorial 2.3 — LangChain

**Q26. What is LangChain and motivation?**
- **Solution:** Framework for LLM-powered apps. Raw LLM can't remember conversations, access private docs, call tools, or run multi-step workflows. LangChain provides prompts, models, tools, chains, retrieval, vector stores, memory, agents.

**Q27. Major problems with LLMs?**
- **Solution:** No persistent memory; frozen knowledge; hallucination; limited context; no private-data access; weak multi-step; cannot take real actions.

**Q28. LangChain solutions?**
- **Solution:** **RAG**, **vector stores + retrievers**, **memory**, **tools**, **chains/runnables**, **agents**, **prompt templates**.

**Q29. Diagrams — conventional vs LangChain?**
- Conventional: `User → LLM → Response`
- LangChain: `User → Prompt Template → Memory + Retriever/Vector Store → LLM → Agent (decides tool) → Tools/APIs → Final Response`

**Q30. LangChain components?**

| Component | Role |
|---|---|
| Models | LLM/chat for generation |
| Prompts | Templates for input format |
| Memory | Conversation/state |
| Indexes | Organise docs |
| Retrievers | Fetch chunks |
| Vector stores | Embedding similarity |
| Chains / Runnables | Workflow steps |
| Agents | Choose tools dynamically |
| Tools | External actions |

**Q31. How LangChain mitigates LLM problems?**

| Problem | Mitigation |
|---|---|
| No state | Memory |
| Outdated/private knowledge | Retrievers + vector stores (RAG) |
| Hallucination | Ground in evidence |
| No external actions | Tools |
| Weak multi-step | Chains / Agents |
| Inconsistent prompting | Prompt templates |

**Q32. RAG?**
- **Solution:** docs → chunks → embed → vector store → query embed → top-k → inject → LLM grounded answer.

**Q33. Example?**
- **Solution:** "What does my CS496 tutorial say about LangChain memory?" Raw LLM guesses. LangChain: load tutorial → chunks → embeddings → retrieve relevant → inject → grounded answer.

**Q34. Roles of each LangChain component?**
- Memory = context; Indexes = organise; Retrievers = fetch; Vector stores = semantic DB; Prompts = format; Chains = fixed pipeline; Agents = decide; Tools = act.

**Q35. Pseudocode for complete LangChain RAG+memory app?**
```python
load documents from folder
split into chunks; embed; store in vector_store
retriever = vector_store.as_retriever()
chat_model = ChatOpenAI()
memory = ConversationBufferMemory()

def answer(q):
    chunks = retriever.search(q)
    prompt = template.format(context=chunks, chat_history=memory.load(), question=q)
    r = chat_model.invoke(prompt)
    memory.save(q, r); return r
```

### Tutorial 2.4 — Autonomous Agent Systems

**Q36. Traditional software vs Agentic AI?**

| Aspect | Traditional | Agentic |
|---|---|---|
| Control | Hard-coded | Agent chooses |
| Behaviour | Deterministic | Adaptive |
| Problem solving | Fixed rules | Perceive/reason/plan/act/learn |
| Memory | Explicit DB | Working/semantic/episodic |
| Tools | Pre-coded | Dynamically selected |
| Failure | Predefined exceptions | Re-plans, retries |

**Q37. Autonomous AI Agent?**
- **Solution:** System pursuing a goal by repeatedly **observing, reasoning, planning, acting, learning**. Has objective + memory + tools + control loop.
- **Professor's Note:** Slide 014. Franklin & Graesser: *"system situated within and a part of an environment that senses environment and acts on it, over time, in pursuit of its own agenda."*

**Q38. Architecture: traditional vs agentic?**
- Traditional: `Input → Predefined logic → DB/API → Output`
- Agentic: `Goal → Perception → Reasoning → Planning → Action/Tools → Observation → Learning/Memory → loop`

**Q39. Cognitive Loop?**
- **Solution:** Five phases:
  1. **Perception** — capture environment data
  2. **Reasoning** — infer intent/priority
  3. **Planning** — break goal into ordered steps
  4. **Action** — execute via tools/APIs
  5. **Learning** — evaluate outcome, update memory

**Q40. Perception — example + requirements?**
- **Solution:** "My payment failed and I need help now." Extract message, user ID, timestamp, channel, sentiment, intent, tx ID. Requires input sources, parsing, structured output, permissions.

**Q41. Reasoning — example?**
- **Solution:** Classify intent as billing/payment, detect urgency, check memory, decide: verify transaction. Uses LLM, rules, classifiers, retrieval.

**Q42. Planning — example?**
- **Solution:** "Book flight" → ask dates/destination → search flights → compare price/stops → select → enter details → confirm. Output = ordered plan with tools, info, expected results.

**Q43. Decisions + actions — example?**
- **Solution:** "Find best restaurant" → decide location/cuisine/budget → select tool (maps API) → filter → present. Decision = choose; Action = execute.

**Q44. Learning phase?**
- **Solution:** Evaluate success → store info → update strategies. Updates **memory/strategy**, not LLM weights.

**Q45. Memory types?**
- **Working** (current convo)
- **Short-term summary** (compressed)
- **Long-term semantic** (facts)
- **Episodic** (specific past events)
- **Procedural** (learned strategies)

**Q46. RAG role in informed agents?**
- **Solution:** Retrieve external/private/current knowledge + generate. Reduces hallucination, grounds reasoning.

**Q47. LangChain support for agents?**
- **Solution:** Models, prompts, tools, agents, memory, retrievers + vector stores, chains, **LangGraph** for stateful graph loops, multi-agent patterns.

---

## Part 2: The "Zero Gaps" Knowledge Base (Slide Focus — 30%)

### Slide 010 — Generative AI
- **Hierarchy**: AI ⊃ ML ⊃ Deep Learning ⊃ Generative AI.
- Uses **word embeddings**.
- **Transformer diagram**: Input → Token → Embedding → Encoder → Decoder → Generated text.
- **Foundation model**: multimodal training → adapted to Q&A, sentiment, info extraction, captioning, code gen.
- **Tuning methods**:
  - Supervised Fine-Tuning
  - **RLHF** (Reward Modelling + **PPO**)
  - Prompt Engineering + Few-Shot
  - Domain-Specific Tuning
  - Hyperparameter Tuning
- **Prompt types**: Direct Question, Instruction-Based, Creative, Problem Solving, Contextual Conversation, Coding Help.

### Slide 011 — Getting Started with LangChain
- Install: `pip install langchain langchain-openai langchain-community langchain-text-splitters langchain-postgres`.
- **LLM (string in/out)**:
```python
from langchain_openai.llms import OpenAI
model = OpenAI(model="gpt-3.5-turbo")
model.invoke("The sky is")
```
- **Key params**: `temperature` (0.1 predictable, 0.9 creative), `max_tokens`.
- **Chat model**:
```python
from langchain_openai.chat_models import ChatOpenAI
from langchain_core.messages import HumanMessage
ChatOpenAI().invoke([HumanMessage("What is the capital of France?")])
```
- **Message types**: `HumanMessage`, `AIMessage`, `SystemMessage`, `ChatMessage`.
- **LangGraph**: adds **cycles** to LangChain (which is DAG-only). Concepts: **StateGraph**, **Nodes**, **Edges** (incl. **conditional edges**).

### Slide 012 — MLP: How It Works
- **DL structure**: Input + Hidden (deep = multiple) + Output layers.
- **ANN needs**: learning process, optimizer, loss, activation.
- **Forward pass**:
  - `h₁⁽²⁾ = f(w₁₁⁽¹⁾x₁ + w₁₂⁽¹⁾x₂ + w₁₃⁽¹⁾x₃ + b₁⁽¹⁾)`
  - Vectorised: `z⁽²⁾ = W⁽¹⁾x + b⁽¹⁾`, `h⁽²⁾ = f(z⁽²⁾)`
- **NumPy**:
```python
def matrix_feed_forward_calc(n_layers, x, w, b):
    for l in range(n_layers-1):
        node_in = x if l == 0 else h
        z = w[l].dot(node_in) + b[l]
        h = f(z)
    return h
```
- **Gradient descent**:
```python
x_new = 6; gamma = 0.01; precision = 0.00001
def df(x): return 4*x**3 - 9*x**2
while abs(x_new - x_old) > precision:
    x_old = x_new
    x_new += -gamma * df(x_old)
```
- **Tasks**: Detection, Classification, Prediction, Generation.

### Slide 013 — The Context (RAG)
- **Context window** = max tokens an LLM attends to.
- **RAG pipeline**: docs → chunks → embed → vector store → query embed → top-k → inject → answer.
- **Memory types**: working (`ConversationBufferMemory`), summary (`ConversationSummaryMemory`), semantic (`Chroma`), episodic, procedural.

### Slide 014 — Agentic AI Revolution
- **Six traits of intelligent agents**:
  - **Autonomy**, **Persistence**, **Reactivity**, **Proactiveness**, **Adaptability**, **Goal-orientation**.
- Franklin & Graesser definition.
- Eras: rule-based (MYCIN) → ML (SVMs) → deep learning (ImageNet) → LLM agents (GPT-4, AutoGen).
- **Cohesion**: Perception modules, Planning engines, Memory subsystems, Execution layers.
- **Frameworks named**: **LangGraph**, **CrewAI**.

### Slide 015 — LangChain Cognitive Loop Demo
- Five module classes:
  - **PerceptionModule** — `perceive_text_input` (sentiment, entities), sensory_buffer
  - **ReasoningModule** — `analyze_situation`, `reason_about_approach`, confidence assessment
  - **PlanningModule** — `create_plan`, `adapt_plan`
  - **ActionModule** — `execute_plan`, `_select_tool_for_step` (WebSearch, Calculator, MemorySearch)
  - **LearningModule** — episodic list, semantic (`Chroma`), procedural dict, meta-learning
- **MemorySystem** initialises 5 memory types.
- **CognitiveAgent.process_input**: Perceive → Memory Retrieval → Reason → Plan → Act (re-plan on failure) → Learn → Respond.
- **Tools**: `Tool(name, func, description)`.

### Slide 016 — LangChain Multi-Agent
- Specialised **ResearchAgent**, **AnalysisAgent**, **WritingAgent** with own `Tool`, `ChatPromptTemplate`, `MessagesPlaceholder(variable_name="agent_scratchpad")`, built via `create_openai_functions_agent` + `AgentExecutor`.
- **TeamOrchestrator** runs Research → Analysis → Writing.

### Slide 017 — AutoGen Single Agent
- **Classes**: `autogen.AssistantAgent` (LLM specialist), `autogen.UserProxyAgent` (represents human / executes code).
- **llm_config**: `config_list`, `temperature`, `timeout`.
- **UserProxyAgent params**: `human_input_mode` ("NEVER"/"ALWAYS"/"TERMINATE"), `max_consecutive_auto_reply`, `is_termination_msg`, `code_execution_config`.
- **Start**: `user_proxy.initiate_chat(assistant, message=task)`.
- **Custom functions**: `autogen.register_function(fn, caller=assistant, executor=user_proxy, description=...)`.

### Slide 018 — AutoGen Multi-Agent
- **Core classes**: `AssistantAgent`, `UserProxyAgent`, **`GroupChat`**, **`GroupChatManager`**.
- **GroupChat params**: `agents`, `messages`, `max_round`, `speaker_selection_method` ("auto"/"manual"/"round_robin").
- **GroupChatManager** coordinates with own `llm_config`.
- Roles: UserProxy, Researcher, Planner, Writer, Critic, Coder.

### Slide 019 — CrewAI Single Agent
- **Abstractions**: `Agent`, `Task`, `Crew`, `Process`.
- **Agent params**: `role`, `goal`, `backstory`, `tools`, `llm`, `verbose`, `allow_delegation`.
- **Task params**: `description`, `agent`, `expected_output`.
- **Crew params**: `agents`, `tasks`, `process` (`Process.sequential` / `Process.hierarchical`), `verbose`.
- **Launch**: `crew.kickoff()`.

### Slide 020 — CrewAI Multi-Agent
- Multiple agents with role/goal/backstory/tools (Market Research Analyst, Content Strategist, Copywriter, SM Manager, SEO).
- **`allow_delegation=True`** for manager-style coordination.
- **`Process.hierarchical`** requires `manager_llm=llm`.

### Pros vs Cons
- **LangChain**: modular, huge ecosystem; DAGs only natively (use LangGraph for loops).
- **AutoGen**: first-class multi-agent, `GroupChatManager`, code execution via `UserProxyAgent`; can over-chat.
- **CrewAI**: clean role/goal/backstory, sequential vs hierarchical; less granular state-graph control.

---

## Part 3: Rapid Recall Quiz

**Q1.** GPT-style ChatGPT primarily uses:
A) Encoder-only Transformer bidirectional
B) Decoder-only Transformer masked self-attention
C) Seq2Seq LSTM
D) GAN

**Q2.** In MLP, "learned rules" stored in:
A) Activations  B) Loss  C) Weights W and biases b  D) Learning rate

**Q3.** AutoGen class coordinating speaker selection in a `GroupChat`:
A) `AssistantAgent`  B) `UserProxyAgent`  C) `GroupChatManager`  D) `AgentExecutor`

**Q4.** CrewAI `Process` that requires `manager_llm`:
A) `sequential`  B) `parallel`  C) `hierarchical`  D) `round_robin`

**Q5.** In LangChain Cognitive Loop, memory type for **specific past experiences**:
A) Working  B) Semantic  C) Episodic  D) Procedural

### Answer Key
1. **B** — GPT = decoder-only with masked self-attention.
2. **C** — W and b store learned knowledge.
3. **C** — `GroupChatManager(groupchat=..., llm_config=...)`.
4. **C** — Hierarchical requires `manager_llm=llm`.
5. **C** — Episodic = specific experiences.

---

### Final memorisation cheats for 100%
- **5-phase cognitive loop**: Perception → Reasoning → Planning → Action → Learning
- LangChain component table (Memory, Indexes, Retrievers, Vector stores, Chains, Agents, Tools, Prompts)
- AutoGen classes (`AssistantAgent`, `UserProxyAgent`, `GroupChat`, `GroupChatManager`)
- CrewAI classes (`Agent`, `Task`, `Crew`, `Process` sequential/hierarchical)
- MLP forward: **h = f(Wx + b)**, sigmoid 1/(1+e⁻ᶻ)
- GPT = Generative Pre-trained Transformer, decoder-only, autoregressive next-token prediction
