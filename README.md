# A Contact Storage API

An API to store contacts in a list to manage the last time each contact was
contacted.

# A Tic-tac-toe data store API

Link to front end: https://github.com/rdelvallej32/catch_up_frontend/tree/master
Link to back end: https://github.com/rdelvallej32/catch_up_api
Link to wireframes: https://app.moqups.com/rdelvallej@gmail.com/jOKx4Yfb/edit/page/a4f24c2e8

##### Technologies used (back end):

Ruby, Rails

PostgreSQL

Twilio API / twilio-ruby gem

##### Technologies used (front end):

Javascript, jQuery, AJAX

HTML 5 / CSS 3

Bootstrap

Handlebars

#### Notes:

This app is a work in progress! The job handler that will send messages to users once per day is still being worked on, so don't expect your reminder message just yet.

## API end-points

Verb   | URI Pattern        | Controller#Action
----   | -----------        | -----------------
POST   | `/sign-up`         | `users#signup`
POST   | `/sign-in`         | `users#signin`
DELETE | `/sign-out/:id`    | `users#signout`
PATCH  | `/change-password` | `users#changepw`
GET    | `/contacts`        | `contacts#index`
POST   | `/contacts`        | `contacts#create`
GET    | `/contacts/:id`    | `contacts#show`
PATCH  | `/contacts/:id`    | `contacts#update`
Delete | `/contacts/:id/`   | `contacts#destroy`


All data returned from API actions is formatted as JSON.

---
## User actions
*Summary:*
<table>
<tr>
  <th colspan="3">Request</th>
  <th colspan="2">Response</th>
</tr>
<tr>
  <th>Verb</th>
  <th>URI</th>
  <th>body</th>
  <th>Status</th>
  <th>body</th>
</tr>
<tr>
<td>POST</td>
<td>`/sign-up`</td>
<td><strong>credentials</strong></td>
<td>201, Created</td>
<td><strong>user</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>400 Bad Request</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>POST</td>
<td>`/sign-in`</td>
<td><strong>credentials</strong></td>
<td>200 OK</td>
<td><strong>user w/token</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>401 Unauthorized</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>DELETE</td>
<td>`/sign-out/:id`</td>
<td>empty</td>
<td>201 Created</td>
<td>empty</td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>401 Unauthorized</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>PATCH</td>
<td>`/change-password/:id`</td>
<td><strong>passwords</strong></td>
<td>204 No Content</td>
<td><strong>user w/token</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>400 Bad Request</td>
  <td><em>empty</em></td>
</tr>
</table>

### signup

The `create` action expects a *POST* of `credentials` identifying a new user to create, e.g. using `FormData`:

```html
<form>
  <input name="credentials[email]" type="text" value="an@example.email">
  <input name="credentials[password]" type="password" value="an example password">
  <input name="credentials[password_confirmation]" type="password" value="an example password">
</form>

```

or using `JSON`:

```json
{
  "credentials": {
    "email": "an@example.email",
    "password": "an example password",
    "password_confirmation": "an example password"
  }
}
```

The `password_confirmation` field is optional.

If the request is successful, the response will have an HTTP Status of 201, Created, and the body will be JSON containing the `id` and `email` of the new user, e.g.:

```json
{
  "user": {
    "id": 1,
    "email": "an@example.email"
  }
}
```

If the request is unsuccessful, the response will have an HTTP Status of 400 Bad Request, and the response body will be empty.

### signin

The `signin` action expects a *POST* with `credentials` identifying a previously registered user, e.g.:

```html
<form>
  <input name="credentials[email]" type="text" value="an@example.email">
  <input name="credentials[password]" type="password" value="an example password">
</form>
```

or:

```json
{
  "credentials": {
    "email": "an@example.email",
    "password": "an example password"
  }
}
```

If the request is successful, the response will have an HTTP Status of 200, OK, and the body will be JSON containing the user's `id`, `email`, and the `token` used to authenticate other requests, e.g.:
```json
{
  "user": {
    "id": 1,
    "email": "an@example.email",
    "token": "an example authentication token"
  }
}
```

