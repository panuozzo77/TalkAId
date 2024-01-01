package controller;

import model.entity.Schedule;
import model.service.schedule.ScheduleManager;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ScheduleServlet")
public class ScheduleServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int userId = 44;//(Integer) request.getSession().getAttribute("id");
        response.getWriter().append("Served at: ").append(request.getContextPath());
        String action = request.getParameter("action");
        ScheduleManager scheduleManager = new ScheduleManager();

        try {

            //azioni fatte dal logopedista

            if (action.equalsIgnoreCase("createNewSchedule")) {
                int idTherapist = Integer.parseInt(request.getParameter("idTherapist"));//cancellare
                scheduleManager.createNewSchedule(idTherapist,(request.getParameter("date")),(request.getParameter("timeslot")));//cancellare
                //scheduleManager.createNewSchedule(userId,(request.getParameter("date")),(request.getParameter("timeslot")));
                response.sendRedirect("JSP/schedule.jsp");
            }
            else if (action.equalsIgnoreCase("deleteSchedule")) {
                int idTherapist = Integer.parseInt(request.getParameter("idTherapist"));//cancellare
                scheduleManager.deleteSchedule(idTherapist,(request.getParameter("date")),(request.getParameter("timeslot")));//cancellare
                //scheduleManager.deleteSchedule(userId,(request.getParameter("date")),(request.getParameter("timeslot")));
                response.sendRedirect("JSP/schedule.jsp");
            }
            else if (action.equalsIgnoreCase("modifySchedule")) {
                int idReserved = Integer.parseInt(request.getParameter("idReserved"));
                int idTherapist = Integer.parseInt(request.getParameter("idTherapist"));//cancellare
                scheduleManager.modifySchedule(userId,(request.getParameter("date")),(request.getParameter("timeslot")),(request.getParameter("ndate")),(request.getParameter("ntimeslot")),idReserved);//cancellare
                //scheduleManager.modifySchedule(userId,(request.getParameter("date")),(request.getParameter("timeslot")),(request.getParameter("ndate")),(request.getParameter("ntimeslot")),idReserved);
                response.sendRedirect("JSP/schedule.jsp");
            }

            //azioni fatte dal paziente

            else if (action.equalsIgnoreCase("prenoteSchedule")) {
                int idTherapist = Integer.parseInt(request.getParameter("idTherapist"));
                int idReserved = Integer.parseInt(request.getParameter("idReserved"));//cancellare
                scheduleManager.modifySchedule(idTherapist,(request.getParameter("date")),(request.getParameter("timeslot")),(request.getParameter("date")),(request.getParameter("timeslot")),idReserved);//cancellare
                //scheduleManager.modifySchedule(idTherapist,(request.getParameter("date")),(request.getParameter("timeslot")),(request.getParameter("date")),(request.getParameter("timeslot")),userId);
                response.sendRedirect("JSP/schedule.jsp");
            }else if (action.equalsIgnoreCase("unprenoteSchedule")) {
                int idTherapist = Integer.parseInt(request.getParameter("idTherapist"));
                scheduleManager.modifySchedule(idTherapist,(request.getParameter("date")),(request.getParameter("timeslot")),(request.getParameter("date")),(request.getParameter("timeslot")),0);
                response.sendRedirect("JSP/schedule.jsp");
            }


            else {
                // Gestisci il caso in cui "action" non sia presente nella richiesta
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action parameter");
            }
    } catch (NumberFormatException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}