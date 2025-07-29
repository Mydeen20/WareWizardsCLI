from colorama import Fore, Style, init
from tabulate import tabulate
import pandas as pd

init(autoreset=True) # Initialize Colorama

COLUMN_WIDTH = 25
VALUE_STATUS_WIDTH = 60

def get_calibration_color(percent):
    """
    Returns a colored status string based on the calibration percentage.
    """
    try:
        val = float(str(percent).strip('%'))
    except (ValueError, TypeError):
        val = 0 # Default to 0 if conversion fails
    if val < 50:
        return Fore.RED + "Below Bar" + Style.RESET_ALL
    elif val < 75:
        return Fore.YELLOW + "Average" + Style.RESET_ALL
    elif val < 100:
        return Fore.BLUE + "Calibrated" + Style.RESET_ALL
    else:
        return Fore.GREEN + "Expert" + Style.RESET_ALL

def clean_status_text(value):
    """
    Cleans up specific status text for better display.
    """
    if isinstance(value, str):
        value = value.replace("First Attempt", "Attempt-1").replace("Second Attempt", "Attempt-2").replace("Third Attempt", "Attempt-3")
    return value

def format_table(df, title=None, truncate=True, custom_widths=None):
    """
    Formats and prints a DataFrame as a fancy grid table.
    Allows for titles, truncation of long strings, and custom column widths.
    """
    if title:
        print(Fore.CYAN + f"\n=== {title.upper()} ===" + Style.RESET_ALL)
    if df.empty:
        print(Fore.RED + "(No data)")
        return
    
    # Create a copy to avoid SettingWithCopyWarning
    df_copy = df.fillna("-").astype(str)
    df_copy = df_copy.map(clean_status_text)
    
    if truncate:
        for col in df_copy.columns:
            width = custom_widths.get(col, COLUMN_WIDTH) if custom_widths else COLUMN_WIDTH
            df_copy[col] = df_copy[col].map(lambda x: x if len(x) <= width else x[:width-3] + '...').map(lambda x: x.ljust(width))
            
    print(tabulate(df_copy, headers="keys", tablefmt="fancy_grid", showindex=False, stralign="center"))