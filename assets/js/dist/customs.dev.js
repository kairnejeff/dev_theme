"use strict";

function _toConsumableArray(arr) { return _arrayWithoutHoles(arr) || _iterableToArray(arr) || _nonIterableSpread(); }

function _nonIterableSpread() { throw new TypeError("Invalid attempt to spread non-iterable instance"); }

function _iterableToArray(iter) { if (Symbol.iterator in Object(iter) || Object.prototype.toString.call(iter) === "[object Arguments]") return Array.from(iter); }

function _arrayWithoutHoles(arr) { if (Array.isArray(arr)) { for (var i = 0, arr2 = new Array(arr.length); i < arr.length; i++) { arr2[i] = arr[i]; } return arr2; } }

function _typeof(obj) { if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }; } return _typeof(obj); }

/*menu*/
$(document).ready(function () {
  $("#menu-icon").click(function () {
    $("#mobile_top_menu_wrapper").css("display", "block");
    $("#mobile_top_menu_wrapper").addClass("open");
    $("#header .overlay").addClass("shadow");
  });
  $("#menu-close").click(function () {
    $("#mobile_top_menu_wrapper").css("display", "none");
    $("#mobile_top_menu_wrapper").removeClass("open");
    $("#header .overlay").removeClass("shadow");
  });
  $(".menu-next").click(function () {
    $(this).siblings('.sub-menu').children('.menu-item-title').remove();
    $(this).siblings('.menu-item-title').clone().addClass("clone-title").prependTo($(this).siblings('.sub-menu'));
    $(this).siblings('.sub-menu').css("display", "block");
  });
  $(".menu-before").click(function () {
    $(this).parent('.sub-menu').css("display", "none");
  });
  $(window).resize(function () {
    $("#_desktop_top_menu .clone-title").remove();
  });
}); //barre-recherche 

$(document).ready(function () {
  $(".search-widget").mouseenter(function () {
    $(this).children("form").children("input[type=text]").addClass("navr");
  });
  $(".search-widget").mouseleave(function () {
    $(this).children("form").children("input[type=text]").removeClass("navr");
  });
  $(".search-widget form input[type=text]").focus(function () {
    $(this).css("display", "block");
  });
  $(".search-widget form input[type=text]").blur(function () {
    $(this).css("display", "none");
  });
});
/**
 * mobile search
 */

$(document).ready(function () {
  $("#mobile_loop .loop-btn").click(function () {
    $(this).css("display", "none");
    $(this).parent().siblings("#_mobile_search_widget").addClass("show");
  });
  $("#_mobile_search_widget form .close").click(function () {
    $(this).parents("#_mobile_search_widget").removeClass("show");
    $(this).parents("#_mobile_search_widget").siblings("#mobile_loop").find(".loop-btn").css("display", "block");
  });
}); // //homepage carousel
// function changeData() {
//     var carousel = $('#carousel .carousel-inner figure picture source')
//     if ($(window).width() < 480) {
//         carousel.attr('srcset', carousel.data('mobile'))
//     } else {
//         carousel.attr('srcset', carousel.data('desktop'))
//     }
// }
// $(document).ready(function(e) {
//     changeData()
//     $(window).resize(changeData)
// })
//featured products

function featuredProductMobileCarousel() {
  if ($(window).width() < 480) {
    $('#index #feature-products').addClass("owl-carousel");
    $('#index #feature-products').owlCarousel({
      items: 1,
      loop: true,
      nav: true,
      margin: 10,
      dots: false,
      autoplay: true,
      autoplayTimeout: 10000,
      autoplayHoverPause: true,
      navText: ['<svg viewBox="0 0 24 24"><path d="M15.41 7.41L14 6l-6 6 6 6 1.41-1.41L10.83 12z"></path></svg>', '<svg viewBox="0 0 24 24"><path d="M10 6L8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z"></path></svg>']
    });
  } else {
    $('#index #feature-products').owlCarousel('destroy');
    $('#index #feature-products').removeClass("owl-carousel");
  }
}

$(document).ready(function (e) {
  featuredProductMobileCarousel();
  $(window).resize(featuredProductMobileCarousel);
});
/*
 *checkout 
 */

var tabs = $('section.checkout-step');
var steps = $('.checkout-bar .step');

function displayCheckOutTab() {
  $('section.checkout-step.-unreachable').css('display', 'none');
  $('section.checkout-step.-reachable:not(.-current)').css('display', 'none');
}

