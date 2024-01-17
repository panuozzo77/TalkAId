package model.service.exercise;

import model.DAO.DAOExercise;
import model.DAO.DAOExerciseGlossary;
import model.entity.Exercise;
import model.entity.ExerciseGlossary;
import model.entity.SlimmerExercise;

import java.sql.Blob;
import java.sql.Date;
import java.util.List;

public class ExerciseManager implements ExerciseManagerInterface {
    private final DAOExerciseGlossary daoEG = new DAOExerciseGlossary();
    private final DAOExercise daoE = new DAOExercise();

    public ExerciseGlossary getExercise(int exerciseID) {
        return daoEG.getExerciseByCode(exerciseID);
    }

    public Blob getExecution(int exerciseID, int userID, Date insertionDate) {
        return daoE.getExerciseExecution(userID, exerciseID, insertionDate);
    }

    public boolean saveExecution(int userID, int exerciseId, Date insertDate, Blob execution) {

        return daoE.setExerciseExecution(userID, exerciseId, insertDate, execution);
    }

    public boolean saveEvaluation(int userID, int exerciseId, Date insertDate, int evaluation) {

        return daoE.setExerciseEvaluation(userID, exerciseId, insertDate, evaluation);
    }

    public List<Exercise> retrieveAllPatientExerciseDone(int userID){
        return daoE.retrieveAllPatientExerciseDone(userID);
    }

    public List<SlimmerExercise> retrieveDoneExercises(int patientId) {
        return daoE.retrieveDoneExercises(patientId);
    }

    public List<SlimmerExercise> retrieveNotDoneExercises(int patientId) {
        return daoE.retrieveNotDoneExercises(patientId);
    }

    public List<ExerciseGlossary> retrieveAllPatientExerciseGlossaryNotDone(int userID) { return daoEG.retrieveAllPatientExerciseGlossaryNotDone(userID);}

    public List<ExerciseGlossary> retrieveAllPatientExerciseGlossaryDone(int userID) { return daoEG.retrieveAllPatientExerciseGlossaryDone(userID);}

    public boolean AddExerciseRecommendation(int idExercise, int idPatient) { return daoE.AddExerciseRecommendation(idExercise,idPatient);}
}
