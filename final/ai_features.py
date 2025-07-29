import pandas as pd
import json
import google.generativeai as genai
from colorama import Fore, Style, init
from data_handler import df_assessments, df_courses
from ui_formatter import format_table

init(autoreset=True) # Initialize Colorama

# --- Configure the AI model ---
model = None
try:
    # NOTE: Replace with your actual, valid API key.
    # It's recommended to load API keys from environment variables for security.
    API_KEY = "YOUR_GEMINI_API_KEY"
    genai.configure(api_key=API_KEY)
    model = genai.GenerativeModel('gemini-2.5-pro')
except Exception as e:
    print(Fore.RED + f"Fatal Error: Failed to initialize AI model. Please check your API Key. Details: {e}")


def ai_recommend_courses(emp_code):
    """
    Generates AI-powered course recommendations for a given employee with robust error handling.
    """
    if not model:
        print(Fore.RED + "AI model is not available. Cannot generate recommendations.")
        return

    emp_data_row = df_assessments[df_assessments['Emp_Code'].astype(str) == emp_code]
    if emp_data_row.empty:
        print(Fore.RED + f"Employee with code '{emp_code}' not found.")
        return
    emp_data = emp_data_row.iloc[0]

    course_row_df = df_courses[(df_courses['Department'] == emp_data['Department']) & (df_courses['Designation'] == emp_data['Designation'])]
    if course_row_df.empty:
        print(Fore.RED + f"Error: No courses are defined for Department '{emp_data['Department']}' and Designation '{emp_data['Designation']}'.")
        print(Fore.YELLOW + "Cannot generate recommendations.")
        return
    course_row = course_row_df.iloc[0]

    assigned_courses_list = [course_row[f"Course{i}"] for i in range(1, 5) if pd.notna(course_row[f"Course{i}"])]
    
    all_available_courses = set()
    for i in range(1, 5):
        all_available_courses.update(df_courses[f'Course{i}'].dropna().unique())
    
    unassigned_courses = sorted(list(all_available_courses - set(assigned_courses_list)))

    if not unassigned_courses:
        print(Fore.GREEN + f"\nGreat news! {emp_data['Emp_Name']} has already been assigned all available courses.")
        return
    
    assigned_courses_status = {course_row[f"Course{i}"]: emp_data[f"Course{i}"] for i in range(1, 5) if pd.notna(course_row[f"Course{i}"])}
    prompt = f"""
    You are an expert career development AI assistant. Your task is to recommend new courses to an employee based on their performance.

    Employee Details:
    - Name: {emp_data['Emp_Name']}
    - Department: {emp_data['Department']}
    - Designation: {emp_data['Designation']}
    - Overall Calibration Score: {emp_data['Calibrated_for_Designation']}

    Current Assigned Course Status:
    {pd.Series(assigned_courses_status).to_string()}

    Based on the employee's details and performance (especially on 'Failed' or 'In Progress' courses), recommend up to 3 new courses to help them improve.

    Choose ONLY from this list of available unassigned courses:
    {', '.join(unassigned_courses)}

    For each recommendation, provide a brief, encouraging, one-sentence justification. Present your answer as a numbered list.
    """

    try:
        print(Fore.YELLOW + "\n🤖 Asking the AI for course recommendations... Please wait.")
        response = model.generate_content(prompt)

        if response.parts:
            print(Fore.GREEN + f"\n=== 🤖 AI RECOMMENDATIONS FOR {emp_data['Emp_Name']} ===")
            print(response.text)
        else:
            print(Fore.RED + "The AI could not generate a recommendation.")
            print(f"Prompt Feedback (if available): {response.prompt_feedback}")
    except Exception as e:
        print(Fore.RED + f"\nAn error occurred while communicating with the AI model: {e}")
        print(Fore.YELLOW + "Please check your API key, internet connection, and API usage limits.")

