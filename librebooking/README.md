# `librebooking` container
The librebooking service gets data through two primary sources:
- The database for application data like users, resources, bookings, schedules etc...
- The configuration, stored in `config.php`, for everything under "Application Configuration"

This container writes configs and customisation over the stock librebooking image. If you want to make changes to the configuration, **you need to change `config.php`** for them to persist! Any changes to resources, users etc. is stored in the database which is managed separately.


2026 this was migrated from an ancient private fork of Booked Scheduler when it went commercial. Librebooking is an actively developed fork of the system.


# Mail server setup

1. Visit the [Google Admin Panel](admin.google.com/u/1/ac/apps/gmail/routing) and add a new SMTP relay service with the following settings:
- Name: LibreBooking
- Only addresses from my domains
- Authentication: Only IP addresses: enter the chs.portainer.se IP address.
- Require SMTP-authentication
- Require TLS-encryption
And save it.
