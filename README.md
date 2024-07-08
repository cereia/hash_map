# linked_lists

The goal of this project is to create a linked list data structure.

Two classes will be needed:
- LinkedList to represent the full list
- Node to contain a #value method and a link to the #next_node with both set to nil by default

LinkedList will contain these methods:
- #append(value) adds a new node containing value to the end of the list
- #prepend(value) adds a new node containing value to the beginning of the list
- #size returns the total number of nodes in the list
- #head returns the first node of the list
- #tail returns the last node of the list
- #at(index) returns the node at index
- #pop removes the last node from the list
- #contains?(value) returns true if the value is in the list and false if it's not
- #find(value) returns the index of the node if found and nil if not found
- #to_s represents the list as a string for printing