import os
import subprocess


def execute_robot_file(file_path):
   try:
      completed_process = subprocess.run(['robot', file_path], capture_output=True, text=True)
      if completed_process.returncode == 0:
         print("Execution successful.")
         print("Output:")
         print(completed_process.stdout)
      else:
         print(f"Error: Failed to execute '{file_path}'.")
         print("Error output:")
         print(completed_process.stderr)
   except FileNotFoundError:
      print(f"Error: The file '{file_path}' does not exist.")

# Specify the directory path
#path = r'os.getcwd()'
#file_name = 'wikipedia.har'
file_path = 'har.robot'
execute_robot_file(file_path)

