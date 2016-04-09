/*
 By Osvaldas Valutis, www.osvaldas.info
 Available for use under the MIT License
 */

'use strict';

;( function ( document, window, index )
{
    var div = document.querySelector( '.form-group.place_logo' );

    var label	 = div.nextElementSibling;
    var labelVal = label.innerHTML;

    var fileInput = document.getElementById("logo");
    console.log(fileInput);
    fileInput.addEventListener( 'change', function( e )
    {
        console.log("change");
        var fileName = '';
        console.log(this.files);
        console.log(this.files.length);

        if( this.files && this.files.length > 1 )
            fileName = ( this.getAttribute( 'data-multiple-caption' ) || '' ).replace( '{count}', this.files.length );
        else
            fileName = e.target.value.split( '\\' ).pop();

        if( fileName )
            label.querySelector( 'span' ).innerHTML = fileName;
        else
            label.innerHTML = labelVal;
    });

    // Firefox bug fix
    fileInput.addEventListener( 'focus', function(){ input.classList.add( 'has-focus' ); });
    fileInput.addEventListener( 'blur', function(){ input.classList.remove( 'has-focus' ); });

}( document, window, 0 ));


/*
 By Osvaldas Valutis, www.osvaldas.info
 Available for use under the MIT License
 */
//
//'use strict';
//
//;( function( $, window, document, undefined )
//{
//    $( '.form-group.place_logo' ).each( function()
//    {
//        var $div	 = $( this ),
//            $label	 = $div.next( 'label' ),
//            labelVal = $label.html(),
//            $input = $('.file.form-control');
//        console.log($input);
//        $input.on( 'change', function( e )
//        {
//            console.log('change');
//            var fileName = '';
//
//            if( this.files && this.files.length > 1 )
//                fileName = ( this.getAttribute( 'data-multiple-caption' ) || '' ).replace( '{count}', this.files.length );
//            else if( e.target.value )
//                fileName = e.target.value.split( '\\' ).pop();
//
//            if( fileName )
//                $label.find( 'span' ).html( fileName );
//            else
//                $label.html( labelVal );
//        });
//
//        // Firefox bug fix
//        $input
//            .on( 'focus', function(){ $input.addClass( 'has-focus' ); })
//            .on( 'blur', function(){ $input.removeClass( 'has-focus' ); });
//    });
//})( jQuery, window, document );
