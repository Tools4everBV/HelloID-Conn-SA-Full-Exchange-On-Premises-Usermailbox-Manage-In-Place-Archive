# HelloID-Conn-SA-Full-Exchange-On-Premises-Usermailbox-Manage-In-Place-Archive

| :information_source: Information                                                                                                                                                                                                                                                                                                                                                          |
| :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| This repository contains the connector and configuration code only. The implementer is responsible for acquiring the connection details such as username, password, certificate, etc. You might even need to sign a contract or agreement with the supplier before implementing this connector. Please contact the client's application manager to coordinate the connector requirements. |

## Description

_HelloID-Conn-SA-Full-Exchange-On-Premises-Usermailbox-Manage-In-Place-Archive_ is a template designed for use with HelloID Service Automation (SA) Delegated Forms. It can be imported into HelloID and customized according to your requirements.

By using this delegated form, you can manage in-place archive settings for Exchange On-Premises user mailboxes. The following options are available:

1.  Search for mailboxes by entering a name, SamAccountName, alias, or primary SMTP address
2.  Select the desired mailbox from the search results grid
3.  Enable or disable the in-place archive for the selected mailbox
4.  The in-place archive status is updated in Exchange On-Premises
5.  Audit logs are generated for all operations including connection, updates, and disconnection

## Getting started

### Requirements

- **Exchange On-Premises Server**:<br>
  A functional Exchange On-Premises server with remote PowerShell access enabled. The connector uses remote PowerShell sessions to connect and manage mailboxes.
- **Administrative Credentials**:<br>
  Valid administrative credentials with permissions to manage mailboxes and enable/disable in-place archives in Exchange On-Premises.
- **Network Connectivity**:<br>
  The HelloID agent must have network connectivity to the Exchange server URI (typically https://exchange-server.domain.com/PowerShell).
- **PowerShell Remoting**:<br>
  PowerShell remoting must be enabled on the Exchange server, and the Microsoft.Exchange configuration must be accessible.
- **TLS 1.2 Support**:<br>
  The environment must support TLS 1.2 protocol for secure communication with Exchange servers.

### Connection settings

The following user-defined variables are used by the connector.

| Setting               | Description                                                                          | Mandatory |
| --------------------- | ------------------------------------------------------------------------------------ | --------- |
| ExchangeConnectionUri | The URI to the Exchange server (e.g., https://exchange-server.domain.com/PowerShell) | Yes       |
| ExchangeAdminUsername | The username for the Exchange administrator account                                  | Yes       |
| ExchangeAdminPassword | The password for the Exchange administrator account                                  | Yes       |

## Remarks

### Archive Status Detection

- Archive status is determined by checking the ArchiveGuid property. If ArchiveGuid equals '00000000-0000-0000-0000-000000000000', the archive is disabled; otherwise, it is enabled.

### Certificate Validation

- The connector properly validates SSL certificates by setting SkipCACheck, SkipCNCheck, and SkipRevocationCheck to false. Ensure that valid certificates are configured on the Exchange server.

### Authentication Method

- The connector uses 'Default' authentication method for broader compatibility with different Exchange configurations. Adjust the authentication method in the session parameters if your environment requires a specific method (e.g., Kerberos, Basic).

### Command Import Optimization

- Only the required Exchange cmdlets (Enable-Mailbox, Disable-Mailbox) are imported during the session to reduce memory usage and improve performance.

### Wildcard Search Support

- The search functionality supports wildcard character `*` to retrieve all user mailboxes. Users can search by Name, SamAccountName, Alias, or PrimarySmtpAddress.

## Development resources

### Datasources

The following datasources are used by the connector:

| Datasource                                                                                                              | Description                                                                                                                                                                                                                            |
| ----------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| exchange-on-premises-usermailbox-manage-in-place-archive - Exchange-On-Premises-Get-Usermailbox-Wildcard-Name-Alias     | Queries Exchange to search for user mailboxes matching the search criteria (Name, SamAccountName, Alias, PrimarySmtpAddress). Returns mailbox details including DisplayName, PrimarySmtpAddress, UserPrincipalName, and ArchiveStatus. |
| exchange-on-premises-usermailbox-manage-in-place-archive - Exchange-On-Premises-Get-Usermailbox-In-Place-Archive-Status | Returns the current in-place archive status (enabled/disabled) for the selected mailbox based on the ArchiveStatus property.                                                                                                           |

### Tasks

| Task                                                         | Description                                                                                                                                                                      |
| ------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Exchange On-Premises - Usermailbox - Manage In-Place Archive | Enables or disables the in-place archive for the selected user mailbox using Enable-Mailbox or Disable-Mailbox cmdlets. Includes comprehensive audit logging for all operations. |

### API documentation

- [Connect to Exchange servers using remote PowerShell](https://learn.microsoft.com/en-us/powershell/exchange/connect-to-exchange-servers-using-remote-powershell)
- [Get-Mailbox](https://learn.microsoft.com/en-us/powershell/module/exchange/get-mailbox)
- [Enable-Mailbox](https://learn.microsoft.com/en-us/powershell/module/exchange/enable-mailbox)
- [Disable-Mailbox](https://learn.microsoft.com/en-us/powershell/module/exchange/disable-mailbox)
- [Remove-PSSession](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/remove-pssession)

## Getting help

> :bulb: **Tip:**  
> _For more information on Delegated Forms, please refer to our [documentation](https://docs.helloid.com/en/service-automation/delegated-forms.html) pages_.

## HelloID docs

The official HelloID documentation can be found at: https://docs.helloid.com/
