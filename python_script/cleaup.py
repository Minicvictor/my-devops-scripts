mport subprocess

print("Running in Dry-Run Mode: No files will actually be deleted.")
print("")

result = subprocess.run(["ls"], capture_output=True, text=True)

if result.returncode != 0:
        print("ERROR: Command failed. Folder may not exist.")
else:
     files = result.stdout.splitlines()
     print(f"Total files found: {len(files)}")
     print("")
     print("Scanning for temporary files...")
     print("")
     for file in files:
         if file.endswith(".tmp") or file.endswith(".log"):
             print(f"FOUND: {file} - Ready for deletion.")
