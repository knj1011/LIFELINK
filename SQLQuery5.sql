
ALTER TABLE dbo.Feedback
ADD Rating INT NOT NULL
    CONSTRAINT DF_Feedback_Rating DEFAULT (5);