If the request is unsuccessful, the response will have an HTTP Status of 401 Unauthorized, and the response body will be empty.

### signout

The `signout` actions is a *DELETE* specifying the `id` of the user so sign out.

If the request is successful the response will have an HTTP status of 204 No Content.

If the request is unsuccessful, the response will have a status of 401 Unauthorized.

### changepw

The `changepw` action expects a PATCH of `passwords` specifying the `old` and `new`.

If the request is successful the response will have an HTTP status of 204 No Content.

If the request is unsuccessful the reponse will have an HTTP status of 400 Bad Request.

---

The `sign-out` and `change-password` requests must include a valid HTTP header `Authorization: Token token=<token>` or they will be rejected with a status of 401 Unauthorized.

## Contact actions

All contact action requests must include a valid HTTP header `Authorization: Token token=<token>` or they will be rejected with a status of 401 Unauthorized.

*Summary:*
<table>
<tr>
  <th colspan="3">Request</th>
  <th colspan="2">Response</th>
</tr>
<tr>
  <th>Verb</th>
  <th>URI</th>
  <th>body</th>
  <th>Status</th>
  <th>body</th>
</tr>
<tr>
<td>GET</td>
<td>`/contacts`</td>
<td>n/a</td>
<td>200, OK</td>
<td><strong>contact found</strong></td>
</tr>
<tr>
  <td>200, OK</td>
  <td><em>empty</em></td>
</tr>
<tr>
  <td colspan="3">
  The default is to retrieve all games associated with the user..
  </td>
  <td>401 Unauthorized</td>
  <td><em>empty</em></td>
</tr>
<tr>
<td>POST</td>
<td>`/contacts`</td>
<td>n/a</td>
<td>201, Created</td>
<td><strong>contact created</strong></td>
</tr>
<tr>
  <td colspan="3">
  </td>
  <td>401 Unauthorized</td>
  <td><em>empty</em></td>
</tr>
<tr>
  <td colspan="3">
  </td>
  <td>400 Bad Request</td>
  <td><strong>errors</strong></td>
</tr>
<tr>
<td>PATCH</td>
<td>`/contacts/:id`</td>
<td><em>empty</em></td>
<td>200, OK</td>
<td><strong>contact created</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>400 Bad Request</td>
  <td><strong>errors</strong></td>
</tr>
<tr>
  <td colspan="3"></td>
  <td>400 Bad Request</td>
  <td><em>empty</em></td>
</tr>
</table>

### index
The `index` action is a *GET* that retrieves all the contacts associated with a user.  The response body will contain JSON containing an array of contacts, e.g.:

```json
{
  "contacts": [
    {
      "id": 1,
      "first_name": "Kitty",
      "last_name": "Holmes",
      "occupation": "Professor",
      "professional_relationship": "Mentor",
      "company": "BU",
      "last_contacted": "20120407",
      "fact": "Likes Pizza"
    ,
      "id": 2,
      "first_name": "John",
      "last_name": "Holmes",
      "occupation": "Professor",
      "professional_relationship": "Mentor",
      "company": "BC",
      "last_contacted": "20120407",
      "fact": "Likes Pizza"
    }
  ]
}
```

If there are no contacts associated with the user, the response body will contain an empty contacts array, e.g.:

```json
{
  "contacts": [
  ]
}
```

### create

The `create` action expects a *POST* with an empty body (e.g `new FormData()` or `''` - if JSON,  `'{}'`).  If the request is successful, the response will have an HTTP Status of 201, Created, and the body will contain JSON of the created contact e.g:

```json
"contact": {
  "first_name": "Rob",
  "last_name": "Smith",
  "occupation": "Scientist",
  "professional_relationship": "Former Boss",
  "company": "BU",
  "last_contacted": "20130407",
  "fact": "Likes Hiking"
}
}'
```

If the request is unsuccessful, the response will have an HTTP Status of 400 Bad Request, and the response body will be JSON describing the errors.

```
