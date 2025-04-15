**ID Number:** 1
**Type:** Functional  <br>
**Description:**   
Users are able to create a task with a title, description, date, and recurrence 
frequency (monthly, 6 months, year, or custom).
**Rationale:**   
To create an efficient way for the user to manage recurring tasks and important 
deadlines. 
**Fit Criterion:**  
The task when created will be added to the list with the correct title, 
description, date, and frequency. Recurring dates must be automatically created 
with the specific interval.
**Priority:** High   
**Dependencies:** Requirement 10

---

**ID Number:** 2
**Type:** Functional
**Description:** 
Users are able to delete or edit existing tasks to modify details without having 
to create a new one.
**Rationale:** 
Keeps the task management updated to the users needs and prevents cluttering the 
dashboard with tasks that are no longer needed. 
**Fit Criterion:** 
Tasks will reflect the modified edits and have the correct information. Deleted 
tasks are no longer displayed.
**Priority:** High 
**Dependencies:** Requirement 1

---

**ID Number:** 3
**Type:** Useability
**Description:** 
Users can select from default categories or create new categories for tasks and 
events.
**Rationale:** 
Categories will aid with organizing by allowing the user to group tasks and 
events by type, such as appliance maintenance, car maintenance, or 
documents/licenses management.  
**Fit Criterion:** 
When creating a task the user can choose the category it falls under or add a 
category to an existing task. 
**Priority:** High
**Dependencies:** Requirement 1, Requirement 2

---

**ID Number:** 4
**Type:** Functional
**Description:** 
Allow users to mark tasks with levels of urgency.
**Rationale:** 
This will help prioritize tasks based on the level of urgency.
**Fit Criterion:** 
The urgency status will be visually represented by color and text.
**Priority:** Medium
**Dependencies:** Requirement 1, Requirement 2

---

**ID Number:** 5
**Type:** Functional
**Description:** 
Allow users to mark whether deadlines are concrete or flexible.
**Rationale:** 
With deadlines differentiated between flexible and concrete will help with 
prioritization. Flexible deadlines could be postponed and concrete deadlines 
are given more priority. 
**Fit Criterion:** 
Concrete deadlines will have the task’s date locked with flexible deadlines 
still editable. For concrete deadlines they can only be changed if the concrete 
status is changed.
**Priority:** Medium
**Dependencies:** Requirement 1, Requirement 2

---

**ID Number:** 6
**Type:** Functional
**Description:**  
Determines the priority of the tasks/events based on level of urgency and 
deadline status.
**Rationale:** 
Helps identify the tasks with the highest importance by taking into account 
urgency and deadline constraints. 
**Fit Criterion:** 
Tasks with high urgency and concrete deadlines are assigned the highest priority 
with tasks of low urgency and flexible deadlines assigned lower priority.
**Priority:** High
**Dependencies:** Requirement 1, Requirement 3, Requirement 4, Requirement 5

---

**ID Number:** 7
**Type:** Look and Feel
**Description:**  
Users can view the tasks on a dashboard where it displays overdue and upcoming 
tasks.
**Rationale:** 
Being able to see the tasks in one place allows the user to visually see the 
tasks that require the immediate attention. 
**Fit Criterion:** 
The tasks are displayed correctly based on priority and organized by category.
**Priority:** High
**Dependencies:** Requirement 1, Requirement 3, Requirement 6

---

**ID Number:** 8
**Type:** Functional
**Description:** 
Allow users to mark tasks as complete.
**Rationale:** 
Once a task is complete it no longer has to be in the list of tasks that need to 
be completed and recurring tasks would not need to be deleted.
**Fit Criterion:** 
The completed tasks are moved to a different section and will have a completed 
date added for that instance of recurring tasks. 
**Priority:** Medium 
**Dependencies:** Requirement 1, Requirement 2, Requirement 3

---

