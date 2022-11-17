db.createUser(
    {
        user: "temp",
        pwd: "temp",
        roles: [
            {
                role: "read",
                db: "cards"
            }
        ]
    }
);
db.createCollection('cards')
db.createCollection('currency')