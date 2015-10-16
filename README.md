# Angular Service to manage API request

This is a little service from angular with coffeescript for manage API request, the reason for this service is that we
want a clean service that will manage our API request with the main headers as content type or Authorization token.

We want too use just 2 simple array for the actions/param/data of the request.

With that service we can just call resources of the API with this simple calls:

**Example:**

```
#Get all cars of our API
resourceLoader.get('/car');

#Get all cars with filters
resourceLoader.get('/car',{color:'blue'});

#POST a car into database
resourceLoader.post('/car',{name:'bmw',color:'blue'})

#EDIT A CAR
resourceLoader.put('/car',{id:2},{name:'opel',color:'red'})
```

*Remember that this service use promises and if we want recover the result of the request we only have to use "then" 
as this.*

```
resourceLoader.get('/car',{color:'blue'}).then (data) ->
  var request_data = data
```

