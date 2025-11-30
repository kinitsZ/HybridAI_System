# AI-Powered Faculty Stress Detector and Wellness Recommendation Expert System

A hybrid AI system combining Python Machine Learning with Rule-Based Expert Systems to detect faculty stress levels and provide personalized wellness recommendations.

## Project Overview

This system consists of two main components:

1. **Python ML Component**: Predicts faculty stress levels using a Random Forest classifier
2. **Expert System Component**: Generates personalized wellness recommendations using rule-based reasoning (available in both Python and Visual Prolog)

## System Architecture

```
Faculty Data → Python ML Model → Stress Prediction → Expert System → Wellness Recommendations
```

## Prerequisites

### For Python Components

- Python 3.7 or higher
- Required packages:
  ```bash
  pip install pandas numpy scikit-learn joblib
  ```

### For Prolog Component

**Option 1: Visual Prolog**
- Visual Prolog IDE (for running `wellness_expert.pro`)
- Download from: http://www.visual-prolog.com/

**Option 2: SWI-Prolog (Recommended)**
- SWI-Prolog 8.0 or higher
- Download from: https://www.swi-prolog.org/Download.html
- Use the converted file: `wellness_expert_swi.pl`

## Testing Guide

### 1. Generate Dataset (First Time Setup)

Before running the system, you need to generate the training dataset:

```bash
python generate_dataset.py
```

**Expected Output:**
- Creates `dataset.csv` (250 faculty records without labels)
- Creates `dataset_with_labels.csv` (250 faculty records with stress levels)
- Displays dataset statistics and distribution

**What to verify:**
- Both CSV files are created
- Output shows balanced distribution of Low/Medium/High stress levels
- Sample data looks realistic (e.g., subjects handled: 1-6, students: 20-200)

---

### 2. Testing Python ML Component Only

#### Option A: Interactive Mode

```bash
python stress_predictor.py
```

**Menu Options:**
1. **Predict stress level for new faculty** - Enter custom data manually
2. **Predict from dataset** - Test with existing faculty IDs (F001-F250)
3. **Retrain model** - Retrain and view model performance
4. **Exit**

**Example Test Case:**
```
Select option: 1
Faculty ID: TEST001
Subjects handled: 5
Total students: 150
Preparation hours/week: 12
Research hours/week: 8
Committee duties: 3
Admin tasks: 4
Meeting hours/week: 7
Sleep hours/night: 5
Weekend work frequency: 4
```

**Expected Output:**
- Workload Stress Score (WSS): Should be calculated (range: 9-27)
- ML Model Prediction: Low/Medium/High
- Prediction probabilities for each stress level
- Creates `stress_output.txt` file

**What to verify:**
- WSS score makes sense (higher workload = higher score)
- ML prediction aligns with WSS ranges:
  - WSS ≤ 14 → Low stress
  - WSS 15-20 → Medium stress
  - WSS ≥ 21 → High stress
- Prediction confidence percentages sum to 100%
- File `stress_output.txt` is created with correct format

#### Option B: Select from Dataset

```bash
python stress_predictor.py
```

Select option 2, then enter a faculty ID (e.g., `F001`, `F050`, `F100`)

**Expected Output:**
- Shows actual faculty data
- Displays actual stress level from dataset
- Shows ML prediction
- Indicates if prediction matches actual: [CORRECT] or [MISMATCH]

**What to verify:**
- Model accuracy should be reasonable (typically 70-90%)
- Confidence scores should be higher for correct predictions

---

### 3. Testing Python Expert System Only

First, make sure you have a `stress_output.txt` file (run stress predictor first).

```bash
python wellness_expert_python.py
```

**Expected Output:**
- Reads faculty ID and stress level from `stress_output.txt`
- Displays comprehensive wellness report with:
  - **Condition Indicators**: 10+ facts about sleep, workload, wellness, etc.
  - **Personalized Recommendations**: 6+ rules covering primary action, workload management, wellness activities, time management, social support, and preventive measures
  - Rule explanation section

**What to verify:**
- System correctly reads the stress level from file
- Indicators match the stress level (e.g., high stress → "Insufficient sleep (<6 hours)")
- Recommendations are appropriate for stress level:
  - **Low stress**: Maintain, optimize, continue
  - **Medium stress**: Monitor, review, schedule
  - **High stress**: Urgent, immediate, request reduction

**Test Different Stress Levels:**

Manually edit `stress_output.txt` to test each level:

```
faculty_id:TEST001
stress_level:low
```

```
faculty_id:TEST002
stress_level:medium
```

```
faculty_id:TEST003
stress_level:high
```

Run the expert system for each and compare the recommendations.

---

### 4. Testing Prolog Expert System

#### Option A: SWI-Prolog (Recommended)

**Prerequisites:**
- Install SWI-Prolog from https://www.swi-prolog.org/Download.html
- Ensure `stress_output.txt` exists (run Python predictor first)

**Method 1: Run directly from command line**
```bash
swipl -s wellness_expert_swi.pl
```

The program will automatically execute and display the recommendations, then exit.

**Method 2: Interactive mode**
```bash
swipl
```

