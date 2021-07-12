/*menu*/
$(document).ready(function() {

    function mobileMenu() {
        var width = $(window).width();
        if (width < 1200) {
            $("#top-menu").prependTo("#_mobile_top_menu");

            $("#mobile_top_menu_wrapper").removeClass("hidden-md-up");
            $("#menu-icon span").removeClass("hidden-md-up");
            $("#menu-icon i").removeClass("hidden-md-up");
        } else {
            $("#menu-icon span").addClass("hidden-md-up");
            $("#menu-icon i").addClass("hidden-md-up");
            $("#top-menu").prependTo("#_desktop_top_menu");
            $("#_desktop_top_menu").appendTo("#header .header-nav .row")
            $("#mobile_top_menu_wrapper").css("display", "none");
        }

    }

    $(window).resize(mobileMenu);
})

/*
 *checkout 
 */
let tabs = $('section.checkout-step')
let steps = $('.checkout-bar .step')

function displayCheckOutTab() {
    $('section.checkout-step.-unreachable').css('display', 'none')
    $('section.checkout-step.-reachable:not(.-current)').css('display', 'none')
}

function removeCurrentClass() {
    let i = 0
    let remove = false
    while (!remove && i < tabs.length) {
        if ($(tabs[i]).hasClass('-current')) {
            $(tabs[i]).removeClass('-current')
            $(steps[i - 1]).removeClass('animate')
            remove = true
        }
        i++;

    }
}

function addAnimateToSteps() {
    tabs.each(function(index) {
        if ($(tabs[index]).hasClass('-current')) {
            $(steps[index - 1]).addClass('animate')
        }
    })
}

function addCompleteCssProgressBar() {
    tabs.each(function(index) {
        if ($(tabs[index]).hasClass('-complete')) {
            $(steps[index]).addClass('complete')
        }
    })
}

(function() {
    addCompleteCssProgressBar()
    addAnimateToSteps()
    displayCheckOutTab()
    steps.each(function(index) {
        $(this).click(function() {
            if ($(tabs[index]).hasClass('-complete')) {
                removeCurrentClass()
                $(tabs[index]).css('display', 'block')
                $(tabs[index]).addClass("-current")
                $(steps[index - 1]).addClass('animate')
                displayCheckOutTab()
            }
        })
    })
})();


//facet filtre mobile
(function() {

    $('#filtre-name').click(function() {
        var isExpanded = $('#filtre-name').first().attr("aria-expanded")
        isExpanded ? $('.mobile-collapse').collapse() : $('.mobile-collapse').collapse('hide')
    })


})();

function setComptedisplay() {
    var width = $('.my-account').width();
    const margin = 20
    const colum = 2
    if ($(window).width() >= 576) {
        var blocs = $('.info-blocs .info-bloc')
        const left = width * 0.51
        var columheight = []
        columheight.push(blocs.eq(0).outerHeight() + margin)
        columheight.push(blocs.eq(1).outerHeight() + margin)
        blocs.eq(1).css("left", left)
        $.each(blocs, function(index) {
            if (index > 1) {
                if (columheight[0] < columheight[1]) {
                    $(this).css("top", columheight[0])
                    columheight[0] += $(this).outerHeight() + margin
                    return true;
                }
                $(this).css("left", left)
                $(this).css("top", columheight[1])
                columheight[1] += ($(this).outerHeight() + margin)
            }

        })
        $('.info-blocs').css('height', columheight[0] > columheight[1] ? columheight[0] + 'px' : columheight[1] + 'px')
    }
}
//mon compte 
(function() {
    setComptedisplay()
    $(window).resize(setComptedisplay)
})();


//grid view
(function() {

    $('.grid-controle #list-view').click(function() {
        $("#js-product-list .row").css("grid-template-columns", "repeat(1, 1fr)")
        $(this).prev().children('span').removeClass('active')
        $(this).children('span').addClass('active')
    })
    $('.grid-controle #grid-view').click(function() {
        $("#js-product-list .row").css("grid-template-columns", "repeat(2, 1fr)")
        $(this).next().children('span').removeClass('active')
        $(this).children('span').addClass('active')
    })


})();

//product-accordion
function productAccordion() {
    var windowsize = $(window).width()
    if (windowsize > 767) {
        $('.info-detailed .collapse').collapse()

    } else {
        $('.info-detailed .collapse').on('show.bs.collapse', function() {
            $(this).prev().find("i")[0].innerHTML = 'expand_less';
            $('.info-detailed .collapse').not(this).collapse('hide');
        });
        $('.info-detailed .collapse').on('hide.bs.collapse', function() {
            $(this).prev().find("i")[0].innerHTML = 'expand_more';
        });
    }
}


(function() {
    productAccordion();
    $(window).resize(productAccordion);
})();


