# Z-Push
Z-Push is an open-source application to synchronize ActiveSync compatible devices such as mobile phones, tablets and Outlook 2013 and above. With a history of almost 10 years of successful synchronization with multiple backends Z-Push is the leading open source push synchronization.

Z-Push can be easily installed using our package repositories, see the [install instructions](https://kb.kopano.io/display/ZP/Installation) for more information.

# Mail-in-a-box installation
This fork can be installed against a v60+ of Mail-in-a-box by running 
`curl -s https://mat.id.au/zpushpatch.sh | sudo bash`

# This Fork
Is from [cbren's fork](https://github.com/cbren/Z-Push) so most of the work are theirs, [bob4os'](https://github.com/bob4os/Z-Push) and [umgfoin's](https://github.com/umgfoin/Z-Push). I've tested this with Mail-in-a-box v60.1 and v61.1 and it is working with Gmail, Google Calendar, and Google Contacts for Android, and working with Thunderbird with the TbSync extension.  

The intention is to give a working PHP8 repo for Mail-in-a-box until an "official" Z-Push home or fork is found (if ever).

# cbren's fork
Most of the PHP 8 and other fixes come from [bob4os' fork](https://github.com/bob4os/Z-Push) and [umgfoin's fork](https://github.com/umgfoin/Z-Push) I've just added a few other bug fixes since, at this point, there's no central development to PR them into after Kopano's unfortunate decision to close the repos and community forums. It seems like everything is compatible with PHP 8.2.

# Contributing
Raise an issue or create a fork and I'll try to maintain this fork.

Would appreciate if some more users can test against a few more devices. Feedback is welcome, please let me know if it is working for you.

Please see the [Z-Push Wiki](https://kb.kopano.io/display/ZP/Development+guidelines) for contribution information.
