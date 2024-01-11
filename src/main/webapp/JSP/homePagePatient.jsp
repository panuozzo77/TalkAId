<%@ page import="model.service.exercise.ExerciseManager" %>
<%@ page import="java.util.List" %>
<%@ page import="model.entity.PersonalInfo" %>
<%@ page import="model.service.user.UserRegistry" %>
<%@ page import="model.entity.SlimmerExercise" %>
<!DOCTYPE html>
<html lang="it" style="background-color: #f7fcff; ">
<%
    if(session.getAttribute("id") == null) {
        response.sendRedirect("../errorPage/403.html");
    }
    else {
        int userId = (Integer) session.getAttribute("id");
        UserRegistry ur = new UserRegistry();
        PersonalInfo data= ur.getPersonalInfo(userId);
%>
<head>
    <%@page contentType="text/html;charset=UTF-8"%>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="../CSS/homepagepatient.css" />
    <title>Homepage</title>
</head>


<%
    if(session.getAttribute("exercise") !=null){
        session.removeAttribute("exercise");
    }
%>
<body>

<div class="container">
    <div class="margin20">
        <div class="card">
            <div class="header">
                Ciao <%=data.getFirstname()%> <%=data.getLastname()%>
            </div>
        </div>
    </div>




    <div class="margin20">
        <div class="challenges">
            <div class="margin20">
                <div class="navigation-title">
                    <div class="current-lesson">Esercizi:</div>
                    <button id="openAll" class="buttons">Guarda tutti</button>
                </div>
            </div>
        </div>
    </div>


    <div class="divbar"></div>


    <div class="margin20">
        <div class="challenges">
            <div class="margin20">
                <div class="navigation-title">
                    <div class="current-lesson">Esercizi Non Completati</div>
                </div>
            </div>
            <div class="cards">

                <%
                    ExerciseManager exerciseManager = new ExerciseManager();
                    List<SlimmerExercise> list1 = exerciseManager.retrieveNotDoneExercises(userId);

                    if(!list1.isEmpty()){
                        int maxCardsToShow = 5;
                        int cardCounter = 0;
                        for(SlimmerExercise exercise : list1) {
                %>
                <form action="${pageContext.request.contextPath}/exerciseController" method="post">
                    <div class="card2">
                        <div class="frame-3"><div class="frame-4"><div class="frame-5"><div class="frame-7">
                            <div class="illustration-wrapper">
                                <img class="illustration" src="../images/homepagepatient/illustration-challenges-1.svg">
                            </div></div>
                            <div class="discovering-english"><%=exercise.getName()%></div>
                        </div></div></div>
                        <input type="hidden" name="exerciseID" value="<%=exercise.getId()%>">
                        <input type="hidden" name="insertionDate" value="<%=exercise.getInsertionDate()%>">
                        <button class="button-2" type="submit">Comincia l'esercitazione</button>
                    </div>
                </form>
                <%
                        cardCounter++;
                        if (cardCounter >= maxCardsToShow) {
                            break;  // Interrompi il ciclo se il numero massimo di cards è stato raggiunto
                        }
                    }
                }
                else {
                %>
                %>
                <div class="discovering-english">Esercizi non disponibili</div>
                <%
                    }
                %>
            </div>
        </div>
    </div>


    <div class="divbar"></div>


    <div class="margin20">
        <div class="challenges">
            <div class="margin20">
                <div class="navigation-title">
                    <div class="current-lesson">Esercizi Svolti</div>
                    <button onclick="goReport()" class="buttons">Guarda Report</button>
                </div>
            </div>
            <div class="cards">

                <%
                    List<SlimmerExercise> list2 = exerciseManager.retrieveDoneExercises(userId);
                    if(!list2.isEmpty()){
                        int maxCardsToShow = 5;
                        int cardCounter = 0;
                        for(SlimmerExercise exercise : list2) {
                %>
                <form action="${pageContext.request.contextPath}/exerciseController" method="post">
                    <div class="card2">
                        <div class="frame-3"><div class="frame-4"><div class="frame-5"><div class="frame-7">
                            <div class="illustration-wrapper">
                                <img class="illustration" src="../images/homepagepatient/check.png">
                            </div></div>
                            <div class="discovering-english"><%=exercise.getName()%></div>
                        </div></div></div>
                        <input type="hidden" name="exerciseID" value="<%=exercise.getId()%>">
                        <input type="hidden" name="insertionDate" value="<%=exercise.getInsertionDate()%>">
                        <button class="button-2" type="submit">Visualizza Punteggio</button>
                    </div>
                </form>
                <%
                        cardCounter++;
                        if (cardCounter >= maxCardsToShow) {
                            break;  // Interrompi il ciclo se il numero massimo di cards è stato raggiunto
                        }
                    }
                }
                else {
                %>
                %>
                <div class="discovering-english">Esercizi non disponibili</div>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</div>




<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    function goReport() {
        window.location.href = "patientReport.jsp";
    }

    $(document).ready(function() {
        $("#openAll").click(function () {
            let acardsDiv = $(".acards");
            if (acardsDiv.css("display") === "none") {
                acardsDiv.css("display", "flex");
            } else {
                acardsDiv.css("display", "none");
            }
        });
    });
</script>

<div>
    <jsp:include page="navbar.jsp"></jsp:include>
    <div id="userInfo" hidden
         data-type = "<%= session.getAttribute("type")%>"
    ></div>
</div>
</body>
</html>
<% } %>