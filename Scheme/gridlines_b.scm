; GIMP Skript das ein konfigurierbares Gitternetz im GIMP zeichnet
; Im GIMP und im Menu registrieren
(script-fu-register 
 "script-fu-grid-lines-add-to-image" ; Funktionsname
 "Add gridlines"	; Menu Punkt
 "Illustrates the structure of a GIMP script" ; Beschreibung
 "Roger Diehl"          ; Autor
 "2018, HSLU - I"     ; Copyright Notiz
 "October 2018"         ; Erstellungsdatum
 ""                     ; Bild Typ des Skript - "" heisst, es muss kein Bild geladen sein
 ; aktuelle Parameter von script-fu-grid-lines
 SF-IMAGE "Image" 0 ; current image
 SF-ADJUSTMENT "Spacing" '(20 2 100 1 1 0 1)         ; spacing - default 20
 SF-BRUSH "Brush" '("Circle (01)" 100.0 1 0)         ; brush - default Circle (01)
 SF-COLOR "Foreground" '(0 0 0)                      ; foreground color - default white
 SF-TOGGLE "Horizontal lines" TRUE                   ; horizontal - default TRUE
 SF-TOGGLE "Vertical lines" FALSE                    ; vertical - default FALSE
 SF-TOGGLE "Dashed lines" FALSE                      ; dashed - default FALSE
 )
(script-fu-menu-register "script-fu-grid-lines-add-to-image"
                         "<Image>/File/Create/Gridlines")

; Das eigentliche Skript
(define (script-fu-grid-lines-add-to-image image spacing brush foreground horizontal vertical dashed)
  
  (gimp-context-push)
  (let*(
        ; Grundeinstellungen - Farbe, Breite, Höhe, Ebene...
        (color 0)
        (drawable_width (car (gimp-image-width image)))
        (drawable_height (car (gimp-image-height image)))
        (layer (car(gimp-layer-new image drawable_width drawable_height RGBA-IMAGE "grid-layer" 100 NORMAL-MODE)))
        (layer_width (car(gimp-drawable-width layer)))
        (layer_height (car(gimp-drawable-height layer)))
        ; Anfangs- und Endpunkt einer Linie definieren x1, y1, x2, y2
        (point (cons-array 4 'double))
        (invert FALSE)
        )
    ; Gimp Kontext sezten - Transparenz, Hintergrund, Vordergrund, Pinsel, Füllfarbe, Ebene...
    ;(if(= transparent TRUE)
    ;   (set! color TRANSPARENT-FILL)
    ;   (set! color BACKGROUND-FILL)
    ;   )
    ;(gimp-context-set-background background)
    (gimp-context-set-foreground  foreground)
    (gimp-context-set-brush (car brush))
    (gimp-drawable-fill layer TRANSPARENT-FILL)
    (gimp-image-add-layer image layer -1)
    
    ; Demo zum Zeichnen einer Linie
    (define (draw_line x1 y1 x2 y2)
      ; Variablen x1, y1, x2, y2 den Anfangs- und Endpunkten der Linie zuordnen
      (aset point 0 x1)
      (aset point 1 y1)
      (aset point 2 x2)
      (aset point 3 y2)
      ; Linie zeichnen
      (gimp-paintbrush-default layer 4 point)
      )
    ;(cond ((and (eq? vertical FALSE) (eq? horizontal FALSE))
    ;       (draw_line spacing spacing (- layer_width spacing) (- layer_height spacing))
    ;       ))
    
    
    ; ab hier die Gitterlinien-Funktionen...
    
    (define (draw-horizontal-line y)
      (cond
        ((< y layer_height)
         (draw_line 0 y layer_width y)
         (draw-horizontal-line (+ y spacing))
         )
        )
      )

    (define (draw-vertical-line x)
      (cond
        ((< x layer_width)
         (draw_line x 0 x layer_height)
         (draw-vertical-line (+ x spacing))
         )
        )
      )

    (define (draw-dashed-horizontal-line x y)
      (cond
        ((< x layer_width)
         (draw_line x y (+ x spacing) y)
         (draw-dashed-horizontal-line (+ x (* 2 spacing)) y)
         )
        ((< y layer_height)
         (draw-dashed-horizontal-line spacing (+ y spacing)))
        )
      )

    (define (draw-dashed-vertical-line x y)
      (cond
        ((< y layer_height)
         (draw_line x y x (+ y spacing))
         (draw-dashed-vertical-line x (+ y (* 2 spacing)))
         )
        ((< x layer_width)
         (draw-dashed-vertical-line (+ x spacing) spacing))
        )
      )
          

    (cond
      ((and (eq? vertical FALSE) (eq? horizontal TRUE)) 
       (if (eq? dashed FALSE)
           (draw-horizontal-line spacing)
           (draw-dashed-horizontal-line spacing spacing)
       )
      )
      ((and (eq? vertical TRUE) (eq? horizontal FALSE)) 
       (if (eq? dashed FALSE)
           (draw-vertical-line spacing)
           (draw-dashed-vertical-line spacing spacing)
       )
      )
      ((and (eq? vertical TRUE) (eq? horizontal TRUE)) 
       (if (eq? dashed FALSE)
           (and
            (draw-horizontal-line spacing)
            (draw-vertical-line spacing)
           )
           (and 
            (draw-dashed-horizontal-line spacing spacing)
            (draw-dashed-vertical-line spacing spacing)
           )
        )
      )
      )

    
    
    
    ; ...Ende der Gitterlinien-Funktionen
    
    ; Bild anzeigen
    ;(gimp-display-new image)
    (gimp-context-pop)
    (gimp-displays-flush)
    )
  )
