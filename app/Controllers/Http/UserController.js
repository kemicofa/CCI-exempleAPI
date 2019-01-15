'use strict'
const User = use('App/Models/User');
class UserController {

    async createUser({request,response}){

        const user = new User();
        
        user.username = "hadrien";
        user.password = "carotte1988";
        user.email = "delphin.hadrien@protonmail.com"

        user.save()
    }

    async loginUser ({ request, auth, response }) {
        const { email, password } = request.all()
        const token = await auth.attempt(email, password)

        response.send({
            token : token
        })
        return 'Logged in successfully'
      }

}

module.exports = UserController
