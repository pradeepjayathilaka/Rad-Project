package classes;

import classes.DbConnector;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Question {

    private int id;
    private String questionText;
    private String[] options;
    private String correctAnswer;
    private int subjectId; 

   
    public Question(int id, String questionText, String[] options, String correctAnswer, int subjectId) {
        this.id = id;
        this.questionText = questionText;
        this.options = options;
        this.correctAnswer = correctAnswer;
        this.subjectId = subjectId; 
    }

    
    public int getId() {
        return id;
    }

    public String getQuestionText() {
        return questionText;
    }

    public String[] getOptions() {
        return options;
    }

    public String getCorrectAnswer() {
        return correctAnswer;
    }

    public int getSubjectId() {
        return subjectId; 
    }

    
    public static List<Question> getQuestionsBySubject(int subjectId) {
        List<Question> questionsList = new ArrayList<>();
        String query = "SELECT * FROM Question WHERE subject_id = ?"; 
        System.out.println(subjectId);

        try (Connection con = DbConnector.getConnection();
                PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, subjectId); 
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String questionText = rs.getString("question_text");
                String[] options = new String[4];
                options[0] = rs.getString("option1");
                options[1] = rs.getString("option2");
                options[2] = rs.getString("option3");
                options[3] = rs.getString("option4");
                String correctAnswer = rs.getString("correct_answer");

                Question question = new Question(id, questionText, options, correctAnswer, rs.getInt("subject_id")); 
                questionsList.add(question);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return questionsList;
    }

    
    public static boolean addQuestion(Question question) {
        String query = "INSERT INTO Question (question_text, option1, option2, option3, option4, correct_answer, subject_id) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = DbConnector.getConnection();
                PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, question.getQuestionText());
            ps.setString(2, question.getOptions()[0]);
            ps.setString(3, question.getOptions()[1]);
            ps.setString(4, question.getOptions()[2]);
            ps.setString(5, question.getOptions()[3]);
            ps.setString(6, question.getCorrectAnswer());
            ps.setInt(7, question.getSubjectId());
            return ps.executeUpdate() > 0; 
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false; 
        }
    }

    
    public static boolean removeQuestion(int questionId) {
        String query = "DELETE FROM Question WHERE id = ?"; 
        try (Connection con = DbConnector.getConnection();
                PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, questionId); 
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; 
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false; 
        }
    }

}
