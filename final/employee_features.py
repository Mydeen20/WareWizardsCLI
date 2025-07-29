import pandas as pd
from colorama import Fore, Style, init
from ui_formatter import format_table, get_calibration_color, VALUE_STATUS_WIDTH
from data_handler import df_assessments, df_courses, df_credentials, save_credentials
from ai_features import ai_recommend_courses, lms_quiz_agent, ask_ai_anything
import sys

init(autoreset=True) # Initialize Colorama

def employee_portal(emp_code):
    """
    Manages the employee portal menu and actions for a specific employee.
    """
    while True:
        emp_data_row = df_assessments[df_assessments['Emp_Code'].astype(str)==emp_code]
        if emp_data_row.empty:
            print(Fore.RED + "Could not find your employee data.")
            return
        emp_data = emp_data_row.iloc[0]
        dept, desig = emp_data['Department'], emp_data['Designation']
        course_row_df = df_courses[(df_courses['Department']==dept)&(df_courses['Designation']==desig)]
        
        if course_row_df.empty:
            actual_courses = []
        else:
            course_row = course_row_df.iloc[0]
            actual_courses=[course_row.get(f"Course{i}") for i in range(1,5)]

        print(Fore.MAGENTA+f"\n=== EMPLOYEE PORTAL ({emp_data['Emp_Name']}) ==="+Style.RESET_ALL)
        summary=pd.DataFrame({"Field":["Emp_Code","Department","Designation","Calibration"],"Value":[emp_code,emp_data['Department'],emp_data['Designation'],f"{emp_data['Calibrated_for_Designation']} ({get_calibration_color(emp_data['Calibrated_for_Designation'])})"]})
        format_table(summary,"Profile",truncate=True,custom_widths={"Value":VALUE_STATUS_WIDTH})
        
        course_statuses = [emp_data.get(f"Course{i}") for i in range(1, 5)]
        all_courses=pd.DataFrame({"Course":actual_courses,"Status":course_statuses})
        format_table(all_courses,"Assigned Courses",truncate=True,custom_widths={"Status":VALUE_STATUS_WIDTH})
        
        print(Fore.MAGENTA+"\nOptions:"+Style.RESET_ALL)
        print("1. Get AI Course Recommendations\n2. Take a Skill Refresher Quiz\n3. Ask AI Anything\n4. Reset Password\n5. Back to Main Menu\n6. Sign Out\n7. Exit")
        choice=input(Fore.YELLOW+"Choose an option: ").strip()

        if choice == "1":
            ai_recommend_courses(emp_code)
        elif choice == "2":
            lms_quiz_agent(emp_code)
        elif choice == "3":
            ask_ai_anything()
        elif choice=="4":
            cur=input(Fore.YELLOW+"Enter Current Password: ").strip()
            new=input(Fore.YELLOW+"Enter New Password: ").strip()
            conf=input(Fore.YELLOW+"Confirm New Password: ").strip()
            cred_row_df = df_credentials[df_credentials['Emp_Code'].astype(str)==emp_code]
            if cred_row_df.empty or cred_row_df.iloc[0]['Password'] != cur: 
                print(Fore.RED+"\nIncorrect current password.")
                continue
            if new != conf: 
                print(Fore.RED+"\nNew passwords do not match.")
                continue
            # Update the DataFrame and save to Excel
            df_credentials.loc[df_credentials['Emp_Code'].astype(str)==emp_code,'Password'] = new
            if save_credentials(df_credentials):
                print(Fore.GREEN+"\nPassword updated successfully!")
            else:
                print(Fore.RED + "\nFailed to update password. Please check the data file.")
        elif choice=="5":
            return # Back to main menu
        elif choice=="6":
            confirm = input(Fore.YELLOW + "Are you sure you want to sign out? (Y/N): ").strip().lower()
            if confirm == 'y':
                print(Fore.CYAN+"\nSigned out.\n")
                return # Sign out and go to main menu
            else:
                print(Fore.CYAN+"\nSign out cancelled.\n")
        elif choice=="7":
            print(Fore.CYAN+"Exiting...")
            sys.exit()
        else:
            print(Fore.RED+"\nInvalid option. Try again.")