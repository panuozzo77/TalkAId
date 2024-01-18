$(document).ready(function () {
    let canvas = document.getElementById('myChart');
    let parentContainer = canvas.parentNode;

    $("#home").click(() => redirect("homepageTherapist.jsp"));
    $("#message").click(() => redirect("messageCenter.jsp"));
    $("#agenda").click(() => redirect("schedule.jsp"));
    $("#docInfo").click(() => redirect("userArea.jsp"));

    canvas.width = parentContainer.offsetWidth;
    canvas.height = parentContainer.offsetHeight;
})

function showExercises(){
    $("#content").hide();
    $("#conditionsDiv").hide();
    $("#exercisesDiv").show();
}

function showCondition(){
    $("#content").hide();
    $("#exercisesDiv").hide();
    $("#conditionsDiv").show();
}

function showPatient(){
    $("#exercisesDiv").hide();
    $("#conditionsDiv").hide();
    $("#content").show();
}

function redirect(where){
    window.location.href = where;
}