Then in the Prolog prompt:
```prolog
?- [wellness_expert_swi].
?- run.
```

**Expected Output:**
- Reads stress prediction from Python ML component
- Displays identical recommendations to Python version
- Shows structured report with indicators and rules

**What to verify:**
- Output format matches Python version
- Same knowledge base facts (10+)
- Same recommendation rules (6+)
- Correctly parses `stress_output.txt`

**Common SWI-Prolog Issues:**

If you get encoding errors, try:
```prolog
?- set_prolog_flag(encoding, utf8).
?- run.
```

#### Option B: Visual Prolog

**Prerequisites:**
- Install Visual Prolog IDE from http://www.visual-prolog.com/
- Use `wellness_expert.pro` file

**Steps:**
1. Open `wellness_expert.pro` in Visual Prolog IDE
2. Make sure `stress_output.txt` exists in the same directory
3. Compile the program (Build → Build Solution)
4. Run the program (Debug → Start Without Debugging)

**Expected Output:**
- Same output as SWI-Prolog version
- Structured wellness report

---

### 5. Testing Integrated System (Recommended)

The main integration script combines all components:

```bash
python main.py
```

**Menu Options:**
1. **Enter new faculty data for prediction** - Full workflow with custom data
2. **Select faculty from dataset** - Test with existing records
3. **Batch analyze entire dataset** - Performance analysis
4. **View model performance** - Detailed metrics
5. **Exit**

#### Test Case 1: Low Stress Faculty

```
Select option: 1
Faculty ID: LOW001
Subjects handled: 2
Total students: 50
Preparation hours/week: 5
Research hours/week: 3
Committee duties: 1
Admin tasks: 1
Meeting hours/week: 3
Sleep hours/night: 8
Weekend work frequency: 0
```

**Expected:**
- WSS: 9-11 (Low range)
- Prediction: Low stress
- Recommendations: Maintain current practices

#### Test Case 2: Medium Stress Faculty

```
Select option: 1
Faculty ID: MED001
Subjects handled: 3
Total students: 85
Preparation hours/week: 8
Research hours/week: 5
Committee duties: 2
Admin tasks: 3
Meeting hours/week: 5
Sleep hours/night: 6
Weekend work frequency: 2
```

**Expected:**
- WSS: 15-18 (Medium range)
- Prediction: Medium stress
- Recommendations: Monitor and implement time-blocking

#### Test Case 3: High Stress Faculty

```
Select option: 1
Faculty ID: HIGH001
Subjects handled: 5
Total students: 160
Preparation hours/week: 13
Research hours/week: 9
Committee duties: 4
Admin tasks: 5
Meeting hours/week: 8
Sleep hours/night: 5
Weekend work frequency: 4
```

**Expected:**
- WSS: 23-26 (High range)
- Prediction: High stress
- Recommendations: Urgent workload adjustment needed

#### Test Case 4: Batch Analysis

```
Select option: 3
```

**Expected Output:**
- Dataset summary with stress level distribution
- Model accuracy percentage
- Sample predictions showing Faculty ID, Actual, Predicted, and Result
- Accuracy typically 70-90%

**What to verify:**
- Reasonable accuracy across all stress levels
- No extreme bias toward one class
- Confusion matrix shows balanced predictions

#### Test Case 5: Model Performance

```
Select option: 4
```

**Expected Output:**
- Training/test split information
- Overall accuracy percentage
- Classification report with precision, recall, F1-score for each class
- Confusion matrix
- Feature importance rankings

**What to verify:**
- Accuracy > 70%
- Balanced precision and recall
- Important features make sense (e.g., Sleep_Hours, Weekend_Work should be highly ranked)

---

### 6. End-to-End Workflow Test

**Complete Integration Test:**

1. **Generate fresh dataset:**
   ```bash
   python generate_dataset.py
   ```

2. **Train model and make prediction:**
   ```bash
   python main.py
   ```
   - Select option 2
   - Choose a faculty ID (e.g., F100)

3. **Verify output file:**
   ```bash
   type stress_output.txt
   ```
   Should show:
   ```
   faculty_id:F100
   stress_level:low|medium|high
   ```

4. **Run Python expert system:**
   ```bash
   python wellness_expert_python.py
   ```

5. **Run Prolog expert system:**

   **SWI-Prolog:**
   ```bash
   swipl -s wellness_expert_swi.pl
   ```

   **Visual Prolog:**
   - Open and run `wellness_expert.pro` in the IDE

   Compare output with Python version

**What to verify:**
- All components run without errors
- Data flows correctly between components
- Both expert systems produce identical recommendations
- Output is properly formatted and readable

---

## Expected Files After Testing

After running the tests, you should have these files:

- `dataset.csv` - Original dataset without labels
- `dataset_with_labels.csv` - Dataset with stress level labels
- `stress_model.joblib` - Trained ML model
- `stress_output.txt` - Latest prediction output for Prolog integration

---

## Troubleshooting

### Python Issues

**Problem:** `ModuleNotFoundError: No module named 'sklearn'`
```bash
pip install scikit-learn
```

