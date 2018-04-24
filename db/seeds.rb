# Creates default admin user
User.create(username: 'admin',
            email: 'admin@example.com',
            password: 'secretpassw0rd',
            password_confirmation: 'secretpassw0rd',
            role: 'ADMIN')
