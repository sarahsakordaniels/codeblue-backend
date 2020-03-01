
# What Is CodeCourse?

CodeCourse is an interactive code blue manager for guiding healthcare providers through the Advanced Cardiac Life Support (ACLS) algorithm when a patient goes into cardiac arrest.

ACLS is like CPR, but with higher level interventions such as IV medications, defibrillation (shocks to the heart), and intubation (a tube inserted into the airway to facilitate artificial breathing support). 

During a code blue, there are many actions that need to be taken and details to be recorded. Mistakes can be life-threatening for the patient. CodeCourse was designed to foster a safer, more streamlined process. 


# Setup

To set this API up in your local envinronment...

1.	Run `bundle` to install any gems/dependencies.

2. Run `rails db:create`, `rails db:migrate`, and `rails db:seed`. 
  
    + At the time of writing this readme, there are sample "patient" and "user" profiles in the seed file for demonstration purposes.

3. Run `rails s` to boot up the server on localhost:3000.

4. [Click here](https://github.com/sarahsakordaniels/codeblue-frontend) for directions on setting up the frontend.


# Use

Check out this video for a demonstration of how CodeCourse works.

<a href="http://www.youtube.com/watch?feature=player_embedded&v=H9hf3JyUeNU
" target="_blank"><img src="http://img.youtube.com/vi/H9hf3JyUeNU/0.jpg" 
alt="CodeCourse Video" width="240" height="180" border="10" /></a>


# Future Implementations
CodeCourse is an ongoing project with many upcoming features in development. In addition to adding a code blue event to a patient's profile, I am developing a feature that will allow the healthcare provider to record patient vital signs and view trends in blood pressure, oxygen saturation, temperature, heart rate, and respiration rate. Close monitoring of patient vital signs is imperative in preventing a code blue from ever occurring. 

