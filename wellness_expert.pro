/*
   Faculty Wellness Recommendation Expert System
   Rule-Based Expert System for Visual Prolog

   This system reads the stress level from Python ML output
   and generates personalized wellness recommendations
*/

domains
    stress_level = low; medium; high
    faculty_id = string
    recommendation = string

predicates
    % Main predicates
    run
    read_stress_file(faculty_id, stress_level)
    process_recommendations(faculty_id, stress_level)

    % Knowledge base facts - conditions and indicators
    sleep_indicator(stress_level, string)
    workload_indicator(stress_level, string)
    wellness_indicator(stress_level, string)
    meeting_indicator(stress_level, string)
    research_indicator(stress_level, string)
    committee_indicator(stress_level, string)
    admin_indicator(stress_level, string)
    balance_indicator(stress_level, string)
    productivity_indicator(stress_level, string)
    health_indicator(stress_level, string)

    % Rules for recommendations
    primary_recommendation(stress_level, recommendation)
    workload_recommendation(stress_level, recommendation)
    wellness_recommendation(stress_level, recommendation)
    time_management_recommendation(stress_level, recommendation)
    social_recommendation(stress_level, recommendation)
    preventive_recommendation(stress_level, recommendation)

    % Display predicates
    display_header(faculty_id, stress_level)
    display_indicators(stress_level)
    display_recommendations(stress_level)
    display_footer

