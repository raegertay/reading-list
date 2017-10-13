// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs

//= require_tree .
$(document).ready(function() {
  // Quotes cycling and fading
  var i = 0;
  var fadeDuration = 2000;
  var displayDuration = 4000;
  animateQuotes();

  function animateQuotes() {
    setTimeout(function () {
      $(".blockquote").fadeOut(fadeDuration, function() {
        cycleQuotes();
        $(".blockquote").fadeIn(fadeDuration, function() {
          animateQuotes();
        })
      });
    }, displayDuration);
  }

  function cycleQuotes() {
    i = (i == quotes.length - 1) ? 0 : (i + 1);
    $(".blockquote p").text(quotes[i].quote);
    $(".blockquote footer").text(quotes[i].source);
  }

  //==================== Quotes Array=====================//
  var quotes = [
    {quote: "You cannot open a book without learning something.", source: "Confucius"},
    {quote: "Stay hungry.\nStay foolish.", source: "Steve Jobs"},
    {quote: "Never stop learning, because life never stops teaching.", source: "Unknown"},
    {quote: "Let us remember: One book, one pen, one child, and one teacher can change the world.", source: "Malala Yousafzai"},
    {quote: "There are no secrets to success.\nIt is the result of preparation, hard work, and learning from failure.", source: "Colin Powell"},
    {quote: "The only true wisdom is in knowing you know nothing.", source: "Socrates"},
    {quote: "I have not failed.\nI've just found 10,000 ways that won't work.", source: "Thomas A. Edison"},
    {quote: "The secret of getting ahead is getting started.", source: "Mark Twain"},
    {quote: "Wise men speak because they have something to say.\nFools because they have to say something.", source: "Plato"},
    {quote: "The best and most beautiful things in the world cannot be seen or even touched\n- they must be felt with the heart.", source: "Helen Keller"}
  ];
});

// require turbolinks
