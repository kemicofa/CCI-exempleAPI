'use strict'
const User = use('App/Models/User');
class UserController {

    async createUser({request,response}){

        const user = new User();
        const { username ,email, password } = request.all()

        user.username = username;
        user.password = password;
        user.email = email;

        user.save();

        response.send({
            message : "user created",
            user : user
        });

    }

    async loginUser ({ request, auth, response }) {
        const { email, password } = request.all()
        const token = await auth.attempt(email, password)
        console.log("login");
        console.log(email)
        response.send({
            token : token
        });
      }

}

module.exports = UserController
