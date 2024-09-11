 
  <!DOCTYPE html>
  <html lang="en">
    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <script
        src="https://kit.fontawesome.com/64d58efce2.js"
      ></script>
      <link rel="stylesheet" href="style/new-style.css" />
      <title>Sign in & Sign up Form</title>
    </head>
    <body>
     <!--
      <div class="container">
        <div class="forms-container">
          <div class="signin-signup">
            <form method="post" action="login" class="sign-in-form">
              <h2 class="title">Log in</h2>
              <div class="input-field">
                <i class="fas fa-envelope"></i>
                <input type="text" placeholder="Email" name="EmailLogin"/>
              </div>
              <div class="input-field">
                <i class="fas fa-lock"></i>
                <input type="password" placeholder="Password" name="PasswordLogin"/>
              </div>
             
              <input type="submit" value="login" class="btn solid" />
              <p class="social-text">Or Sign in with social platforms</p>
              <div class="social-media">
                <a href="#" class="social-icon">
                  <i class="fab fa-facebook-f"></i>
                </a>
                <a href="#" class="social-icon">
                  <i class="fab fa-twitter"></i>
                </a>
                <a href="#" class="social-icon">
                  <i class="fab fa-google"></i>
                </a>
                <a href="#" class="social-icon">
                  <i class="fab fa-linkedin-in"></i>
                </a>
              </div>
            </form>
            <form method="post" action="UserRegistration" class="sign-up-form">
              <h2 class="title">Register</h2>
              <div class="input-field">
                <i class="fas fa-envelope"></i>
                <input type="email" placeholder="Email" name="EmailSignUp"/>
              </div>
              <div class="input-field">
                <i class="fas fa-user"></i>
                <input type="text" placeholder="Username" name="UsernameSignUp"/>
              </div>
              <div class="input-field">
                <i class="fas fa-lock"></i>
                <input type="password" placeholder="Password" name="PasswordSignUp"/>
              </div>
              
              <input type="submit" class="btn" value="Register" name="signup"/>
              <p class="social-text">Or Sign up with social platforms</p>
              <div class="social-media">
                <a href="https://www.facebook.com/mohit.sanji" class="social-icon">
                  <i class="fab fa-facebook-f"></i>
                </a>
                <a href="#" class="social-icon">
                  <i class="fab fa-twitter"></i>
                </a>
                <a href="https://w15.mangafreak.net/Search/one%20piece" class="social-icon">
                  <i class="fab fa-google"></i>
                </a>
                <a href="#" class="social-icon">
                  <i class="fab fa-linkedin-in"></i>
                </a>
              </div>
            </form>
          </div>
        </div>
  
        <div class="panels-container">
          <div class="panel left-panel">
            <div class="content">
              <h3>New here ?</h3>
              <p>
                No i am
              </p>
              <button class="btn transparent" id="sign-up-btn">
                Sign up
              </button>
            </div>
            <img src="images/login/log.png" class="image" alt="" />
          </div>
          <div class="panel right-panel">
            <div class="content">
              <h3>One of us ?</h3>
              <p>
               You can click here.
              </p>
              <button class="btn transparent" id="sign-in-btn">
                Sign in
              </button>
            </div>
            <img src="login/register.png" class="image" alt="" />
          </div>
        </div>
      </div>
  		
      <script src="scripts/app.js"></script>
       -->
       
       
       <div class="form-structor">
    <div class="signup">
        <h2 class="form-title" id="signup"><span>or</span>Sign up</h2>
        <div class="form-holder">
            <form method="post" action="UserRegistration" class="sign-up-form">
                <div class="input-field">
                    <input type="email" class="input" placeholder="Email" name="EmailSignUp"/>
                </div>
                <div class="input-field">
                    <input type="text" class="input" placeholder="Username" name="UsernameSignUp"/>
                </div>
                <div class="input-field">
                    <input type="password" class="input" placeholder="Password" name="PasswordSignUp"/>
                </div>
                <!-- Backend error message for signup -->
                <% String errorMessageregister = (String) request.getAttribute("errorMessageregister");
                if (errorMessageregister != null) { %>
                    <div style="color: red; margin-top: 10px;"><%= errorMessageregister %></div>
                <% } %>
                <button class="submit-btn" type="submit">Sign up</button>
            </form>
        </div>
    </div>
    <div class="login slide-up">
        <div class="center">
            <h2 class="form-title" id="login"><span>or</span>Log in</h2>
            <div class="form-holder">
                <form method="post" action="login" class="sign-in-form">
                    <div class="input-field">
                        <input type="text" class="input" placeholder="Email" name="EmailLogin"/>
                    </div>
                    <div class="input-field">
                        <input type="password" class="input" placeholder="Password" name="PasswordLogin"/>
                    </div>
                    <!-- Backend error message for login -->
                    <% String errorMessage = (String) request.getAttribute("errorMessage");
                    if (errorMessage != null) { %>
                        <div style="color: red; margin-top: 10px;"><%= errorMessage %></div>
                    <% } %>
                    <button class="submit-btn" type="submit">Log in</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
console.clear();

const loginBtn = document.getElementById('login');
const signupBtn = document.getElementById('signup');

loginBtn.addEventListener('click', (e) => {
	let parent = e.target.parentNode.parentNode;
	Array.from(e.target.parentNode.parentNode.classList).find((element) => {
		if(element !== "slide-up") {
			parent.classList.add('slide-up')
		}else{
			signupBtn.parentNode.classList.add('slide-up')
			parent.classList.remove('slide-up')
		}
	});
});

signupBtn.addEventListener('click', (e) => {
	let parent = e.target.parentNode;
	Array.from(e.target.parentNode.classList).find((element) => {
		if(element !== "slide-up") {
			parent.classList.add('slide-up')
		}else{
			loginBtn.parentNode.parentNode.classList.add('slide-up')
			parent.classList.remove('slide-up')
		}
	});
});
</script>
    </body>
  </html>
  