**ID Number:** 9
**Type:** Look and Feel
**Description:** 
Visual representation of the task progress of categories using icons.
**Rationale:** 
Provides a visual representation of the user’s progress and to summarize if 
certain categories are being neglected. 
**Fit Criterion:** 
The icon will change depending on if the tasks are completed (normal appearance)
 or left uncompleted past date (broken appearance). 
**Priority:** Medium
**Dependencies:** Requirement 1, Requirement 2, Requirement 7

---

**ID Number:** 10
**Type:** Functional
**Description:** 
Enable recurring scheduling of tasks.
**Rationale:** 
Makes it convenient to the user to schedule recurring tasks that have the same 
details without having to repeatedly create the same tasks that occur after a 
specific time frame. 
**Fit Criterion:** 
Users can set the time interval of the time between the repeating task within 
the range of days to year. 
**Priority:** Medium 
**Dependencies:** Requirement 1, Requirement 2

---

**ID Number:** 11
**Type:** Convenience 
**Description:** 
In the task dashboard, display a countdown of the days remaining for the tasks 
using the deadline and current date.
**Rationale:** 
Displaying the number of days would help the user gauge the time remaining 
rather than looking at a date. 
**Fit Criterion:** 
Displays the correct number of days between the current date and the task 
deadline. 
**Priority:** Low
**Dependencies:** Requirement 7

---

**ID Number:** 12
**Type:** Personalization and Internationalization
**Description:** 
Users will be able to select a color theme and change colors of categories. 
**Rationale:** 
Allows for the interface to match the user’s preference. 
**Fit Criterion:** 
Users can change and save color themes using the settings menu. 
**Priority:** Low
**Dependencies:** Requirement 3, Requirement 7

---

**ID Number:** 13
**Type:** Convenience 
**Description:** 
Allow the user to determine which categories appear on the dashboard.
**Rationale:** 
Gives the user more control with which categories they would like to focus on at 
that specific time. 
**Fit Criterion:** 
The dashboard would correctly display the tasks in the selected category. This 
would not delete the tasks in the categories not chosen. 
**Priority:** Medium 
**Dependencies:** Requirement 7

---

**ID Number:** 14
**Type:** Accessibility 
**Description:** 
Allow users to change the sizing of the text.
**Rationale:** 
Depending on the user’s needs, larger text size might be needed for 
accessibility. 
**Fit Criterion:** 
The sizing of the text is accurately changed and displays correctly without
altering the appearance of the tasks and icons. Such as no overflow text or 
text overlapping. 
**Priority:** Medium
**Dependencies:** Requirement 7

---

**ID Number:** 15
**Type:** Usability 
**Description:** 
Reminders for special events that would require earlier preparation before date.
**Rationale:** 
For events like birthdays or attending weddings, additional steps like ordering 
gifts or planning transportation like air travel might be needed.
**Fit Criterion:** 
Special text appears along with the task on the dashboard to remind the user of 
preparation. 
**Priority:** Medium
**Dependencies:** Requirement 7

---

**ID Number:** 16
**Type:** Convenience 
**Description:** 
Enable the ability to add additional notes to a task.
**Rationale:** 
With a long term time frame between creating the task and the task deadline 
information needed is likely to be forgotten. Information like passwords or 
location of items. 
**Fit Criterion:** 
The notes will be minimized until the task is selected and expands when the 
user selects view notes. 
**Priority:** Medium
**Dependencies:** Requirement 7

---

**ID Number:** 17
**Type:** Functional
**Description:** 
Users will be able to mark their availability to help scheduling.
**Rationale:** 
If the user has a consistent schedule of either working or classes it would be 
helpful to be recommended times to set important tasks/events. 
**Fit Criterion:** 
	Once the user’s schedule is added, the recommended times will update to 
    match. 
**Priority:** Medium 
**Dependencies:** None

---

