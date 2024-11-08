# William Romine
# 00103649
# Dr. Lewis CS414

# https://python-forum.io/thread-34891.html
# https://ruslanspivak.com/lsbasi-part1/

class ASTNode:
    def __init__(self, command, argument=None, variable=None, value=None):
        self.command = command
        self.argument = argument
        self.variable = variable
        self.value = value

    def __repr__(self):
        return f"ASTNode(command={self.command}, argument={self.argument}, variable={self.variable}, value={self.value})"

def parse(tokens):
    """Parse the list of tokens into an Abstract Syntax Tree (AST)."""
    if not tokens:
        raise ValueError("No tokens to parse")
    
    command = tokens[0]
    argument = None
    variable = None 
    value = None

    # Validate command
    if command not in ['ls', 'cd', 'cat', 'print', 'exec', 'SET', 'echo']:
        raise ValueError(f"Invalid command: {command}")

    # Handle SET command
    if command == 'SET':
        if len(tokens) != 4 or tokens[2] != '=':
            raise ValueError("SET command must be in the form: SET <VARIABLE> = <VALUE>")
        variable = tokens[1]
        if not is_valid_variable(variable):
            raise ValueError(f"Invalid variable name in SET command: {variable}")
        value = tokens[3]
        return ASTNode(command, variable=variable, value=value)

    # Check for arguments for other commands
    if len(tokens) > 2:
        raise ValueError(f"Too many arguments for command '{command}'")

    # Handle argument
    if len(tokens) == 2:
        argument = tokens[1]

        # Validate the argument based on the command type
        if command in ['ls', 'cd']:
            if not (is_valid_folder(argument) or is_valid_variable(argument)):
                raise ValueError(f"Invalid folder or variable name for command '{command}': {argument}")
        elif command in ['cat', 'print', 'exec']:
            if not (is_valid_filename(argument) or is_valid_variable(argument)):
                raise ValueError(f"Invalid filename or variable name for command '{command}': {argument}")
        elif command == 'echo':
            if not is_valid_variable(argument):
                raise ValueError(f"Invalid variable for echo command: {argument}")

    return ASTNode(command, argument, variable, value)

def is_valid_folder(folder):
    """Check if the folder name is valid according to the specified rules."""
    parts = folder.split("\\")
    return folder.startswith("\\") and all(len(part) <= 8 for part in parts)

def is_valid_filename(filename):
    """Check if the filename is valid according to the specified rules."""
    parts = filename.split(".")
    return len(parts) == 2 and len(parts[0]) <= 8 and len(parts[1]) <= 3

def is_valid_variable(variable):
    """Check if the variable name is valid according to the specified rules."""
    return variable.startswith('$') and len(variable) > 1 and variable[1:].isalnum()

# Example with a valid SET command
try:
    tokens = ['SET', '$myVar', '=', 'hello']
    ast = parse(tokens)
    print(ast)  # Output: ASTNode(command=SET, variable=$myVar, value=hello)
except ValueError as e:
    print(e)

# Example with a valid echo command
try:
    tokens = ['echo', '$myVar']
    ast = parse(tokens)
    print(ast)  # Output: ASTNode(command=echo, argument=$myVar)
except ValueError as e:
    print(e)
