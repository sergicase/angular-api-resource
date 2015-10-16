'use strict'

intranet
.service 'resourceLoader' , ($http,$q,configConstants) ->

  send = (method,url,actions=null,data=null) ->
    url = configConstants.API_DOMAIN + url
    if actions != null then url  = url + merge_action(actions)
    if method == 'GET' && data != null then url = url + data
    deferred = $q.defer()
    $http(
      headers: {
 	#Put here your ahutorization token from your API
        #'Authorization' : localStorage['access_token'],
        'Content-Type': 'application/json'
      }
      method: method
      url: url
      data: data
    )
    .success (response) ->
      deferred.resolve response
    .error (response) ->
      deferred.reject response
    return deferred.promise

  ###
    Method format url with actions passed as object
  ###
  merge_action = (actions) ->
    actions_format = undefined
    angular.forEach actions, ((action) ->
      if actions_format != undefined then actions_format = actions_format + "/" + action
      else  actions_format = "/" + action
    )
    return actions_format

  ###
    Method format url get params passed as object
  ###
  format_get_url = (params) ->
    get_params = undefined
    angular.forEach params, ((param,key) ->
      if get_params != undefined then get_params = get_params + "&" + key + "=" + param
      else  get_params = "?"  + key + "=" + param
    )
    return get_params

  @get = (url,params,actions) ->
    if params != null then params = format_get_url(params)
    send 'GET',url,actions,params
  @post = (url,data,actions) ->
    send 'POST',url,actions,data
  @put = (url,actions,data) ->
    send 'PUT',url,actions,data
  @delete = (url,actions,data) ->
    send 'DELETE',url,actions,data


  return null