$(document).ready(function() {
    //category - filtre
    $('#facet_section .form-check-filtre-label').click(function() {
        var attr = $(this).prev().attr('checked');
        if (typeof attr !== typeof undefined && attr !== false) {
            $(this).prev().removeAttr('checked')
            $(this).prev().removeClass("checked")
            $(this).parent().removeClass("form-checked")
        } else {
            $(this).prev().attr('checked', 'checked')
            $(this).prev().addClass("checked")
            $(this).parent().addClass("form-checked")
        }

    })
    $('#category-filtre').click(function() {
        var params = "?q="
        $('#facet_section .facet').each(function(index) {
            var isEmpty = true
            var checkbox = $(this).find('input:checked')
                //alert($(this).find('input:checked').length)
            checkbox.each(function(i) {
                if (checkbox.length !== 0) {
                    if (i == 0) {
                        params = params + encodeURIComponent($(this).attr('name') + '-' + $(this).attr('value'))

                    } else {
                        params = params + encodeURIComponent('-' + $(this).attr('value'))
                    }
                }
            })
            if (checkbox.length !== 0)
                params = params + '/'
        })
        window.location.replace(window.location.href.split('?')[0] + params)
    })

    var windowsize = $(window).width()
    $(window).scroll(function() {
        if (windowsize < 767) {
            var scrollTop = $(this).scrollTop();　　
            var scrollHeight = $(document).height();
            var windowHeight = $(this).height();　　　
            if (scrollTop + windowHeight - scrollHeight > -700) {　　　　
                $('#filtre-name').addClass('show-filtre')　　
            } else {
                $('#filtre-name').removeClass('show-filtre')
            }
        }

    });

})

function checkNumero(phone, number) {
    var div = $('#phone-informaton')
    var str = phone.val();
    if (isNaN(str) || str.length != number || str[0] != 0) {
        phone.css({ "border": "2px solid red" });
        div.addClass('alert alert-danger')
        div.text('Numéro invalide');

    } else {
        phone.parent().parent().removeClass('has-error')
        $('#delivery-address .js-address-form .help-block').remove()
        phone.css({ "border": "2px solid green" });
        div.text('');
        div.removeClass('alert alert-danger')
    }
}

$(document).ready(function() {
    var phone = $("input[name=phone]")
    phone.keypress(function() { checkNumero(phone, 9) })
    phone.focus(function() { checkNumero(phone, 10) })
    phone.focusout(function() { checkNumero(phone, 10) });
})



function itsTime() {
    $('.home_popup').css('display', 'block');
}

setTimeout(function() {
    itsTime();
}, 3000);


function tab(idConteiner, classTab, classPanel) {
    let tabs = [...document.querySelectorAll(classTab)],
        panels = [...document.querySelectorAll(classPanel)]
    var container = document.getElementById(idConteiner);
    if (container) {
        container.addEventListener('click', e => {
            let compareTab = tabs.filter(tab => tab === e.target.parentElement)
            if (e.target.parentElement === compareTab[0]) {
                let i = tabs.indexOf(e.target.parentElement)
                tabs.map(tab => tab.classList.remove('active'))
                tabs[i].classList.add('active')
                panels.map(panel => panel.classList.remove('active'))
                panels[i].classList.add('active')
            }
        })
    }

}
window.onload = function() {
    tab('main-menu', '.menu-tab', '.info-detailed-titler')
}



//link
$(document).ready(function(e) { // On attend que la page soit chargée
    $('.obflink').click(function(e) { // On écoute le clic sur un lien obfusqué
        var t = $(this);
        var link = atob(t.data('o')) // On décode l'url
        window.location.href = link // On renvoi l'utilisateur vers la page
    })
})


//Trustpilot
$(document).ready(function(e) {
    var attributes = $('#combinaison-attributes').data('attributes')
    $('.input-color').change(
        function() {
            if (this.checked) {
                var id = $(this).val();
                $.each(attributes[0], function(k, v) {
                    if (id == v.attributes[0]) {
                        $('#trustbox-widget').attr('data-sku', v.reference)
                    }
                })
            }
        })
})

$(document).ready(function(e) {
    $('#truspilot-avis').owlCarousel({
        nav: true,
        //loop:true,
        margin: 20,
        rewind: false,
        responsive: {
            0: { items: 1 },
            480: { items: 2 },
            600: { items: 3 },
            1000: { items: 4 }
        },
        smartSpeed: 70,
        navText: ['<svg viewBox="0 0 24 24"><path d="M15.41 7.41L14 6l-6 6 6 6 1.41-1.41L10.83 12z"></path></svg>', '<svg viewBox="0 0 24 24"><path d="M10 6L8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z"></path></svg>']
    });
})