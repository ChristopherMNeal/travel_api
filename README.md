# README
auth_token = eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2NDI3MTg5NzN9.bpnXBYjWPQhwVsWR2ePfIuCMf3POCHqhe1MaRVOEL5U


##Intro 

about api info goes here


##Endpoints

|Usage | METHOD       | URL       | Params |
| :--------|:------------:| ---------:| ------:|
|See All Quotes | GET    | `localhost:3000/quotes` |
|See A Specific Quote | GET    | `localhost:3000/quotes/:id` |
|Search By Quote Author | GET    | `localhost:3000/quotes?author=` | _author_ |
|See A Random Quote | GET    | `localhost:3000/quotes/random` |
|Create A Quote | POST    | `localhost:3000/quotes` | _author, content_ |
|Update A Quote | PUT    | `localhost:3000/quotes/:id` | _author, content_ |
|Delete A Quote | DELETE    |`localhost:3000/quotes/:id`|   


##Status Codes

| Status Code | Description |
| :--- | :--- |
| 200 | `OK` |
| 201 | `CREATED` |
| 400 | `BAD REQUEST` |
| 404 | `NOT FOUND` |
| 500 | `INTERNAL SERVER ERROR` |

## Responses

Many API endpoints return the JSON representation of the resources created or edited. However, if an invalid request is submitted, or some other error occurs, Gophish returns a JSON response in the following format:

```javascript
{
  "message" : string,
  "success" : bool,
  "data"    : string
}
```