# hash_map

The goal is to make your own implementation of a hash map that has the following methods:
- #hash(key) that takes a key and produces a hash
- #set(key, value) takes a key and value and sets the value of that key in that bucket to value, even if another value already exists for that key
- #get(key) takes a key argument and returns that value of that key if found or nil if not
- #has?(key) tkaes a key argument and returns true if that key is found in the hash map and false if it isn't
- #remove(key) takes a key argument and removes the entry with that key and returns the deleted entry's value if found. If the key isn't in the hash map, it returns nil
- #length returns the number of stored keys in the hash map
- #clear removes all entries of the hash map
- #keys returns an array of all the keys in the hash map
- #values returns an array of all the values of the hash map
- #entries returns an array that contains each key, value pair