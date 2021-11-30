(function() {
  var load, submit;

  load = function() {
    var bf_seconds, blackfriday, flipdown, flipdown2, forms, tm_seconds, today, tomorrow;
    forms = document.getElementsByTagName('form');
    if (forms.length === 1) {
      forms[0].addEventListener('submit', submit);
    }
    blackfriday = new Date(2021, 10, 26).getTime();
    bf_seconds = blackfriday / 1000;
    today = new Date();
    tomorrow = new Date(today);
    tomorrow.setDate(tomorrow.getDate() + 1);
    tomorrow.setHours(0, 0, 0, 0);
    tm_seconds = tomorrow / 1000;
    flipdown = new FlipDown(tm_seconds, {
      theme: 'light'
    }).start();
    return flipdown2 = new FlipDown(bf_seconds, "flipdown2", {
      theme: 'light'
    }).start();
  };

  submit = function(event) {
    var data, form, value;
    event.preventDefault();
    form = event.target;
    data = new FormData(form);
    value = Object.fromEntries(data.entries());
    fetch(form.action, {
      headers: new Headers({
        "Content-Type": "application/json"
      }),
      method: form.method,
      body: JSON.stringify(value)
    }).then(function(response) {
      var contentType;
      form.reset();
      contentType = response.headers.get('content-type');
      if (contentType && contentType.indexOf('application/json') !== -1) {
        return response.json().then(function(json) {
          if (!json.error) {
            alert(form.dataset.feedback);
            window.location.href = form.dataset.href;
          }
        });
      }
    });
  };

  document.addEventListener('DOMContentLoaded', load);

}).call(this);
