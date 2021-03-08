/*
 * Custom code goes here.
 * A template should always ship with an empty custom.js
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
            remove = true
        }
        i++;

    }
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
    displayCheckOutTab()
    steps.each(function(index) {
        $(this).click(function() {
            if ($(tabs[index]).hasClass('-complete')) {
                removeCurrentClass()
                $(tabs[index]).css('display', 'block')
                $(tabs[index]).addClass("-current")
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


//mon compte 
(function() {
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
})();