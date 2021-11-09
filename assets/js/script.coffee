---
---

load = ->
  forms = document.getElementsByTagName 'form'
  if forms.length == 1
    forms[0].addEventListener 'submit', submit

  datetime = new Date(2021, 10, 26).getTime()
  seconds = datetime/1000
  flipdown = new FlipDown(seconds, theme: 'light').start()
  flipdown2 = new FlipDown(seconds, "flipdown2", theme: 'light').start()

submit = (event) ->
  event.preventDefault()
  # avoid to execute the actual submit of the form.
  form = event.target
  data = new FormData(form)
  value = Object.fromEntries(data.entries())

  fetch(form.action,
    headers: new Headers({
      "Content-Type": "application/json"
    }),
    method: form.method
    body: JSON.stringify(value)
  ).then (response) ->
    form.reset()
    contentType = response.headers.get('content-type')
    if contentType and contentType.indexOf('application/json') != -1
      return response.json().then (json) ->
        if !json.error
          alert(form.dataset.feedback)
          window.location.href = form.dataset.href
        return
    return

  return 

document.addEventListener 'DOMContentLoaded', load