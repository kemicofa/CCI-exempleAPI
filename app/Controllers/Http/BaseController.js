'use strict'
const Database = use('Database')

class BaseController {

    index({ request, response }) {
        let name = request.get().name;
        response.header('Content-type', 'application/json');

        const serverResponse = {
            datas: {
                message: `coucou ${name} bienvenue sur ton server Adonis`
            }
        }

        response.send(serverResponse);
    }

    async getLists({ request, response }) {

        let list = await Database.table('List').select('*');

        const serverResponse = {
            datas: list
        };
        response.header('Content-type', 'application/json');
        response.send(serverResponse);
    }


    async getArticlesByListId({ request, response }) {

        const listId = request.get().listId;
        const articles = await Database.table('article')
            .innerJoin('list', 'list.List_id', 'article.Art_list')
            .select('*')
            .where('article.Art_list', listId);

        response.header('Content-type', 'application/json');
        response.send({
            datas: articles
        });

    }

    async addArticleToList({ request, response }){

        const listId = request.post().listId;
        const articleName = request.post().articleName;
        const articleQty = request.post().articleQty;

    }

    async addList({ request, response }) {

        const listName = request.post().listName;
        const date = new Date();

        let insertedId = await Database
            .table('list')
            .insert({ List_name: listName, List_date : date})
        
        if (insertedId){
            response.header('Content-type', 'application/json');
            response.send({
                datas: insertedId
            });
        }else{
            response.header('Content-type', 'application/json');
            response.send({
                datas: "error"
            });
        }
    }

    addProduct({ request, response }) {
        const productName = request.post().name
        const quantity = request.post().quantity

        const newProduct = {
            name: productName,
            quantity: quantity
        }
        products.push(newProduct);
        response.header('Content-type', 'application/json');
        response.send({
            message: "product added",
            datas: products
        });
    }


}

module.exports = BaseController