function removeCurrentClass() {
  var i = 0;
  var remove = false;

  while (!remove && i < tabs.length) {
    if ($(tabs[i]).hasClass('-current')) {
      $(tabs[i]).removeClass('-current');
      $(steps[i - 1]).removeClass('animate');
      remove = true;
    }

    i++;
  }
}

function addAnimateToSteps() {
  tabs.each(function (index) {
    if ($(tabs[index]).hasClass('-current')) {
      $(steps[index - 1]).addClass('animate');
    }
  });
}

function addCompleteCssProgressBar() {
  tabs.each(function (index) {
    if ($(tabs[index]).hasClass('-complete')) {
      $(steps[index]).addClass('complete');
    }
  });
}

(function () {
  addCompleteCssProgressBar();
  addAnimateToSteps();
  displayCheckOutTab();
  steps.each(function (index) {
    $(this).click(function () {
      if ($(tabs[index]).hasClass('-complete')) {
        removeCurrentClass();
        $(tabs[index]).css('display', 'block');
        $(tabs[index]).addClass("-current");
        $(steps[index - 1]).addClass('animate');
        displayCheckOutTab();
      }
    });
  });
})(); //facet filtre mobile


(function () {
  $('#filtre-name').click(function () {
    var isExpanded = $('#filtre-name').first().attr("aria-expanded");
    isExpanded ? $('.mobile-collapse').collapse() : $('.mobile-collapse').collapse('hide');
  });
  $("#facet_section .close").click(function () {
    $('.mobile-collapse').collapse('hide');
  });
})();

function setComptedisplay() {
  var width = $('.my-account').width();
  var margin = 20;
  var colum = 2;

  if ($(window).width() >= 576) {
    var blocs = $('.info-blocs .info-bloc');
    var left = width * 0.51;
    var columheight = [];
    columheight.push(blocs.eq(0).outerHeight() + margin);
    columheight.push(blocs.eq(1).outerHeight() + margin);
    blocs.eq(1).css("left", left);
    $.each(blocs, function (index) {
      if (index > 1) {
        if (columheight[0] < columheight[1]) {
          $(this).css("top", columheight[0]);
          columheight[0] += $(this).outerHeight() + margin;
          return true;
        }

        $(this).css("left", left);
        $(this).css("top", columheight[1]);
        columheight[1] += $(this).outerHeight() + margin;
      }
    });
    $('.info-blocs').css('height', columheight[0] > columheight[1] ? columheight[0] + 'px' : columheight[1] + 'px');
  }
} //mon compte 


(function () {
  setComptedisplay();
  $(window).resize(setComptedisplay);
})(); //grid view


$(document).ready(function () {
  $('.grid-controle #list-view').click(function () {
    $("#js-product-list .row").css("grid-template-columns", "repeat(1, 1fr)");
    $(this).prev().children('span').removeClass('active');
    $(this).children('span').addClass('active');
  });
  $('.grid-controle #grid-view').click(function () {
    $("#js-product-list .row").css("grid-template-columns", "repeat(2, 1fr)");
    $(this).next().children('span').removeClass('active');
    $(this).children('span').addClass('active');
  });
}); //product carousel

$(document).ready(function () {
  $(document).on("click", '.images-container .product-cover .btn-image .icon-next', function () {
    $(this).parent().parent().children('#carousel').css("display", "block");
    $(this).css("background", "#000");
    $(this).siblings().css("background", "#fff");
  });
  $(document).on("click", '.images-container .product-cover .btn-image .icon-prev', function () {
    $(this).parent().parent().children('#carousel').css("display", "none");
    $(this).css("background", "#000");
    $(this).siblings().css("background", "#fff");
  });
  $('.images-container .product-cover .js-qv-product-cover').on('swiped-left', function (e) {
    $(e.target).siblings('#carousel').css("display", "block");
    $(e.target).siblings('.btn-image').children('.icon-next').css("background", "#000");
    $(e.target).siblings('.btn-image').children('.icon-prev').css("background", "#fff");
  });
  $('.images-container .product-cover #carousel').on('swiped-right', function (e) {
    $(e.target).parents('#carousel').css("display", "none");
    $(e.target).parents('.product-cover').children('.btn-image').children('.icon-next').css("background", "#fff");
    $(e.target).parents('.product-cover').children('.btn-image').children('.icon-prev').css("background", "#000");
  });
}); //product-accordion
// function productAccordion() {
//     var windowsize = $(window).width()
//     if (windowsize > 767) {
//         $('.info-detailed .collapse').collapse()
//     } else {
//         $('.info-detailed .collapse').on('show.bs.collapse', function() {
//             $(this).prev().find("i")[0].innerHTML = 'expand_less';
//             $('.info-detailed .collapse').not(this).collapse('hide');
//         });
//         $('.info-detailed .collapse').on('hide.bs.collapse', function() {
//             $(this).prev().find("i")[0].innerHTML = 'expand_more';
//         });
//     }
// }
// (function() {
//     productAccordion();
//     $(window).resize(productAccordion);
// })();
//category - filtre

