# Instincts — Always-On Behavioral Rules
# Loaded at every session start. Max 15 instincts.
# See Module 15 Section 4 for full documentation.

## Instinct: Search before writing
- **Rule:** Always search for existing implementations before writing new code
- **Why:** Prevents reinventing the wheel and ensures consistency with existing patterns
- **Added:** 2026-03-29
- **Source:** System default

## Instinct: Test before claiming done
- **Rule:** Always run tests before claiming a task is complete
- **Why:** Terminal verification is mandatory (Module 11 Section 3c)
- **Added:** 2026-03-29
- **Source:** System default

## Instinct: Flag security-sensitive changes
- **Rule:** Never modify auth, payment, or security code without explicitly flagging it
- **Why:** Security changes require elevated review — silent changes create risk
- **Added:** 2026-03-29
- **Source:** System default

## Instinct: Check skills first
- **Rule:** Always check if a skill exists for the current task type before building from scratch
- **Why:** Skills encode proven patterns — building from scratch ignores accumulated knowledge
- **Added:** 2026-03-29
- **Source:** System default

## Instinct: Read before editing
- **Rule:** Read the file before editing it — never edit blind
- **Why:** Editing without reading causes regressions and misunderstandings of existing code
- **Added:** 2026-03-29
- **Source:** System default

## Instinct: Run autonomously
- **Rule:** Never ask user to execute commands. Run, debug, fix independently.
- **Why:** User context switches are expensive; own the full pipeline
- **Added:** 2026-03-29
- **Source:** feedback_dev.md

## Instinct: No placeholders
- **Rule:** Use real images, real content, real data. Never placeholder text or stock icons.
- **Why:** Placeholders create "AI slop" look that requires full rework
- **Added:** 2026-03-29
- **Source:** feedback_design.md

## Instinct: Verify environment first
- **Rule:** Check all required env vars exist before running commands
- **Why:** Missing env vars cause cryptic errors that waste debugging time
- **Added:** 2026-03-29
- **Source:** feedback_dev.md

## Instinct: Debug with evidence, not guesses
- **Rule:** After 1-2 failed fix attempts, read the source code instead of guessing
- **Why:** Guessing compounds errors; reading source reveals root cause
- **Added:** 2026-03-29
- **Source:** feedback_dev.md

## Instinct: Build complete solutions
- **Rule:** No "fix later" or "TODO" in delivered code. Full solution first time.
- **Why:** Incomplete solutions create tech debt that compounds
- **Added:** 2026-03-29
- **Source:** feedback_dev.md

## Instinct: Check git root
- **Rule:** Run git rev-parse --show-toplevel before first commit in any session
- **Why:** Prevents committing from wrong directory or nested repo
- **Added:** 2026-03-29
- **Source:** feedback_dev.md

## Instinct: Brief and autonomous communication
- **Rule:** Don't ask what to do next. Don't summarize what you just did. Own the session.
- **Why:** User reads the diff; summaries waste tokens and time
- **Added:** 2026-03-29
- **Source:** feedback_communication.md
