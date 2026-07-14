# Testing

The LRU Cache library employs a testing strategy designed to verify functionality under various states and edge cases. Tests focus on asserting that keys are properly rotated, that the cache strictly respects the maximum capacity limit, and that the `memoize` function accurately avoids redundant executions.

We use the `genie` task manager alongside the `amen` assertion framework to orchestrate and evaluate these tests. Tests evaluate common lifecycle events, such as inserting items beyond capacity and refreshing items via access, to maintain confidence in the core LRU behavior.

To run the test suite locally, execute the following command in your terminal:

```bash
npx genie test
```
