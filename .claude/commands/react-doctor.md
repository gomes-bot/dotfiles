# React Doctor - ShapeShift Codebase Scanner

Run react-doctor against the ShapeShift Web codebase and interpret results through our conventions.

## Instructions

1. Run react-doctor on the codebase:
```bash
npx -y react-doctor@latest --no-ami --offline -y /Users/gomes/Sites/shapeshiftWeb
```

If the main app isn't detected as a workspace package, also try targeting specific directories:
```bash
npx -y react-doctor@latest --no-ami --offline --diff develop
```

2. Analyze the output against ShapeShift conventions (below) and produce a **prioritized action plan**.

3. For each finding, classify as:
   - **FIX** - violates our conventions, should be fixed
   - **IGNORE** - doesn't apply to our codebase or is a false positive
   - **INVESTIGATE** - needs human judgment

## ShapeShift Convention Overrides

When interpreting react-doctor results, apply these codebase-specific rules:

### Rules we AGREE with (fix these)
- `set-state-in-effect` - We avoid useEffect for derived state. Use useMemo or computed values instead.
- `no-derived-useState` - We use `useMemo` or `userSelected ?? smartDefault ?? fallback` pattern, not useState from props.
- `no-effect-event-handler` - We avoid useEffect where practical. Event handlers should be direct, not simulated via effects.
- `rerender-memo-with-default-value` - We memoize aggressively. Default `[]` or `{}` prop values defeat memo(). Hoist to module-level const.
- `no-giant-component` - Components over 500 lines should be split. Extract sub-components with memo().
- Dead code / unused exports - Clean these up.

### Rules to CONTEXTUALIZE (not auto-fix)
- `prefer-useReducer` - We don't mandate useReducer. Many useState calls in a component is fine if the states are independent. Only flag if states are interdependent and would benefit from a reducer.
- `jsx-a11y/no-autofocus` - Context-dependent. Modals and search inputs legitimately use autoFocus. Only flag for non-modal, non-search contexts.
- `todo` (try/catch/finally blocks) - React Compiler compatibility. Flag for awareness but don't refactor stable code just for this.

### Rules that DON'T APPLY
- Anything about Next.js, RSC, Server Components, `next/dynamic`, `getServerSideProps`, etc. - We're a Vite SPA.
- Anything about SWR - We use Redux Toolkit.
- Anything about hydration - No SSR.

### Additional checks react-doctor DOESN'T cover (scan for these too)
- **`interface` instead of `type`** for prop definitions - should always be `type`
- **`export default`** (warning) - prefer named exports, but default exports are fine when required (e.g. React.lazy, route components, some library patterns)
- **`function` declarations** for components - should be `const` arrow functions
- **Missing memo()** on components that receive props
- **Missing useMemo/useCallback** on derived values and callbacks
- **`let` usage** (warning, not error) - prefer `const` with IIFE switch or extracted function where practical
- **useEffect for derived state** - should be useMemo
- **Inline `[]` or `{}` as default prop values** - hoist to module-level const
- **Static JSX in render** (icons, fallbacks) - hoist to module-level const outside component
- **Static style objects in render** - hoist to module-level const
- **Hardcoded strings** instead of translate() keys
- **Missing useColorModeValue** for colors that should vary by theme

## Output format

```
## React Doctor Report - ShapeShift Web

**Score**: X/100
**Scan scope**: [what was scanned]

### Critical (FIX)
1. [file:line] - [rule] - [description] - [suggested fix]

### Warnings (FIX)
1. [file:line] - [rule] - [description] - [suggested fix]

### Contextual (INVESTIGATE)
1. [file:line] - [rule] - [description] - [why it needs human judgment]

### Ignored
- [rule] - [why it doesn't apply]

### Codebase Convention Violations (not from react-doctor)
1. [file:line] - [convention violated] - [suggested fix]

### Summary
- X critical issues to fix
- X warnings to address
- X items needing investigation
- X convention violations found
```
