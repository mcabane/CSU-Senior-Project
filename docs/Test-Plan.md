Test Plan Document
==================
- [IDENTIFICATION INFORMATION](#identification-information)
  - [Product](#product)
  - [Project Description](#project-description)
  - [Testing Objectives](#testing-objectives)
  - [Features to be Tested](#features-to-be-tested)
  - [Features Not to Be Tested](#features-not-to-be-tested)

### Product

- **Product Name:** Stay On Track Web Application

### Project Description

The Stay on Track web application will allow users to 
set up recurring tasks of different intervals (ex: monthly, 6 months, yearly). 
Users can organize tasks by categories and will be able to mark  tasks with 
different levels of urgency and the ability to mark if the deadline for said 
task is flexible or concrete. The dashboard will display tasks in different 
sections: Overdue, Upcoming, and Completed. The web application will include 
different icon statuses to show visual progression of the tasks. For example, 
if maintenance is continuously pushed off, the appliance icon will change to 
have a broken appearance. 

### Testing Objectives

The test plan will be used to confirm that the web application meets the project 
requirements and is able to catch errors that a user may experience when using 
web application. 


### Features to be Tested (Still in progress)

- Task Creation & Deletion (Requirements 1 & 2)
- Task Organization (Requirement 3)
- Task Prioritization (Requirements 4 - 6)
- Task Display (Requirements 7 & 9)
- Task Scheduling (Requirement 10)
- Task Countdown (Requirement 11)
- Account Creation & Deletion (Requirements 20, 21, 27)
- Responsive Design (Requirement 26)

### Features Not to Be Tested (Still in progress)
Features will not be tested as they are considered low priority and not part
of main purpose of web application.
- Color Customization (Requirement 12)
- Text Size Customization (Requirement 14)

USER-ACCEPTANCE TEST
--------------------

### User-Acceptance Test Strategy
The user acceptance testing will be performed by having users test specific 
features by following steps. The steps will be general to determine if the 
interface is intuitive. The users will be observed as they perform the test. 
User surveys will be used to receive feedback and gain measurable rating of 
specific qualities, such as ease of use. Feedback will be utilized to identify 
useability issues, errors, and areas of improvement.

### User-Acceptance Test Cases (Still in progress)
[Link to User-Acceptance Spreadsheet](https://docs.google.com/spreadsheets/d/11dUF_CXD5QZ_Sd4rQwZUygLuft3XUGi06R9DEXZEtvs/edit?usp=sharing)
| #   | TEST ITEM | TEST STEPS | EXPECTED RESULTS | ACTUAL RESULTS | DATE |
| --: | --------- | ---------- | ---------------- | -------------- | ---- |
|  1  |Creating Task|1. Navigate to task creation 2. Enter title 3. Enter description 4. Enter date 5. Select recurrence 6. Click "Create Task"|Task is created with the correct details that were entered. The recurrency dates are automatically created with the chosen interval|                |      |
|  2  |Editing Task|1. Select existing task 2. Click "Edit" 3. Modify title, description, date, or recurrence 4. Click "Save Changes" |Task fields shows modified changes for all instances of that task.|

