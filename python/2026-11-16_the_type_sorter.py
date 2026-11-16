# The Type Sorter | DataDriven daily | 2026-11-16 | Python
# Q: Return only values that are exactly int (not bool/float), keep order.

# Step 1: Empty list to collect answers
# Step 2: Loop through each item
# Step 3: If type is exactly int, add it
# Step 4: Return the list

def filter_integers(items: list) -> list[int]:
    result = []
    for x in items:
        if type(x) == int:
            result.append(x)
    return result

# Learned:
# - Lines ending with ":" (def, for, if) open a new level. Forgot it after if.
# - Same level = same indent. Once -> level 1, every item -> in for, only if true -> in if.
# - Make the list before the loop. return after the loop.
# - type(x) == int skips True (isinstance would count it).
# - Collect pattern: empty list -> for -> if -> append -> return