**Problem:** `FileNotFoundError: dataset_with_labels.csv not found`
```bash
python generate_dataset.py
```

**Problem:** Model accuracy is very low (<50%)
- Regenerate dataset: `python generate_dataset.py`
- Retrain model: Run `main.py` and select option 4

### Prolog Issues

**Problem:** `Cannot open file: stress_output.txt`
- Run Python predictor first to generate the file
- Ensure `stress_output.txt` is in the same directory as the Prolog file
- For SWI-Prolog, make sure you're running from the correct directory

**Problem:** SWI-Prolog errors with `read_line_to_string`
- Try the alternative file reader by modifying the code to use `read_stress_file_alt` instead
- Ensure SWI-Prolog version is 8.0 or higher

**Problem:** Visual Prolog compilation errors
- Ensure you're using the `wellness_expert.pro` file (not the `.pl` file)
- Check that Visual Prolog IDE is properly installed

---

## Validation Checklist

- [ ] Dataset generated with 250 records
- [ ] Python ML model trains successfully
- [ ] Model accuracy > 70%
- [ ] Predictions work for manual input
- [ ] Predictions work for dataset records
- [ ] `stress_output.txt` file created correctly
- [ ] Python expert system reads file and generates recommendations
- [ ] SWI-Prolog expert system produces identical recommendations
- [ ] Visual Prolog expert system works (if using Visual Prolog)
- [ ] All three stress levels (Low/Medium/High) produce different outputs
- [ ] Integrated system runs all components smoothly

---

## Quick Start Commands

```bash
# 1. Setup (first time only)
pip install pandas numpy scikit-learn joblib
python generate_dataset.py

# 2. Run integrated system (recommended)
python main.py

# 3. Run individual components
python stress_predictor.py          # ML component only
python wellness_expert_python.py    # Python expert system only

# 4. Run Prolog expert system
swipl -s wellness_expert_swi.pl     # SWI-Prolog (recommended)
# OR open wellness_expert.pro in Visual Prolog IDE

# 5. Test SWI-Prolog with all stress levels
test_swi_prolog.bat                 # Windows
./test_swi_prolog.sh                # Linux/Mac
```

---

## Project Structure

```
CS18A-FINALPROJECT/
│
├── generate_dataset.py              # Dataset generator
├── stress_predictor.py              # ML prediction component
├── wellness_expert_python.py        # Python expert system
├── wellness_expert.pro              # Visual Prolog expert system
├── wellness_expert_swi.pl           # SWI-Prolog expert system
├── main.py                          # Main integration script
│
├── test_swi_prolog.bat              # Windows test script for SWI-Prolog
├── test_swi_prolog.sh               # Linux/Mac test script for SWI-Prolog
│
├── README.md                        # This file - comprehensive testing guide
├── PROLOG_CONVERSION_NOTES.md       # Visual Prolog ↔ SWI-Prolog conversion details
│
├── dataset.csv                      # Generated: Input data
├── dataset_with_labels.csv          # Generated: Training data
├── stress_model.joblib              # Generated: Trained model
└── stress_output.txt                # Generated: ML output for Prolog
```

---

## Features Demonstrated

### Machine Learning (Python)
- Supervised learning with Random Forest
- Feature engineering (WSS calculation)
- Model evaluation with classification metrics
- Probability predictions
- Model persistence (save/load)

### Expert System (Rule-Based)
- Knowledge base with 10+ facts
- 6+ inference rules
- Forward chaining reasoning
- Conditional recommendations
- Pattern matching

### Integration
- Hybrid AI architecture
- Inter-component communication via file I/O
- Unified user interface
- Consistent knowledge representation

---

## Academic Context

This project demonstrates the integration of:
1. **Machine Learning**: Data-driven pattern recognition
2. **Expert Systems**: Knowledge-based reasoning
3. **Practical Application**: Faculty wellness management

The system showcases how modern AI (ML) can complement traditional AI (rule-based systems) to create robust, explainable solutions.

---

## Prolog Implementation Notes

This project includes TWO Prolog implementations:

### Visual Prolog (`wellness_expert.pro`)
- Original implementation with strong typing
- Requires Visual Prolog IDE
- Uses domain declarations and type checking
- Commercial/Educational license required

### SWI-Prolog (`wellness_expert_swi.pl`)
- **Recommended for most users**
- Free and open source
- Cross-platform (Windows, Linux, Mac)
- Identical functionality to Visual Prolog version
- Easy to install and test

Both implementations use the same:
- 10+ knowledge base facts
- 6+ inference rules
- Identical recommendation logic
- Same input/output format

For detailed conversion notes and syntax differences, see [PROLOG_CONVERSION_NOTES.md](PROLOG_CONVERSION_NOTES.md).

### Quick Test

Test all three stress levels with one command:

**Windows:**
```bash
test_swi_prolog.bat
```

**Linux/Mac:**
```bash
chmod +x test_swi_prolog.sh
./test_swi_prolog.sh
```

This will automatically:
1. Check if SWI-Prolog is installed
2. Create test data for low, medium, and high stress
3. Run the expert system for each level
4. Display the personalized recommendations
