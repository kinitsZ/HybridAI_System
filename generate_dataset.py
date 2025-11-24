"""
Dataset Generator for Faculty Stress Detection System
Generates 250 rows of faculty workload data with calculated stress levels
Based on the Workload Stress Score (WSS) formula from project specifications
"""

import pandas as pd
import numpy as np
import random

def calculate_wss_points(row):
    """Calculate Workload Stress Score points for each variable"""
    points = 0

    # Subjects Handled: 1-2 = 1pt, 3-4 = 2pts, 5+ = 3pts
    if row['Subjects_Handled'] <= 2:
        points += 1
    elif row['Subjects_Handled'] <= 4:
        points += 2
    else:
        points += 3

    # Total Students: <60 = 1pt, 60-100 = 2pts, >100 = 3pts
    if row['Students_Total'] < 60:
        points += 1
    elif row['Students_Total'] <= 100:
        points += 2
    else:
        points += 3

    # Preparation Hours: <6 = 1pt, 6-10 = 2pts, >10 = 3pts
    if row['Prep_Hours'] < 6:
        points += 1
    elif row['Prep_Hours'] <= 10:
        points += 2
    else:
        points += 3

    # Research Load Hours: <4 = 1pt, 4-6 = 2pts, >6 = 3pts
    if row['Research_Load_Hours'] < 4:
        points += 1
    elif row['Research_Load_Hours'] <= 6:
        points += 2
    else:
        points += 3

    # Committee Duties: 0-1 = 1pt, 2 = 2pts, 3+ = 3pts
    if row['Committee_Duties'] <= 1:
        points += 1
    elif row['Committee_Duties'] == 2:
        points += 2
    else:
        points += 3

    # Administrative Tasks: 0-1 = 1pt, 2-3 = 2pts, 4+ = 3pts
    if row['Admin_Tasks'] <= 1:
        points += 1
    elif row['Admin_Tasks'] <= 3:
        points += 2
    else:
        points += 3

    # Meeting Hours: <3 = 1pt, 3-6 = 2pts, >6 = 3pts
    if row['Meeting_Hours'] < 3:
        points += 1
    elif row['Meeting_Hours'] <= 6:
        points += 2
    else:
        points += 3

    # Sleep Hours: 7+ = 1pt, 6 = 2pts, <6 = 3pts
    if row['Sleep_Hours'] >= 7:
        points += 1
    elif row['Sleep_Hours'] == 6:
        points += 2
    else:
        points += 3

    # Weekend Work Frequency: 0 = 1pt, 1-2 = 2pts, 3+ = 3pts
    if row['Weekend_Work'] == 0:
        points += 1
    elif row['Weekend_Work'] <= 2:
        points += 2
    else:
        points += 3

    return points

def get_stress_level(wss):
    """Convert WSS score to stress level category"""
    if wss <= 14:
        return "Low"
    elif wss <= 20:
        return "Medium"
    else:
        return "High"

def generate_faculty_data(num_records=250):
    """Generate realistic faculty workload data"""
    np.random.seed(42)
    random.seed(42)

    data = []

    for i in range(1, num_records + 1):
        # Generate realistic distributions for each variable
        faculty_id = f"F{i:03d}"

        # Subjects Handled (1-6, most common 2-4)
        subjects = np.random.choice([1, 2, 3, 4, 5, 6], p=[0.1, 0.25, 0.3, 0.2, 0.1, 0.05])

        # Students Total (20-200, based on subjects)
        base_students = subjects * 25
        students = max(20, min(200, int(np.random.normal(base_students, 15))))

        # Preparation Hours (3-15, correlated with subjects)
        prep_hours = max(3, min(15, int(np.random.normal(subjects * 2.5, 2))))

        # Research Load Hours (0-12)
        research_hours = max(0, min(12, int(np.random.normal(5, 2.5))))

        # Committee Duties (0-5)
        committee = np.random.choice([0, 1, 2, 3, 4, 5], p=[0.15, 0.3, 0.25, 0.15, 0.1, 0.05])

        # Administrative Tasks (0-6)
        admin = np.random.choice([0, 1, 2, 3, 4, 5, 6], p=[0.1, 0.2, 0.25, 0.2, 0.15, 0.07, 0.03])

        # Meeting Hours (1-10)
        meetings = max(1, min(10, int(np.random.normal(5, 2))))

        # Sleep Hours (4-9, most get 6-7)
        sleep = np.random.choice([4, 5, 6, 7, 8, 9], p=[0.05, 0.15, 0.3, 0.3, 0.15, 0.05])

        # Weekend Work (0-5)
        weekend = np.random.choice([0, 1, 2, 3, 4, 5], p=[0.15, 0.25, 0.25, 0.2, 0.1, 0.05])

        row = {
            'Faculty_ID': faculty_id,
            'Subjects_Handled': int(subjects),
            'Students_Total': int(students),
            'Prep_Hours': int(prep_hours),
            'Research_Load_Hours': int(research_hours),
            'Committee_Duties': int(committee),
            'Admin_Tasks': int(admin),
            'Meeting_Hours': int(meetings),
            'Sleep_Hours': int(sleep),
            'Weekend_Work': int(weekend)
        }

        data.append(row)

    # Create DataFrame
    df = pd.DataFrame(data)

    # Calculate WSS and Stress Level
    df['WSS'] = df.apply(calculate_wss_points, axis=1)
    df['Stress_Level'] = df['WSS'].apply(get_stress_level)

    return df

if __name__ == "__main__":
    # Generate dataset
    df = generate_faculty_data(250)

    # Save full dataset with stress levels (for training)
    df.to_csv('dataset_with_labels.csv', index=False)

    # Save dataset without labels (original format for input)
    df_no_labels = df.drop(columns=['WSS', 'Stress_Level'])
    df_no_labels.to_csv('dataset.csv', index=False)

    # Print statistics
    print("Dataset Generated Successfully!")
    print(f"Total Records: {len(df)}")
    print("\nStress Level Distribution:")
    print(df['Stress_Level'].value_counts())
    print("\nWSS Score Statistics:")
    print(df['WSS'].describe())
    print("\nSample Data (first 10 rows):")
    print(df.head(10).to_string())
