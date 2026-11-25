# The Chunked Reader | DataDriven daily | 2026-11-25 | Python
# Asked in: Athenahealth
# Q: Split lines into batches of chunk_size, keep order.

# Step 1: Empty list for batches
# Step 2: Jump through lines chunk_size at a time
# Step 3: Slice from i to i+chunk_size, append
# Step 4: Return

def chunked_read(lines, chunk_size):
    result = []
    for i in range(0, len(lines), chunk_size):
        result.append(lines[i:i+chunk_size])
    return result

# Learned:
# - Same pattern as Batch Records (19 Nov).
# - append( ) uses round brackets, not [ ].
# - A slice is already a list: no extra [ ] around it.
# - x[i] can IndexError. x[i:j] slice never errors.
# - Test outside the function -> create the test data first.