clauses
    /* ========================================
       KNOWLEDGE BASE - FACTS (10+ facts)
       Conditions and indicators related to
       faculty well-being and workload patterns
       ======================================== */

    % Fact 1: Sleep indicators
    sleep_indicator(low, "Adequate sleep (7+ hours) - Good recovery pattern").
    sleep_indicator(medium, "Moderate sleep (6 hours) - Recovery may be compromised").
    sleep_indicator(high, "Insufficient sleep (<6 hours) - Severe recovery deficit").

    % Fact 2: Workload indicators
    workload_indicator(low, "Manageable workload - Within sustainable limits").
    workload_indicator(medium, "Elevated workload - Approaching capacity limits").
    workload_indicator(high, "Excessive workload - Beyond sustainable capacity").

    % Fact 3: Wellness state indicators
    wellness_indicator(low, "Good overall wellness - Balanced lifestyle").
    wellness_indicator(medium, "Moderate wellness concerns - Some imbalance detected").
    wellness_indicator(high, "Critical wellness state - Immediate intervention needed").

    % Fact 4: Meeting load indicators
    meeting_indicator(low, "Reasonable meeting schedule - Adequate focus time").
    meeting_indicator(medium, "Moderate meeting load - Some fragmentation of work time").
    meeting_indicator(high, "Excessive meetings - Significant work fragmentation").

    % Fact 5: Research load indicators
    research_indicator(low, "Light research commitment - Time for other activities").
    research_indicator(medium, "Moderate research load - Balanced with teaching").
    research_indicator(high, "Heavy research demands - May conflict with teaching duties").

    % Fact 6: Committee involvement indicators
    committee_indicator(low, "Minimal committee duties - Focus on core responsibilities").
    committee_indicator(medium, "Standard committee involvement - Manageable service load").
    committee_indicator(high, "Heavy committee burden - Service overload risk").

    % Fact 7: Administrative task indicators
    admin_indicator(low, "Light administrative load - Focus on academic work").
    admin_indicator(medium, "Moderate admin tasks - Balance maintained").
    admin_indicator(high, "Heavy administrative burden - Core duties may suffer").

    % Fact 8: Work-life balance indicators
    balance_indicator(low, "Healthy work-life balance - Personal time preserved").
    balance_indicator(medium, "Strained balance - Weekend work occurring").
    balance_indicator(high, "Poor work-life balance - Chronic weekend work").

    % Fact 9: Productivity state indicators
    productivity_indicator(low, "Optimal productivity zone - Sustainable performance").
    productivity_indicator(medium, "Productivity at risk - Efficiency may decline").
    productivity_indicator(high, "Productivity compromised - Burnout likely").

    % Fact 10: Physical health risk indicators
    health_indicator(low, "Low health risk - Stress within healthy limits").
    health_indicator(medium, "Moderate health risk - Monitor for symptoms").
    health_indicator(high, "High health risk - Physical symptoms likely").

    /* ========================================
       RULES (6+ rules)
       Map stress levels to recommendations
       ======================================== */

    % Rule 1: Primary action recommendations
    primary_recommendation(low, "MAINTAIN: Continue current routine and practices. Your stress management is effective.").
    primary_recommendation(medium, "MONITOR: Implement time-blocking strategies. Track your energy levels throughout the week.").
    primary_recommendation(high, "URGENT: Request immediate workload adjustment. Consider delegating tasks and reducing commitments.").

    % Rule 2: Workload management recommendations
    workload_recommendation(low, "Keep workload at current levels. Consider taking on mentorship roles.").
    workload_recommendation(medium, "Review task priorities weekly. Identify tasks that can be delegated or postponed.").
    workload_recommendation(high, "Request reduction in teaching load or number of advisees. Decline new committee assignments.").

    % Rule 3: Wellness activity recommendations
    wellness_recommendation(low, "Continue regular exercise and social activities. Consider preventive health checkups.").
    wellness_recommendation(medium, "Schedule 15-minute breaks every 2 hours. Add one wellness activity per week.").
    wellness_recommendation(high, "Implement daily wellness breaks. Consider counseling services. Schedule health assessment.").

    % Rule 4: Time management recommendations
    time_management_recommendation(low, "Optimize your schedule for long-term sustainability. Build buffer time for unexpected tasks.").
    time_management_recommendation(medium, "Use calendar blocking for focused work. Batch similar tasks together. Set meeting-free days.").
    time_management_recommendation(high, "Audit all time commitments immediately. Cancel non-essential meetings. Request deadline extensions.").

    % Rule 5: Social and support recommendations
    social_recommendation(low, "Maintain professional networks. Share best practices with colleagues.").
    social_recommendation(medium, "Connect with peer support groups. Discuss workload concerns with department head.").
    social_recommendation(high, "Seek immediate supervisor support. Contact faculty wellness resources. Consider professional counseling.").

    % Rule 6: Preventive measures recommendations
    preventive_recommendation(low, "Plan ahead for busy periods. Build resilience through varied activities.").
    preventive_recommendation(medium, "Establish early warning signs for stress. Create contingency plans for high-demand periods.").
    preventive_recommendation(high, "Immediate stress intervention needed. Establish recovery plan with clear milestones.").

    /* ========================================
       DISPLAY PROCEDURES
       ======================================== */

    display_header(FacultyID, StressLevel) :-
        write("\n"),
        write("============================================================\n"),
        write("    FACULTY WELLNESS RECOMMENDATION SYSTEM\n"),
        write("    Expert System Analysis Report\n"),
        write("============================================================\n\n"),
        write("Faculty ID: "), write(FacultyID), write("\n"),
        write("Stress Level: "),
        StressLevel = low, write("LOW"), write("\n"), !.

    display_header(FacultyID, StressLevel) :-
        write("\n"),
        write("============================================================\n"),
        write("    FACULTY WELLNESS RECOMMENDATION SYSTEM\n"),
        write("    Expert System Analysis Report\n"),
        write("============================================================\n\n"),
        write("Faculty ID: "), write(FacultyID), write("\n"),
        write("Stress Level: "),
        StressLevel = medium, write("MEDIUM"), write("\n"), !.

    display_header(FacultyID, StressLevel) :-
        write("\n"),
        write("============================================================\n"),
        write("    FACULTY WELLNESS RECOMMENDATION SYSTEM\n"),
        write("    Expert System Analysis Report\n"),
        write("============================================================\n\n"),
        write("Faculty ID: "), write(FacultyID), write("\n"),
        write("Stress Level: "),
        StressLevel = high, write("HIGH - ATTENTION REQUIRED"), write("\n"), !.

    display_indicators(StressLevel) :-
        write("\n------------------------------------------------------------\n"),
        write("CONDITION INDICATORS (Knowledge Base Facts)\n"),
        write("------------------------------------------------------------\n"),
        sleep_indicator(StressLevel, SleepInd),
        write("* Sleep: "), write(SleepInd), write("\n"),
        workload_indicator(StressLevel, WorkloadInd),
        write("* Workload: "), write(WorkloadInd), write("\n"),
        wellness_indicator(StressLevel, WellnessInd),
        write("* Wellness: "), write(WellnessInd), write("\n"),
        balance_indicator(StressLevel, BalanceInd),
        write("* Work-Life Balance: "), write(BalanceInd), write("\n"),
        productivity_indicator(StressLevel, ProdInd),
        write("* Productivity: "), write(ProdInd), write("\n"),
        health_indicator(StressLevel, HealthInd),
        write("* Health Risk: "), write(HealthInd), write("\n").

    display_recommendations(StressLevel) :-
        write("\n------------------------------------------------------------\n"),
        write("PERSONALIZED RECOMMENDATIONS (Rule-Based Reasoning)\n"),
        write("------------------------------------------------------------\n\n"),

        write("1. PRIMARY ACTION:\n"),
        primary_recommendation(StressLevel, PrimaryRec),
        write("   "), write(PrimaryRec), write("\n\n"),

        write("2. WORKLOAD MANAGEMENT:\n"),
        workload_recommendation(StressLevel, WorkloadRec),
        write("   "), write(WorkloadRec), write("\n\n"),

        write("3. WELLNESS ACTIVITIES:\n"),
        wellness_recommendation(StressLevel, WellnessRec),
        write("   "), write(WellnessRec), write("\n\n"),

        write("4. TIME MANAGEMENT:\n"),
        time_management_recommendation(StressLevel, TimeRec),
        write("   "), write(TimeRec), write("\n\n"),

        write("5. SOCIAL SUPPORT:\n"),
        social_recommendation(StressLevel, SocialRec),
        write("   "), write(SocialRec), write("\n\n"),

        write("6. PREVENTIVE MEASURES:\n"),
        preventive_recommendation(StressLevel, PreventRec),
        write("   "), write(PreventRec), write("\n").

    display_footer :-
        write("\n------------------------------------------------------------\n"),
        write("RULE EXPLANATION:\n"),
        write("The above recommendations were generated by matching the\n"),
        write("predicted stress level against our expert knowledge base.\n"),
        write("Each recommendation rule considers workload patterns,\n"),
        write("wellness indicators, and evidence-based interventions.\n"),
        write("------------------------------------------------------------\n"),
        write("\nReport generated by Faculty Wellness Expert System\n"),
        write("============================================================\n").

    /* ========================================
       FILE READING AND PROCESSING
       ======================================== */

    read_stress_file(FacultyID, StressLevel) :-
        openread(stressfile, "stress_output.txt"),
        readdevice(stressfile),
        readln(Line1),
        readln(Line2),
        closefile(stressfile),
        % Parse faculty_id:xxx
        frontstr(11, Line1, _, FacultyID),
        % Parse stress_level:xxx and convert to domain
        frontstr(13, Line2, _, LevelStr),
        (LevelStr = "low", StressLevel = low, !;
         LevelStr = "medium", StressLevel = medium, !;
         LevelStr = "high", StressLevel = high).

    process_recommendations(FacultyID, StressLevel) :-
        display_header(FacultyID, StressLevel),
        display_indicators(StressLevel),
        display_recommendations(StressLevel),
        display_footer.

    /* ========================================
       MAIN ENTRY POINT
       ======================================== */

    run :-
        write("Reading stress prediction from Python ML component...\n"),
        read_stress_file(FacultyID, StressLevel),
        process_recommendations(FacultyID, StressLevel).

goal
    run.
