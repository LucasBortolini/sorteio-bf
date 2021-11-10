---
---

load = ->
  forms = document.getElementsByTagName 'form'
  if forms.length == 1
    forms[0].addEventListener 'submit', submit

  blackfriday = new Date(2021, 10, 26).getTime()
  bf_seconds = blackfriday/1000

  today = new Date()
  tomorrow = new Date(today)
  tomorrow.setDate(tomorrow.getDate() + 1)
  tomorrow.setHours(0,0,0,0)
  tm_seconds = tomorrow/1000

  flipdown = new FlipDown(tm_seconds, theme: 'light').start()
  
  flipdown2 = new FlipDown(bf_seconds, "flipdown2", theme: 'light').start()

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