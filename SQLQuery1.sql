INSERT INTO dbo.FoodAssistanceRequests
(
    UserID,
    RequesterName,
    ContactNumber,
    FoodRequirements,
    Address,
    RequestStatus,
    SubmittedDate
)
VALUES
(
    NULL,
    'Test User',
    '9876543210',
    'Need fresh vegetables and food supplies',
    'Rajkot',
    'Pending',
    GETDATE()
);

