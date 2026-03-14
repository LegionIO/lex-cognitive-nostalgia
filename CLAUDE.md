# lex-cognitive-nostalgia

**Level 3 Leaf Documentation**
- **Parent**: `/Users/miverso2/rubymine/legion/extensions-agentic/CLAUDE.md`

## Purpose

Nostalgic memory model capturing how memories change emotionally over time. Memories have an original valence and a warmth score that grows logarithmically with temporal distance. Rosy retrospection occurs when warmth exceeds the original valence. Bittersweet memories combine high nostalgic warmth with low original valence. Two runner modules split responsibilities between active recall/aging operations and retrospective analysis.

## Gem Info

- **Gem name**: `lex-cognitive-nostalgia`
- **Module**: `Legion::Extensions::CognitiveNostalgia`
- **Version**: `0.1.0`
- **Ruby**: `>= 3.4`
- **License**: MIT

## File Structure

```
lib/legion/extensions/cognitive_nostalgia/
  version.rb
  client.rb
  helpers/
    constants.rb
    nostalgic_memory.rb
  runners/
    recall.rb
    analysis.rb
```

## Key Constants

| Constant | Value | Purpose |
|---|---|---|
| `MAX_MEMORIES` | `300` | Per-engine memory capacity |
| `DEFAULT_WARMTH` | `0.3` | Starting warmth for new memories |
| `WARMTH_GROWTH` | `0.02` | Base warmth increase per `age!` cycle |
| `WARMTH_CEILING` | `0.95` | Maximum achievable warmth |
| `WARMTH_DECAY` | `0.01` | Per-cycle warmth reduction (overcomes growth at ceiling) |
| `ROSY_THRESHOLD` | `0.6` | Warmth above which rosy retrospection is possible |
| `BITTERSWEET_THRESHOLD` | `0.5` | Original valence below which bittersweet detection applies |
| `MEMORY_DOMAINS` | symbol array | Valid domain categories |
| `WARMTH_LABELS` | range hash | From `:cold` to `:glowing` |
| `NOSTALGIA_LABELS` | range hash | Combined warmth + temporal distance labels |
| `RETROSPECTION_LABELS` | range hash | Degree of rosy retrospection |

## Helpers

### `Helpers::NostalgicMemory`
Individual nostalgic memory. Has `id`, `content`, `domain`, `original_valence`, `warmth`, `temporal_distance` (integer cycle count), and `created_at`.

- `age!` — increments `temporal_distance`; warmth grows logarithmically with distance (`WARMTH_GROWTH * log(temporal_distance + 1)`)
- `warm!(amount)` — directly increases warmth (up to `WARMTH_CEILING`)
- `cool!(amount)` — directly decreases warmth (floor 0)
- `rosy?` — warmth > original_valence AND warmth > `ROSY_THRESHOLD`
- `bittersweet?` — rosy AND original_valence < `BITTERSWEET_THRESHOLD`
- `warmth_label`

## Runners

### `Runners::Recall`
| Method | Description |
|---|---|
| `store_memory(content:, domain:, original_valence:)` | Store a new nostalgic memory |
| `trigger_nostalgia(memory_id:)` | Manually warm a specific memory |
| `age_memories` | Apply one age cycle to all memories |
| `nostalgia_report` | Aggregate stats |

### `Runners::Analysis`
| Method | Description |
|---|---|
| `warmth_by_domain` | Average warmth grouped by domain |
| `rosy_retrospection_index` | Ratio of rosy memories to total |
| `nostalgia_proneness` | Composite nostalgia tendency score |
| `most_nostalgic_domains` | Domains with highest average warmth |
| `bittersweet_memories` | Memories that are both warm and low original valence |

All runners return `{success: true/false, ...}` hashes.

## Integration Points

- `lex-emotion`: nostalgic warmth adds a positive valence bias; bittersweet memories add mixed valence
- `lex-memory`: nostalgic memories are a layer above lex-memory traces — they represent the emotional reinterpretation of stored experiences
- `lex-tick` dormant phases: `age_memories` is a natural dormant-cycle operation
- `lex-identity`: rosy retrospection of prior behavioral patterns can bias behavioral fingerprint drift detection

## Development Notes

- `Client` includes both runner modules (`Recall` and `Analysis`)
- Warmth grows logarithmically: `WARMTH_GROWTH * Math.log(temporal_distance + 1)` — growth slows as time passes
- `age!` is a discrete cycle operation; continuous time is approximated by cycle count
- `bittersweet?` requires both rosy conditions AND original_valence below `BITTERSWEET_THRESHOLD`: it's high warmth applied to a memory that was originally painful
- `nostalgia_proneness` is a composite derived from rosy_retrospection_index and average warmth
