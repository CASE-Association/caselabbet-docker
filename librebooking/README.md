# `librebooking` container
The librebooking service gets data through two primary sources:
- The database for application data like users, resources, bookings, schedules etc...
- The configuration, set through environment variables in `compose.yaml`, for everything under "Application Configuration"

This prevents changes from being made inside the configuration panel. All changes must be made through environment variables or they will not persist! All configuration keys can be found in the (`.env.example`)[https://github.com/LibreBooking/librebooking/blob/develop/.env.example] file on the LibreBooking GitHub.

Any changes to resources, users etc. are stored in the database which is managed separately.

---
2026 this was migrated from an ancient private fork of Booked Scheduler when it went commercial. LibreBooking is an actively developed fork of the system.


# Mail server setup
The mail sending requires logging in as the `booking@caselabbet.se` account. This is done with an App Password, which can be [managed here](https://myaccount.google.com/apppasswords) when logged in as the account. This should be entered in the environment variables.

Further, to allow app passwords, it's required that
- The account has 2FA enabled
- The user is allowed to use "Less Secure Apps", the permission of which is granted through the "Less Secure Apps" group in GSuite Admin.
