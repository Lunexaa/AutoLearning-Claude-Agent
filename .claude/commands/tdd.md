---
description: Test-Driven Development using the red-green-refactor cycle. Write failing test first, then implement, then refactor.
---

# TDD Command

Develop a feature using strict Test-Driven Development.

**Feature:** $ARGUMENTS

## Instructions

Load and follow the **tdd-guide** agent (`~/.claude/agents/tdd-guide.md`) for detailed TDD patterns and best practices.

Execute the red-green-refactor cycle for each unit of behavior:

### 1. RED -- Write a Failing Test

- Analyze the feature description and break it into small testable behaviors
- Write the simplest test that describes the next behavior
- Run tests -- confirm the new test FAILS (expected failure)
- If it passes without implementation, the test is wrong -- rewrite it

### 2. GREEN -- Make It Pass

- Write the minimal code to make the failing test pass
- Do NOT add logic beyond what the test requires
- Run tests -- confirm ALL tests PASS
- If any test fails, fix before continuing

### 3. REFACTOR -- Clean Up

- Improve code structure without changing behavior
- Remove duplication, improve naming, simplify logic
- Run tests -- confirm ALL tests still PASS
- If any test fails, undo the refactor and try again

## Cycle Rules

- Repeat RED-GREEN-REFACTOR for each behavior until the feature is complete
- Never write implementation before the test
- Each cycle should take 2-5 minutes of work
- Keep tests fast and isolated
- Show test output after every step (no hedging -- actual terminal output)

## Output Format

For each cycle, report:

```
CYCLE N: [behavior being tested]
  RED:      test written, fails as expected
  GREEN:    implementation added, all tests pass
  REFACTOR: [what was improved, or "no changes needed"]
```

Final summary: total cycles, total tests, all passing.
