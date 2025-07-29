from colorama import Fore, Style, init
from data_handler import df_credentials
import getpass

init(autoreset=True) # Initialize Colorama

def authenticate(user_type):
    """
    Authenticates users based on their type (Admin or Employee).
    Returns the employee code (username) if authentication is successful, otherwise None.
    """
    if user_type == "Admin":
        username = input(Fore.YELLOW + "Enter Admin Username: ").strip()
        password = getpass.getpass(prompt=Fore.YELLOW + "Enter Admin Password: "+Style.RESET_ALL).strip()
        match = df_credentials[(df_credentials['Emp_Code'].astype(str) == username) & (df_credentials['Password'].astype(str) == password)]
        if match.empty or username != "admin": # Explicitly check for 'admin' username
            print(Fore.RED + "\nInvalid Admin credentials.\n")
            return None
        return username
    else: # Employee
        emp_code = input(Fore.YELLOW + "Enter Employee Code: ").strip()
        password = getpass.getpass(prompt=Fore.YELLOW + "Enter Password: "+Style.RESET_ALL).strip()
        match = df_credentials[(df_credentials['Emp_Code'].astype(str) == emp_code) & (df_credentials['Password'].astype(str) == password)]
        if match.empty or emp_code == "admin": # Prevent 'admin' from logging in as employee
            print(Fore.RED + "\nInvalid Employee credentials.\n")
            return None
        return emp_code