$(document).ready(function() {
  // console.log(document.location.pathname);
  switch (document.location.pathname) {
    case '/dashboard':
      $('.home_nav').addClass('active');
      break;
    case '/add_cohort':
      $('.add_cohort_nav').addClass('active');
      break;
    case '/instructors':
      $('.instructors_nav').addClass('active');
      break;
    case '/add_instructor':
      $('.add_instructor_nav').addClass('active');
      break;
    default:
      break;
  }
});
