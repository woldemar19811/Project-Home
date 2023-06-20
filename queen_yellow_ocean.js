//1
// Create an HTML page which will display the text "Project Home"
<html>
    <head>
        <title>Project Home</title>
    </head>
    <body>
        <h1>Project Home</h1>
    </body>
</html>

//2
// Create a .js file which will contain the code
document.addEventListener("DOMContentLoaded", function(event) { 
    // Code goes here
});

//3
// Define a function which will run when the page is loaded
function init() {

}

//4
// Create an array of strings which will contain the names of our projects
let projects = ["Project 1", "Project 2", "Project 3", "Project 4", "Project 5"];

//5
// Create a loop which will iterate through the projects array
for (let i=0; i<projects.length; i++) {

//6
    // Create a div element and assign the project name as the ID
    let div = document.createElement('div'); 
    div.id = projects[i];

//7
    // Create a heading element and assign the project title as the content 
    let h2 = document.createElement('h2'); 
    h2.innerHTML = projects[i];

//8
    // Append the heading to the div element 
    div.appendChild(h2);

//9
    // Create a paragraph element and assign the project description
    let p = document.createElement('p');
    p.innerHTML = 'This is the project description for ' + projects[i];

//10
    // Append the paragraph to the div element 
    div.appendChild(p);

//11
    // Append the div to the body of the HTML page
    document.body.appendChild(div);
}

//12
// Call the init() function when the page is loaded 
init();