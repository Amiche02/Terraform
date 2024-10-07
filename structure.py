import os

def list_directory_structure(startpath):
    for root, dirs, files in os.walk(startpath):
        # Exclude node_modules directory
        dirs[:] = [d for d in dirs if d != 'node_modules']
        
        # Get depth of current folder to format the output properly
        depth = root.replace(startpath, '').count(os.sep)
        indent = ' ' * 4 * depth
        print(f'{indent}{os.path.basename(root)}/')

        # Print the files inside each folder
        sub_indent = ' ' * 4 * (depth + 1)
        for file in files:
            print(f'{sub_indent}{file}')

# Get the current directory where the script is executed
current_path = os.getcwd()

# Call the function to list the directory structure
list_directory_structure(current_path)