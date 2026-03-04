import os
import re

# =========================
# PASTE YOUR DATA BELOW
# =========================
DATA = """
category-singleword category-singleword-wordy_words
singleword[sound:category-singleword.mp3]    wordy words[sound:category-singleword-wordy_words.mp3]
"""
# =========================


missing_files = set()
found_files = set()

# Regex for [sound:filename.mp3]
sound_pattern = re.compile(r"\[sound:([^\]]+?\.mp3)\]")

lines = DATA.strip().split("\n")

for line in lines:
    if not line.strip():
        continue

    # 1. Extract [sound:....mp3] format
    sound_matches = sound_pattern.findall(line)
    for match in sound_matches:
        found_files.add(match.strip())

    # 2. Handle TSV plain format
    parts = line.split("\t")
    for part in parts:
        part = part.strip()

        # If it does NOT contain [sound:], assume raw ID
        #if "[sound:" not in part and part:
        #    filename = part + ".mp3"
        #    found_files.add(filename)

# Now check existence
for filename in found_files:
    if not os.path.isfile(filename):
        missing_files.add(filename)

# Report
if missing_files:
    print("! Missing files:\n")
    for f in sorted(missing_files):
        print(f"- {f}")
    print(f"\nTotal missing: {len(missing_files)}")
else:
    print("All files exist.")