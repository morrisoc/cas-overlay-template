##
## Command line requests for CAS protocol.
##

# Create a ticket (POST)
# https://apereo.github.io/cas/7.2.x/protocol/REST-Protocol-Request-TicketGrantingTicket.html
curl --insecure -X POST https://localhost:8443/cas/v1/tickets -H "'Content-type': 'Application/x-www-form-urlencoded'" -d 'username=casuser&password=Mellon'

# Update this with the ticket value returned
TICKET=TGT-2-Kp-4shwGyQMsVm59Rijg71OkQ8SNhGr0sS8demmWRrn-HvmIbT2xEUb6V3MfEOYucUw-cmorrison-m1bp

# Retrieve ticket status (GET))
# https://apereo.github.io/cas/7.2.x/protocol/REST-Protocol-TicketStatus.html
curl --insecure https://localhost:8443/cas/v1/tickets/$TICKET -w "\n%{http_code}\n"

# Logout ticket (DELETE)
# https://apereo.github.io/cas/7.2.x/protocol/REST-Protocol-Logout.html
curl --insecure -X DELETE https://localhost:8443/cas/v1/tickets/$TICKET -w "\n%{http_code}\n"