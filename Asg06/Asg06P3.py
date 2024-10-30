# William Romine
# 00103649
# Dr. Lewis CS414

# https://python-forum.io/thread-34891.html

class ASTNode:
    def __init__(self, command, argument=None):
        self.command = command
        self.argument = argument

    def __repr__(self):
        return f"ASTNode(command={self.command}, argument={self.argument})"

def is_valid_folder(folder):
    """Check if the folder name is valid according to the specified rules."""
    parts = folder.split("\\")
    return folder.startswith("\\") and all(len(part) <= 8 for part in parts)

def is_valid_filename(filename):
    """Check if the filename is valid according to the specified rules."""
    parts = filename.split(".")
    return len(parts) == 2 and len(parts[0]) <= 8 and len(parts[1]) <= 3

def parse(tokens):
    """Parse the list of tokens into an Abstract Syntax Tree (AST)."""
    if not tokens:
        raise ValueError("No tokens to parse")
    
    command = tokens[0]
    argument = None

    # Validate
    if command not in ['ls', 'cd', 'cat', 'print', 'exec']:
        raise ValueError(f"Invalid command: {command}")

    # Check for arguments
    if len(tokens) > 2:
        raise ValueError(f"Too many arguments for command '{command}'")

    # Handle argument
    if len(tokens) == 2:
        argument = tokens[1]

        # Validate the argument
        if command in ['ls', 'cd'] and not is_valid_folder(argument):
            raise ValueError(f"Invalid folder name for command '{command}': {argument}")
        elif command in ['cat', 'print', 'exec'] and not is_valid_filename(argument):
            raise ValueError(f"Invalid filename for command '{command}': {argument}")

    return ASTNode(command, argument)

# Example with an valid folder
try:
    tokens = ['cd', '\\folder1\\folder2']
    ast = parse(tokens)
    print(ast)  # Output: ASTNode(command=cd, argument=\folder1\folder2)
except ValueError as e:
    print(e)

# Example with an invalid folder
try:
    tokens = ['cd', '\\folder1\\folder2\\']
    ast = parse(tokens)
    print(ast)
except ValueError as e:
    print(e)  # Output: Invalid folder name for command 'cd': \folder1\folder2\