# lex-cognitive-nostalgia

Nostalgic memory model for LegionIO cognitive agents. Memories gain warmth as temporal distance increases (logarithmic growth). Rosy retrospection occurs when warmth exceeds original valence. Bittersweet memories are warm but were originally painful.

## What It Does

- Store memories with original valence scores
- Warmth grows logarithmically with temporal distance via `age_memories`
- Rosy retrospection detection: warmth > original valence AND warmth > 0.6
- Bittersweet detection: rosy memory with original valence < 0.5
- Domain-grouped warmth analysis
- Nostalgia proneness composite score
- Two runner modules: `Recall` (storage + aging) and `Analysis` (retrospective patterns)

## Usage

```ruby
# Store memories
runner.store_memory(content: 'first successful deploy',
                     domain: :work, original_valence: 0.7)
runner.store_memory(content: 'difficult team conflict',
                     domain: :work, original_valence: 0.2)

# Age memories over time (call each tick cycle)
runner.age_memories
runner.age_memories
# ... warmth grows logarithmically with each aging cycle

# Check nostalgic warmth
runner.nostalgia_report
# => { success: true, total_memories: 2, rosy_count: 0, avg_warmth: 0.34, ... }

# Analysis
runner.rosy_retrospection_index
# => { success: true, index: 0.0, total: 2, rosy: 0 }

runner.bittersweet_memories
# (after sufficient aging: originally painful memories that have become warm)

runner.warmth_by_domain
# => { success: true, domains: { work: 0.36 } }
```

## Development

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

## License

MIT
