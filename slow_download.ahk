#Persistent  ; Garde le script actif
SetTimer, ProcessDownload, 25  ; Vérifie toutes les 25ms pour une exécution ultra-rapide
Return

ProcessDownload:
    ; Chercher "Slow Download" et scroller jusqu'à ce qu'il soit visible
    Loop {
        ; Recherche rapide du bouton après chaque mini-scroll
        ImageSearch, SlowX, SlowY, 0, 0, A_ScreenWidth, A_ScreenHeight, *100 slow_download.png
        if (ErrorLevel = 0) {
            MouseMove, SlowX, SlowY
            Click
            Sleep, 400  ; Petite pause après le clic pour éviter le double-clic
            Return
        }

        ; Si "Slow Download" est absent, scroll immédiatement et revérifie sans attendre
        FastScroll()
    }
Return

FastScroll() {
    Loop, 2 {  ; Faire 2 petits scrolls d'affilée pour accélérer
        Send, {WheelDown}
        Sleep, 50
        Send, {Down}
        Sleep, 50
    }
}