def lms_quiz_agent(emp_code):
    """
    Identifies a strong subject and generates a quiz for the employee.
    """
    if not model:
        print(Fore.RED + "AI model is not available. Cannot generate quiz.")
        return

    emp_data_row = df_assessments[df_assessments['Emp_Code'].astype(str) == emp_code]
    if emp_data_row.empty:
        print(Fore.RED + "Could not find your employee data.")
        return
    emp_data = emp_data_row.iloc[0]
    
    course_row_df = df_courses[(df_courses['Department'] == emp_data['Department']) & (df_courses['Designation'] == emp_data['Designation'])]
    if course_row_df.empty:
        print(Fore.RED + "Could not find your assigned courses.")
        return
    course_row = course_row_df.iloc[0]

    strong_course = None

    print(Fore.CYAN + f"\nLet's test your knowledge on a topic you've completed: '{strong_course}'")
    
    prompt = f"""
    You are an LMS Quiz Agent. Your task is to create a simple 5-question multiple-choice quiz on the topic: "{strong_course}".
    The quiz is for an employee who has already mastered this topic, so the questions should be for skill refreshment.

    Your response MUST be a valid JSON object.
    The object must have a single key "quiz", which is a list of 5 question objects.
    Each question object must have three keys:
    1. "question": A string for the question text.
    2. "options": A list of 4 strings representing the choices.
    3. "answer": A string that exactly matches one of the items in the "options" list.
    """

    try:
        print(Fore.YELLOW + "🤖 Generating a skill refresher quiz... Please wait.")
        response = model.generate_content(prompt)
        # Clean the response to remove markdown backticks if present
        cleaned_response = response.text.replace("```json", "").replace("```", "").strip()
        quiz_data = json.loads(cleaned_response)
        questions = quiz_data.get("quiz", [])
        
        if not questions:
            print(Fore.RED + "The AI could not generate quiz questions. Please try again.")
            return

        score = 0
        for i, q in enumerate(questions, 1):
            print(Fore.MAGENTA + f"\nQ{i}: {q['question']}")
            options = q['options']
            correct_answer = q['answer']
            
            for j, option in enumerate(options):
                print(f"  {chr(65+j)}. {option}")
            
            user_answer_char = input(Fore.YELLOW + "Your choice (A, B, C, D): ").strip().upper()
            
            try:
                user_answer_index = ord(user_answer_char) - 65
                user_answer_text = options[user_answer_index]
                if user_answer_text == correct_answer:
                    print(Fore.GREEN + "Correct!")
                    score += 1
                else:
                    print(Fore.RED + f"Incorrect. The correct answer was: {correct_answer}")
            except (IndexError, TypeError):
                print(Fore.RED + f"Invalid choice. The correct answer was: {correct_answer}")

        print(Fore.CYAN + f"\n--- Quiz Complete! ---")
        print(f"Your final score is: {score}/{len(questions)}")

    except json.JSONDecodeError:
        print(Fore.RED + "Error: Could not understand the AI's response. It was not valid JSON.")
    except Exception as e:
        print(Fore.RED + f"\nAn error occurred while generating the quiz: {e}")

def ask_ai_anything():
    """
    Allows the user to ask the AI to explain any concept.
    """
    if not model:
        print(Fore.RED + "AI model is not available. Cannot answer your question.")
        return

    print(Fore.CYAN + "\n=== ASK AI ANYTHING ===" + Style.RESET_ALL)
    concept = input(Fore.YELLOW + "What concept or topic would you like the AI to explain? ").strip()
    if not concept:
        print(Fore.RED + "No concept entered. Returning to menu.")
        return

    prompt = (
        f"Explain the concept '{concept}' in simple terms. "
        "Use a creative analogy to make it easy to understand. "
        "Keep it concise but engaging."
    )

    try:
        print(Fore.YELLOW + "\n🤖 Asking the AI... Please wait.")
        response = model.generate_content(prompt)
        if hasattr(response, 'parts') and response.parts:
            print(Fore.GREEN + "\n=== AI EXPLANATION ===")
            print(response.text)
            print(Fore.GREEN + "======================")
        else:
            print(Fore.RED + "The AI could not generate an explanation.")
    except Exception as e:
        print(Fore.RED + f"\nAn error occurred while communicating with the AI model: {e}")