$(document).ready(function () {
  $('#facet_section .form-check-filtre-label').click(function () {
    var attr = $(this).prev().attr('checked');

    if (_typeof(attr) !== (typeof undefined === "undefined" ? "undefined" : _typeof(undefined)) && attr !== false) {
      $(this).prev().removeAttr('checked');
      $(this).prev().removeClass("checked");
      $(this).parent().removeClass("form-checked");
    } else {
      $(this).prev().attr('checked', 'checked');
      $(this).prev().addClass("checked");
      $(this).parent().addClass("form-checked");
    }
  });
  $('#category-filtre').click(function () {
    var params = "?q=";
    $('#facet_section .facet').each(function (index) {
      var isEmpty = true;
      var checkbox = $(this).find('input:checked'); //alert($(this).find('input:checked').length)

      checkbox.each(function (i) {
        if (checkbox.length !== 0) {
          if (i == 0) {
            params = params + encodeURIComponent($(this).attr('name') + '-' + $(this).attr('value'));
          } else {
            params = params + encodeURIComponent('-' + $(this).attr('value'));
          }
        }
      });
      if (checkbox.length !== 0) params = params + '/';
    });
    window.location.replace(window.location.href.split('?')[0] + params);
  });
  var windowsize = $(window).width();
  $(window).scroll(function () {
    if (windowsize < 767) {
      var scrollTop = $(this).scrollTop();
      var scrollHeight = $(document).height();
      var windowHeight = $(this).height();

      if (scrollTop + windowHeight - scrollHeight > -700) {
        $('#filtre-name').addClass('show-filtre');
      } else {
        $('#filtre-name').removeClass('show-filtre');
      }
    }
  });
});

function checkNumero(phone, number) {
  var div = $('#phone-informaton');
  var str = phone.val();

  if (isNaN(str) || str.length != number || str[0] != 0) {
    phone.css({
      "border": "2px solid red"
    });
    div.addClass('alert alert-danger');
    div.text('Numéro invalide');
  } else {
    phone.parent().parent().removeClass('has-error');
    $('#delivery-address .js-address-form .help-block').remove();
    phone.css({
      "border": "2px solid green"
    });
    div.text('');
    div.removeClass('alert alert-danger');
  }
}

$(document).ready(function () {
  var phone = $("input[name=phone]");
  phone.keypress(function () {
    checkNumero(phone, 9);
  });
  phone.focus(function () {
    checkNumero(phone, 10);
  });
  phone.focusout(function () {
    checkNumero(phone, 10);
  });
});

function itsTime() {
  $('.home_popup').css('display', 'block');
}

setTimeout(function () {
  itsTime();
}, 3000);

function tab(idConteiner, classTab, classPanel) {
  var tabs = _toConsumableArray(document.querySelectorAll(classTab)),
      panels = _toConsumableArray(document.querySelectorAll(classPanel));

  var container = document.getElementById(idConteiner);

  if (container) {
    container.addEventListener('click', function (e) {
      var compareTab = tabs.filter(function (tab) {
        return tab === e.target.parentElement;
      });

      if (e.target.parentElement === compareTab[0]) {
        var i = tabs.indexOf(e.target.parentElement);
        tabs.map(function (tab) {
          return tab.classList.remove('active');
        });
        tabs[i].classList.add('active');
        panels.map(function (panel) {
          return panel.classList.remove('active');
        });
        panels[i].classList.add('active');
      }
    });
  }
}

window.onload = function () {
  tab('main-menu', '.menu-tab', '.info-detailed-titler');
}; //link


$(document).ready(function (e) {
  // On attend que la page soit chargée
  $('.obflink').click(function (e) {
    // On écoute le clic sur un lien obfusqué
    var t = $(this);
    var link = atob(t.data('o')); // On décode l'url

    window.location.href = link; // On renvoi l'utilisateur vers la page
  });
}); //Trustpilot

