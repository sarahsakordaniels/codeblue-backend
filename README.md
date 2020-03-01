
# What Is CodeCourse?

CodeCourse is an interactive code blue manager for guiding healthcare providers through the Advanced Cardiac Life Support (ACLS) algorithm when a patient goes into cardiac arrest.

ACLS is like CPR, but with higher level interventions such as IV medications, defibrillation (shocks to the heart), and intubation (a tube inserted into the airway to facilitate artificial breathing support). 

During a code blue, there are many actions that need to be taken and details to be recorded. Mistakes can be life-threatening for the patient. CodeCourse was designed to foster a safer, more streamlined process. 

# What Inspired This Application?

I wanted to develop an application that helps solve a problem I've experienced with my colleagues. Along with coding, I work as a neurology ICU nurse. When a code blue happens anywhere in the hospital, we still record the entire process on paper. When someones life is on the line, it can be difficult to quickly and accurately record all the details. Using an application rather than pen and paper can help healthcare providers redirect invaluable focus and energy toward safe patient care. 

# Installation

To set this API up in your local envinronment...

1.	Run `bundle` to install any gems/dependencies.

2. Run `rails db:create`, `rails db:migrate`, and `rails db:seed`. 
  
    + At the time of writing this readme, there are sample "patient" and "user" profiles in the seed file for demonstration purposes.

3. Run `rails s` to boot up the server on localhost:3000.

4. [Click here](https://github.com/sarahsakordaniels/codeblue-frontend) for directions on setting up the frontend.


# Application In Action

Check out this video for a demonstration of how CodeCourse works.

<a href="http://www.youtube.com/watch?feature=player_embedded&v=H9hf3JyUeNU
" target="_blank"><img src="http://img.youtube.com/vi/H9hf3JyUeNU/0.jpg" 
alt="CodeCourse Video" width="240" height="180" border="10" /></a>

# Built With
- **React** - frontend JavaScript framework
- **Rails** - backend Ruby framework

# Future Implementations
- In Progress: CodeCourse was built in the beginning stages of my software development journey at Flatiron School. I'm still passionate about the concept of this application and continue to improve its structure as I learn more about React, Ruby, and various best practices. A lot of refactoring and restructuring is in the works!
- A feature to allow the healthcare provider to record patient vital signs and view trends in blood pressure, oxygen saturation, temperature, heart rate, and respiration rate. Close monitoring of patient vital signs is imperative in preventing a code blue from ever occurring. 

# Contact Me
sarahsakordaniels@gmail.com

[LinkedIn](https://www.linkedin.com/in/sarahsakordaniels/)

[Medium](www.medium.com/@sarahsakordaniels)

