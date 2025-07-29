import pandas as pd
from colorama import Fore, Style, init
from ui_formatter import format_table, get_calibration_color, VALUE_STATUS_WIDTH, COLUMN_WIDTH
from data_handler import df_employees, df_courses, df_assessments
from ai_features import ai_recommend_courses, ask_ai_anything
import sys

init(autoreset=True) # Initialize Colorama

def admin_filter():
    """
    Provides filtering options for administrators to view employee data.
    """
    while True:
        print(Fore.CYAN + "\n=== ADMIN FILTER ===" + Style.RESET_ALL)
        print("1. Filter by Course")
        print("2. Filter by Department")
        print("3. Filter by Calibration")
        print("4. Back")
        choice = input(Fore.YELLOW + "Choose an option: ").strip()
        if choice == "1":
            all_courses = sorted(set(course for i in range(1,5) for course in df_courses[f"Course{i}"].unique() if pd.notna(course)))
            for idx, course in enumerate(all_courses, start=1):
                print(f"{idx}. {course}")
            try:
                idx = int(input(Fore.YELLOW + "Select a course number: ").strip()) - 1
                course_name = all_courses[idx]
                result = []
                for _, row in df_assessments.iterrows():
                    course_map_row = df_courses[(df_courses['Department']==row['Department'])&(df_courses['Designation']==row['Designation'])]
                    if not course_map_row.empty:
                        for i in range(1,5):
                            if course_map_row.iloc[0][f"Course{i}"] == course_name:
                                result.append({"Emp_Code":row['Emp_Code'],"Emp_Name":row['Emp_Name'],"Designation":row['Designation'],"Course":course_name,"Status":row[f"Course{i}"]})
                format_table(pd.DataFrame(result), f"Employees for {course_name}", truncate=True, custom_widths={"Status": VALUE_STATUS_WIDTH})
            except (ValueError, IndexError):
                print(Fore.RED + "Invalid input.")
        elif choice == "2":
            depts = df_employees['Department'].unique()
            for idx, dept in enumerate(depts, start=1):
                print(f"{idx}. {dept}")
            try:
                idx = int(input(Fore.YELLOW + "Select a department number: ").strip()) - 1
                dept = depts[idx]
                result = df_assessments[df_assessments['Department']==dept][['Emp_Code','Emp_Name','Designation','Calibrated_for_Designation']]
                format_table(result, f"Employees in {dept}", truncate=True, custom_widths={"Calibrated_for_Designation": 28})
            except (ValueError, IndexError):
                print(Fore.RED + "Invalid input.")
        elif choice == "3":
            print(Fore.CYAN+"\nCalibration Levels:")
            print("1. Below Bar (<50%)\n2. Average (50-75%)\n3. Calibrated (75-99%)\n4. Expert (100%)")
            try:
                level = int(input(Fore.YELLOW+"Select level: ").strip())
                results=[]
                for _,row in df_assessments.iterrows():
                    val=float(str(row['Calibrated_for_Designation']).strip('%'))
                    if (level==1 and val<50) or \
                       (level==2 and 50<=val<75) or \
                       (level==3 and 75<=val<100) or \
                       (level==4 and val==100):
                        results.append({"Emp_Code":row['Emp_Code'],"Emp_Name":row['Emp_Name'],"Calibration %":f"{row['Calibrated_for_Designation']} ({get_calibration_color(row['Calibrated_for_Designation'])})"})
                format_table(pd.DataFrame(results), "Employees by Calibration", truncate=True, custom_widths={"Calibration %":28})
            except (ValueError, IndexError):
                print(Fore.RED+"Invalid selection.")
        elif choice == "4":
            return
        else:
            print(Fore.RED+"Invalid choice.")

def admin_portal():
    """
    Manages the admin portal menu and actions.
    """
    while True:
        print(Fore.MAGENTA+"\n=== ADMIN PORTAL ==="+Style.RESET_ALL)
        print("1. View Employee Details\n2. View Course Details\n3. View Assigned Courses\n4. Check Employee Calibration\n5. Course Completion Stats\n6. Filter\n7. Get AI Course Recommendation\n8. Back to Initial Menu\n9. Sign Out\n10. Exit\n11. Ask AI Anything")
        choice = input(Fore.YELLOW+"Choose an option: ").strip()
        if choice == "1":
            format_table(df_employees, "Employee Details")
        elif choice == "2":
            format_table(df_courses, "Course Details")
        elif choice == "3":
            view_cols = ["Emp_Code", "Emp_Name", "Designation", "Course1", "Course2", "Course3", "Course4", "Calibrated_for_Designation"]
            assigned = df_assessments[view_cols].copy()
            assigned["Calibrated_for_Designation"] = assigned["Calibrated_for_Designation"].apply(lambda x:f"{x} ({get_calibration_color(x)})")
            format_table(assigned, "Assigned Courses", truncate=True, custom_widths={"Emp_Code":10,"Emp_Name":20,"Calibrated_for_Designation":28})
        elif choice == "4":
            emp = input(Fore.YELLOW + "\nEnter Employee Code: ").strip()
            emp_data = df_assessments[df_assessments['Emp_Code'].astype(str) == emp]
            if emp_data.empty:
                print(Fore.RED + "\nEmployee not found.")
            else:
                row = emp_data.iloc[0]
                details = pd.DataFrame({"Field":["Emp_Code","Department","Designation","Calibration"],"Value":[row['Emp_Code'],row['Department'],row['Designation'],f"{row['Calibrated_for_Designation']} ({get_calibration_color(row['Calibrated_for_Designation'])})"]})
                format_table(details, f"Employee {row['Emp_Name']}", truncate=True, custom_widths={"Value":VALUE_STATUS_WIDTH})
                course_row_df = df_courses[(df_courses['Department']==row['Department'])&(df_courses['Designation']==row['Designation'])]
                if not course_row_df.empty:
                    course_row = course_row_df.iloc[0]
                    courses = pd.DataFrame({"Course":[course_row[f"Course{i}"] for i in range(1,5)],"Status":[row[f"Course{i}"] for i in range(1,5)]})
                    format_table(courses, "Courses", truncate=False)
        elif choice == "5":
            stats = df_assessments.groupby(['Department','Designation'])['Calibrated_for_Designation'].apply(lambda x:round(pd.Series([float(str(val).strip('%')) for val in x if str(val).strip('%').replace('.','',1).isdigit()]).mean(),2)).reset_index()
            stats.rename(columns={'Calibrated_for_Designation':'Avg_Calibration_%'},inplace=True)
            format_table(stats, "Average Calibration by Dept & Designation", truncate=True, custom_widths={"Designation":35})
        elif choice == "6":
            admin_filter()
        elif choice == "7":
            emp_code_to_recommend = input(Fore.YELLOW + "\nEnter Employee Code for AI recommendation: ").strip()
            ai_recommend_courses(emp_code_to_recommend)
        elif choice == "8":
            return # Back to main menu
        elif choice == "9":
            confirm = input(Fore.YELLOW + "Are you sure you want to sign out? (Y/N): ").strip().lower()
            if confirm == 'y':
                print(Fore.CYAN + "\nSigned out.\n")
                return # Sign out and go to main menu
            else:
                print(Fore.CYAN + "\nSign out cancelled.\n")
        elif choice == "10":
            sys.exit() # Exit the application
        elif choice == "11":
            ask_ai_anything()
        else:
            print(Fore.RED + "\nInvalid choice.")