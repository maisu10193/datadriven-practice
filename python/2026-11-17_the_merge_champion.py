# The Merge Champion | DataDriven daily | 2026-11-17 | Python
# Asked in: Citadel
# Q: Combine several already-sorted lists into one list, smallest to biggest.

# Step 1: Empty list to collect everything
# Step 2: Loop through each inner list and add all its items
# Step 3: Sort the result
# Step 4: Return it

def merge_k_sorted(lists: list) -> list:
    result = []
    for a in lists:
        result.extend(a)
    result.sort()
    return result

# Learned:
# - extend = open the box, add each item. append = add the whole box as 1 item.
# - list (type) vs lists (my input): one letter -> TypeError: 'type' object is not iterable
# - result.sort() sorts in place and returns None. Don't write result = result.sort()
# - sorted(result) returns a new sorted list -> needs result = sorted(result)
# - thing.method() acts on the thing; function(thing) hands it to a tool.