**ID Number:** 18
**Type:** Functional 
**Description:** 
Warns users if they are scheduling tasks on the same time frame on the same day. 
**Rationale:** 
If the task is a recurring appointment at a specific time it cannot overlap with 
another appointment. 
**Fit Criterion:** 
Text message appears to warn the user about the conflicting times and suggests a 
different time/date. 
**Priority:** Medium 
**Dependencies:** Requirement 17

---

**ID Number:** 19
**Type:** Convenience
**Description:** 
Email sent to the user of a report of upcoming tasks or events.
**Rationale:** 
Provides additional reminders to the user with a weekly/monthly report of 
upcoming tasks/events without the user having to open the web application. 
**Fit Criterion:** 
Email is sent to the user that contains the correct tasks that will be occurring 
in that week/month.
**Priority:** Medium
**Dependencies:** Requirement 1, Requirement 3, Requirement 6, Requirement 20

---

**ID Number:** 20
**Type:** Functional
**Description:** 
Allow users to create an account by filling out a form for username, email, and 
password.
**Rationale:** 
This would allow for users to have individual accounts to save their tasks and 
allow them to sign in on different devices. 
**Fit Criterion:** 
The user would be able to create an account by submitting the form and be able 
to access their specific data by logging in. Once logged in their account 
details should match the user. 
**Priority:** High 
**Dependencies:** Requirement 21

---

**ID Number:** 21
**Type:** Security
**Description:** 
Prevents the creation of an account of an email that is already in use and 
requires the entry of valid email addresses and password that matches the 
requirements. 
**Rationale:** 
This would ensure that each account is created using a unique email and ensures 
that the user is using a password that is more secure. 
**Fit Criterion:** 
Validates email formats and checks email addresses with existing accounts. 
Checks that passwords meet the requirements which are displayed to the user 
using text. If it does not pass the requirements, an error message will appear 
describing which requirements are not met. If all requirements are met, then 
account creation can proceed. 
**Priority:** High 
**Dependencies:** Requirement 20

---

**ID Number:** 22
**Type:** Convenience 
**Description:** 
Enable the use of a search function for the tasks and events. 
**Rationale:** 
Rather than have the user manually search a task that they might wish to view, 
edit, or delete allows for a quick and efficient way to search. 
**Fit Criterion:** 
The results should include tasks that are based on the user input such as the 
title and category. It should be able to handle partial matches and allows for 
filtering by date, level of urgency, or concrete/flexible deadline. 
**Priority:** Medium 
**Dependencies:** Requirement 1

---

**ID Number:** 23
**Type:** Understandability and Politeness
**Description:** 
Provide descriptions of how to use the web application.
**Rationale:** 
Allows for first time users to navigate the web application with ease and aid in 
their understanding of how to complete the actions.
**Fit Criterion:** 
Text descriptions will be displayed and when hovering over with the mouse will 
provide a short description about the object.
**Priority:** Medium 
**Dependencies:** Requirement 7

---

**ID Number:** 24
**Type:** Personalization and Internationalization
**Description:** 
Enable the user to track long term goals alongside recurring tasks.
**Rationale:** 
As web application is used to track long term recurring tasks, it would be more
convient for the user to also track their long term goals.
**Fit Criterion:** 
Similar to task creation with changes, it should include title, description, 
milestones, deadlines, and visually different from other tasks/categories by 
using a different shape.
**Priority:** Low 
**Dependencies:** Requirement 1, Requirement 7


---

**ID Number:** 25
**Type:** Personalization and Internationalization
**Description:** 
Enable the user to track how often they complete tasks and which months are they 
the most productive/busy.
**Rationale:** 
By seeing their progress the user will feel motivated to continue completing 
tasks and maintenance. Being able to see their busy months would allow them to 
do tasks earlier to lessen their load.
**Fit Criterion:** 
Display texts with the description of most productive month and busy month with 
the correct months based on the user's data.
**Priority:** Low 
**Dependencies:** Requirement 7, Requirement 8

