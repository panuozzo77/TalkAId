package controller;

        import model.service.condition.ConditionManager;
        import model.service.exercise.ExerciseManager;

        import javax.servlet.annotation.WebServlet;
        import javax.servlet.http.HttpServlet;
        import javax.servlet.http.HttpServletRequest;
        import javax.servlet.http.HttpServletResponse;
        import java.io.IOException;


@WebServlet("/exerciseRecommendation")
public class exerciseRecommendation extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String referer = request.getHeader("Referer");
        ExerciseManager exerciseService= new ExerciseManager();

        int idExercise = Integer.parseInt(request.getParameter("idExercise"));
        int idPatient = Integer.parseInt(request.getParameter("idPatient"));

        exerciseService.AddExerciseRecommendation(idExercise,idPatient);

        response.sendRedirect(referer);

    }

}