$(document).ready(function (e) {
  var attributes = $('#combinaison-attributes').data('attributes');
  $('.input-color').change(function () {
    if (this.checked) {
      var id = $(this).val();
      $.each(attributes[0], function (k, v) {
        if (id == v.attributes[0]) {
          $('#trustbox-widget').attr('data-sku', v.reference);
        }
      });
    }
  });
});
$(document).ready(function (e) {
  $('#truspilot-avis').owlCarousel({
    nav: true,
    loop: true,
    margin: 20,
    rewind: false,
    items: 1,
    smartSpeed: 70,
    navText: ["<div class='nav-btn prev-slide'></div>", "<div class='nav-btn next-slide'></div>"]
  });
}); //category product list page image hover

$(document).ready(function (e) {
  $('.product-thumbnail .product-img').mouseenter(function () {
    if ($(this).parents('.product-thumbnail').children().length > 1) {
      $(this).css('display', 'none');
      $(this).parents('.product-thumbnail').children('.carousel-inner').css('display', 'block');
    }
  });
  $('.product-thumbnail .carousel-inner').mouseleave(function () {
    $(this).css('display', 'none');
    $(this).prev().css('display', 'block');
  });
});
$('.add-card-button').on('click', 'button:not([type="submit"])', function (e) {
  e.preventDefault();
}); // $(document).ready(function(e){
//     // duration of scroll animation
//     var scrollDuration = 300;
//     // paddles
//     var leftPaddle = document.getElementsByClassName('left-paddle');
//     var rightPaddle = document.getElementsByClassName('right-paddle');
//     // get items dimensions
//     var itemsLength = $('.menu-tab').length;
//     var itemSize = $('.menu-tab').outerWidth(true);
//     // get some relevant size for the paddle triggering point
//     var paddleMargin = 20;
//     // get wrapper width
//     var getMenuWrapperSize = function() {
//         return $('#main-menu').outerWidth();
//     }
//     var menuWrapperSize = getMenuWrapperSize();
//     // the wrapper is responsive
//     $(window).on('resize', function() {
//         menuWrapperSize = getMenuWrapperSize();
//     });
//     // size of the visible part of the menu is equal as the wrapper size 
//     var menuVisibleSize = menuWrapperSize;
//     // get total width of all menu items
//     var getMenuSize = function() {
//         return itemsLength * itemSize;
//     };
//     var menuSize = getMenuSize();
//     // get how much of menu is invisible
//     var menuInvisibleSize = menuSize - menuWrapperSize;
//     // get how much have we scrolled to the left
//     var getMenuPosition = function() {
//         return $('.info-detailed #main-menu ul').scrollLeft();
//     };
//     // finally, what happens when we are actually scrolling the menu
//     $('.info-detailed #main-menu ul').on('scroll', function() {
//         // get how much of menu is invisible
//         menuInvisibleSize = menuSize - menuWrapperSize;
//         // get how much have we scrolled so far
//         var menuPosition = getMenuPosition();
//         var menuEndOffset = menuInvisibleSize - paddleMargin;
//         // show & hide the paddles 
//         // depending on scroll position
//         if (menuPosition <= paddleMargin) {
//             $(leftPaddle).addClass('hidden');
//             $(rightPaddle).removeClass('hidden');
//         } else if (menuPosition < menuEndOffset) {
//             // show both paddles in the middle
//             $(leftPaddle).removeClass('hidden');
//             $(rightPaddle).removeClass('hidden');
//         } else if (menuPosition >= menuEndOffset) {
//             $(leftPaddle).removeClass('hidden');
//             $(rightPaddle).addClass('hidden');
//     }
//     });
//     // scroll to left
//     $(rightPaddle).on('click', function() {
//         $('.info-detailed #main-menu ul').animate( { scrollLeft: menuInvisibleSize}, scrollDuration);
//     });
//     // scroll to right
//     $(leftPaddle).on('click', function() {
//         $('.info-detailed #main-menu ul').animate( { scrollLeft: '0' }, scrollDuration);
//     });
// });

function ScrollMobileCarousel() {
  $('.info-detailed #main-menu ul').addClass("owl-carousel");
  $('.info-detailed #main-menu ul').owlCarousel({
    items: 1,
    loop: false,
    nav: true,
    margin: 10,
    dots: false,
    autoplay: false,
    autoplayTimeout: 10000,
    autoplayHoverPause: true,
    navText: ['<svg viewBox="0 0 24 24"><path d="M15.41 7.41L14 6l-6 6 6 6 1.41-1.41L10.83 12z"></path></svg>', '<svg viewBox="0 0 24 24"><path d="M10 6L8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z"></path></svg>']
  });
}

$(document).ready(function (e) {
  ScrollMobileCarousel();
  $(window).resize(ScrollMobileCarousel);
});