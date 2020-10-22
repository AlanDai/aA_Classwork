require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class User
    attr_accessor :id, :fname, :lname

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM users")
        data.map { |datum| User.new(datum) }
    end

    def self.find_by_id(id)
        queried_user = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                * 
            FROM 
                users
            WHERE
                id = ?;
        SQL
        return nil if queried_user.empty?
        User.new(queried_user.first)
    end

    def self.find_by_name(fname, lname)
        queried_user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
            SELECT
                * 
            FROM 
                users
            WHERE
                fname = ? AND lname = ?;
        SQL
        return nil if queried_user.empty?
        User.new(queried_user.first)
    end

    def initialize(options) 
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end

    def authored_questions
        Question.find_by_author_id(self.id)
    end


end 

class Question
    attr_accessor :id, :title, :body, :author_id

    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                * 
            FROM 
                questions
            WHERE
                id = ?;
        SQL
        return nil if data.empty?
        Question.new(data.first)
    end

    def self.find_by_author_id(author_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, author_id)
            SELECT
                *
            FROM
                questions
            WHERE
                author_id = ?;
        SQL
        return nil if data.empty?
        Question.new(data.first)
    end

    def initialize(options) 
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end

    def author 
        User.find_by_id(author_id)
    end

    def replies  
        data = QuestionsDatabase.instance.execute(<<-SQL)
            SELECT
                * 
            FROM 
                question_follows
            WHERE
                id = ?;
            SQL
    end
end

class QuestionFollows
    attr_accessor :id, :user_id, :question_id

    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                * 
            FROM 
                question_follows
            WHERE
                id = ?;
        SQL
        return nil if data.empty?
        QuestionFollows.new(data.first)
    end

    def initialize(options) 
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end
end

class Replies
    attr_accessor :id, :question_subject, :parent_id, :author, :body

    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                * 
            FROM 
                replies
            WHERE
                id = ?;
        SQL
        return nil if data.empty?
        Replies.new(data.first)
    end

    def self.find_by_author(author)
        data = QuestionsDatabase.instance.execute(<<-SQL, author)
            SELECT
                * 
            FROM 
                replies
            WHERE
                author = ?;
        SQL
        return nil if data.empty?
        Replies.new(data.first)
    end

    def self.find_by_question_subject(question_subject)
        data = QuestionsDatabase.instance.execute(<<-SQL, question_subject)
            SELECT
                * 
            FROM 
                replies
            WHERE
                question_subject = ?;
        SQL
        return nil if data.empty?
        Replies.new(data.first)
    end

    def initialize(options) 
        @id = options['id']
        @question_subject = options['question_subject']
        @parent_id = options['parent_id']
        @author = options['author']
        @body = options['body']
    end
end

class QuestionLikes
    attr_accessor :id, :num_likes, :user_id, :question_id

    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                * 
            FROM 
                question_likes
            WHERE
                id = ?;
        SQL
        return nil if data.empty?
        QuestionLikes.new(data.first)
    end

    def initialize(options) 
        @id = options['id']
        @num_likes = options['num_likes']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end
end