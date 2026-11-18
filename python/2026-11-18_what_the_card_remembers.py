# What the Card Remembers | DataDriven daily | 2026-11-18 | Python
# Asked in: Capital One
# Q: For each card, merge holds [start, end] that overlap or touch, earliest first.

# Step 1: Sort holds by start
# Step 2: Group by card in a dict
# Step 3: Overlap with last window -> stretch end, else add new window

def merge_holds(holds):
    holds.sort(key=lambda h: h["start"])
    result = {}
    for h in holds:
        card = h["card"]
        start = h["start"]
        end = h["end"]
        if card not in result:
            result[card] = [[start, end]]
        else:
            last = result[card][-1]
            if start <= last[1]:
                last[1] = max(end, last[1])
            else:
                result[card].append([start, end])
    return result

# Learned:
# - {} dict: get by name h["card"]. [] list: get by number last[1].
# - Build outside -> in: {} -> result[card] = [...] -> .append(...)
# - Sort first, then only compare with the last window [-1].
# - Overlap: start <= last end. New end = max of both ends.
