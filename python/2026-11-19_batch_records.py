# Batch Records | DataDriven daily | 2026-11-19 | Python
# Q: Split records into batches of at most n, keep order.

# Step 1: Empty list for batches
# Step 2: Jump through records n at a time (0, 2, 4...)
# Step 3: Slice from i to i+n, append
# Step 4: Return

def chunk_list(records, n):
    result = []
    for i in range(0, len(records), n):
        result.append(records[i:i+n])
    return result

# Other way (chop the front):
# while records: result.append(records[:n]); records = records[n:]

# Learned:
# - range(start, stop, step) jumps: range(0, 5, 2) -> 0, 2, 4
# - Slicing: x[a:b] takes a up to (not incl.) b. Past the end = OK.
# - len(x) in Python, not x.length
# - print() to test, like running SQL step by step
# - Find the pattern by hand first, then turn it into code.
# Learn next: Loops -> range(); Lists -> List Slicing
