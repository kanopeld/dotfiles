    # see https://bugs.freedesktop.org/show_bug.cgi?id=34164
    unset GREP_OPTIONS

    if [ -n "${XDG_CURRENT_DESKTOP}" ]; then
      case "${XDG_CURRENT_DESKTOP}" in
         # only recently added to menu-spec, pre-spec X- still in use
         Cinnamon|X-Cinnamon)
           DE=cinnamon;
           ;;
         ENLIGHTENMENT)
           DE=enlightenment;
           ;;
         # GNOME, GNOME-Classic:GNOME, or GNOME-Flashback:GNOME
         GNOME*)
           DE=gnome;
           ;;
         KDE)
           DE=kde;
           ;;
         DEEPIN|Deepin|deepin)
           DE=deepin;
           ;;
         LXDE)
           DE=lxde;
           ;;
         LXQt)
           DE=lxqt;
           ;;
         MATE)
           DE=mate;
           ;;
         XFCE)
           DE=xfce
           ;;
         X-Generic)
           DE=generic
           ;;
      esac
    fi

    if [ x"$DE" = x"" ]; then
      # classic fallbacks
      if [ x"$KDE_FULL_SESSION" != x"" ]; then DE=kde;
      elif [ x"$GNOME_DESKTOP_SESSION_ID" != x"" ]; then DE=gnome;
      elif [ x"$MATE_DESKTOP_SESSION_ID" != x"" ]; then DE=mate;
      elif `dbus-send --print-reply --dest=org.freedesktop.DBus /org/freedesktop/DBus org.freedesktop.DBus.GetNameOwner string:org.gnome.SessionManager > /dev/null 2>&1` ; then DE=gnome;
      elif xprop -root _DT_SAVE_MODE 2> /dev/null | grep ' = \"xfce4\"$' >/dev/null 2>&1; then DE=xfce;
      elif xprop -root 2> /dev/null | grep -i '^xfce_desktop_window' >/dev/null 2>&1; then DE=xfce
      elif echo $DESKTOP | grep -q '^Enlightenment'; then DE=enlightenment;
      elif [ x"$LXQT_SESSION_CONFIG" != x"" ]; then DE=lxqt;
      fi
    fi

    if [ x"$DE" = x"" ]; then
      # fallback to checking $DESKTOP_SESSION
      case "$DESKTOP_SESSION" in
         gnome)
           DE=gnome;
           ;;
         LXDE|Lubuntu)
           DE=lxde; 
           ;;
         MATE)
           DE=mate;
           ;;
         xfce|xfce4|'Xfce Session')
           DE=xfce;
           ;;
      esac
    fi

    if [ x"$DE" = x"" ]; then
      # fallback to uname output for other platforms
      case "$(uname 2>/dev/null)" in 
        CYGWIN*)
          DE=cygwin;
          ;;
        Darwin)
          DE=darwin;
          ;;
      esac
    fi

    if [ x"$DE" = x"gnome" ]; then
      # gnome-default-applications-properties is only available in GNOME 2.x
      # but not in GNOME 3.x
      which gnome-default-applications-properties > /dev/null 2>&1  || DE="gnome3"
    fi

    if [ -f "$XDG_RUNTIME_DIR/flatpak-info" ]; then
      DE="flatpak"
    fi

    echo $DE
