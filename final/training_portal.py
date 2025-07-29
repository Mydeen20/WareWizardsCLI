from colorama import Fore, Style, init
from authentication import authenticate
from admin_features import admin_portal
from employee_features import employee_portal
import sys

init(autoreset=True) # Initialize Colorama

def main():
    """
    Main function to run the Training Portal application.
    Handles user login and directs to appropriate portals.
    """
    while True:
        print(Fore.CYAN + "\n=== TRAINING PORTAL ===" + Style.RESET_ALL)
        user_choice = input(Fore.YELLOW + "Login as Employee (E) or Admin (A): ").strip().upper()
        if user_choice not in ["E", "A"]:
            print(Fore.RED + "\nInvalid option. Please choose E or A.\n")
            continue
        
        user_type = "Employee" if user_choice == "E" else "Admin"
        
        emp_code = authenticate(user_type)
        if emp_code:
            if user_type == "Admin":
                admin_portal()
            else:
                employee_portal(emp_code)

if __name__ == "__main__":
    main()