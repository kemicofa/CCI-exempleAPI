'use strict'

/*
|--------------------------------------------------------------------------
| Routes
|--------------------------------------------------------------------------
|
| Http routes are entry points to your web application. You can create
| routes for different URL's and bind Controller actions to them.
|
| A complete guide on routing is available here.
| http://adonisjs.com/docs/4.1/routing
|
*/

/** @type {typeof import('@adonisjs/framework/src/Route/Manager')} */
const Route = use('Route')


//private routes
Route.get('/getLists',"BaseController.getLists")
.middleware('auth');
Route.get('/getArticlesByListId',"BaseController.getArticlesByListId")
.middleware('auth');
Route.post('/addProduct',"BaseController.addProduct")
.middleware('auth');
Route.post('/addList',"BaseController.addList")
.middleware('auth');


//public routes
Route.post('/createUser','UserController.createUser');
Route.post('/login','UserController.loginUser');
