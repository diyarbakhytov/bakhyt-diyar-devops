import os
import time

print("================================")
print("DevOps Student Application")
print("================================")
print()
print(f"Name: {os.getenv('STUDENT_NAME', 'Diyar')}")
print(f"Surname: {os.getenv('STUDENT_SURNAME', 'Bakhyt')}")
print(f"Group: {os.getenv('STUDENT_GROUP', 'IT2-2301')}")
print(f"Student ID: {os.getenv('STUDENT_ID', '38310')}")
print()
print("Application is running successfully!", flush=True)

while True:
    time.sleep(30)
