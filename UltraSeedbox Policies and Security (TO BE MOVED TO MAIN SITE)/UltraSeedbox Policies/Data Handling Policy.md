At Ultraseedbox, we ask and store the minimum amount of information from you that is necessary to maintain our records and provide the services that you’d expect from us. The Ultraseedbox team is also well-trained to handle your data with the utmost privacy and security in mind and are required to observe strict rules, which includes using strong credentials and multi-factor authentication.
Also, all of the payment processing is entirely handled by our payment processors, and none of your financial information is stored to Ultraseedbox, aside from the user’s payment and their respective transaction IDs.

### Email
* **Uses**
  * Serve as your login on your Ultraseedbox Client Area and Ultraseedbox Control Panel.
  * Point of contact for Ultraseedbox service announcements
  * Point of contact for Ultraseedbox Ticket System inquiries
* **Collection**
  * The user provides this during signup.
* **Storage**
  * WHMCS = Cleartext
  * Django Suit = Cleartext
* **Access and Reasons for Access**
  * User
  * Ultraseedbox team
    * This is for contacting the user for support or any service announcements.
* **Retention**
  * Indefinite
* **More information**
  * Sensitive Data Removal Policy

### Username
* **Uses**
  * This is to identify the user on the Ultraseedbox Ticket System.
  * It also will be the name of the user’s Ultraseedbox slot.
  * It’ll be registered as a local user on the server that the user’s slot has deployed in. This will also show any running processes that the user has.
  * It’ll also serve as the user’s username for installed applications.
* **Collection**
  * The user provides this during signup.
* **Storage**
  * WHMCS = Cleartext
  * Django Suit = Cleartext
  * Installed Applications = Depends on the Application
* **Access and Reasons for Access**
  * User
  * Ultraseedbox team
    * This is needed for any support inquiries.
    * This is also required to investigate any server issues by searching for applications that have high resource consumption, server instability source, or any illegitimate applications that the user runs.
* **Retention**
  * Indefinite
* **More Information**
  * Sensitive Data Removal Policy

### Country
* **Uses**
  * This is to compute taxes that apply to the user’s country of their choosing.
* **Collection**
  * The user provides this during signup.
* **Storage**
  * WHMCS = Cleartext
* **Access and Reasons for Access**
  * User
  * Ultraseedbox team
* **Retention**
  * Indefinite
* **More Information**
  * Sensitive Data Removal Policy

### Password
#### Ultraseedbox Client Area Password
* **Uses**
  * Serve as the user’s password on your Ultraseedbox Client Area.
* **Collection**
  * The user provides this during signup on the Ultraseedbox Client Area.
* **Storage**
  * WHMCS = Encrypted
* **Access and Reasons for Access**
* User
* Limited access by the Ultraseedbox team
  * The Ultraseedbox team has no means of seeing the user’s password as it is hashed, but they can reset your password for you after verification.

* **Retention**
  * Indefinite
* **More Information**
  * Sensitive Data Removal Policy
  * Password Policy

#### Ultraseedbox Control Panel Password
* **Uses**
  * Serve as the user’s password on the Ultraseedbox Control Panel to gain access to their slot.
* **Collection**
  * The user provides this after the deployment of the user’s slot.
* **Storage**
  * Django Suit = Encrypted
* **Access and Reasons for Access**
* User
* Limited access by the Ultraseedbox team
  * The Ultraseedbox team has no means of seeing the user’s password as it is hashed, but they can reset your password for you after verification.

* **Retention**
  * Indefinite
* **More Information**
  * Sensitive Data Removal Policy
  * Password Policy

#### Application Passwords
* **Uses**
  * Serve as the password for the user’s installed applications.
* **Collection**
  * The user provides this after the deployment of the user’s slot.
* **Storage**
  * Django Suit = Cleartext
  * Installed Applications = Depends on the Application
* **Access and Reasons for Access**
* User
* Ultraseedbox team
  * This is needed to provide application-specific support inquiries, with the user’s permission.
* **Retention**
  * Until the user uninstalls the application
* **More Information**
  * Sensitive Data Removal Policy
  * Password Policy

### Payment Processing
#### PayPal
* **Uses**
  * Serves as one of Ultraseedbox’s payment gateways
* **Collection**
  * Payment processing is done entirely by PayPal. The only data that is saved in WHMCS under the user’s account is the **PayPal Transaction ID**.
* **Storage**
  * WHMCS = Cleartext (PayPal Transaction ID)
* **Access and Reasons for Access**
* Ultraseedbox Sales Team
  * The Ultraseedbox Sales Team may verify the user’s information with PayPal as part of our sales process.
* **Retention**
  * Indefinite

#### Coinbase
* **Uses**
  * Serves as one of Ultraseedbox’s payment gateways
* **Collection**
  * Payment processing is done entirely by PayPal. The only data that is saved in WHMCS under the user’s account is the **Coinbase Payment ID and Hash**.
* **Storage**
  * WHMCS = Cleartext (Coinbase Payment ID and Hash)
* **Access and Reasons for Access**
* Ultraseedbox Sales Team
  * The Ultraseedbox Sales Team may verify the user’s information with Coinbase as part of our sales process.
* **Retention**
  * Indefinite

### Logs and Analytics
#### Server Metrics
* **Uses**
  * This is to view the health and resource usage of the servers.
* **Collection**
  * The user provides this after the deployment of the user’s slot.
* **Storage**
  * Ultraseedbox Servers = Cleartext
  * Django Suit = Cleartext
  * Sentry.io = Cleartext
* **Access and Reasons for Access**
* User
  * Server metrics can be viewed using various Linux utilities installed on your slot. The following are the major metrics can be seen:
    * CPU Usage
    * Swap Usage
    * RAM Usage
    * 1/5/15 Load Average
    * Your running processes
    * Processes run by other users on the same server are not accessible by you.
    * Input/Output metrics
    * Disk space
    * Quota disk space (your allocated disk space)
    * Physical disk space
* Ultraseedbox Team
  * In addition to the metrics above, the Ultraseedbox team uses Sentry.io to quickly aggregate all metrics from all of the servers and warn the team of any errors in any servers.
  * Server metrics can be used for support inquiries and to investigate any resource abuse in any server.
* **Retention**
  * Indefinite

#### Authentication Logs
##### Ultraseedbox Control Panel Login Attempts
* **Uses**
  * Any invalid access accepts are logged into Django Suit, which bars the user from logging into the UCP after a certain number of attempts for a certain period of time. This includes the following:
    * Username, as inputted by the user
    * IP address
    * Number of attempts
    * Last date of attempt
* **Collection**
  * These are collected when a user enters his credentials incorrectly.
* **Storage**
  * Django Suit = Cleartext
* **Access and Reasons for Access**
* Ultraseedbox Team
  * These are used to identify any brute-force attempts
  * User can also request to lift his timeout and remove the access attempt, upon request and verification via the Ticket system
* **Retention**
  * 24 hours or if the user requests it.

##### sshd Logs
* **Uses**
  * Standard logs created by the SSH Daemon. It’s located at `/var/log/auth.log`
* **Collection**
  * These are collected when SSH Daemon is operational
* **Storage**
  * Ultraseedbox Servers = Cleartext
* **Access and Reasons for Access**
* Limited Access Ultraseedbox team
  * These are checked for possible network intrusions, checking certificates for expiry and SSH daemon troubleshooting by the Ultraseedbox Technical Support Team and are accessed only when necessary.
* **Retention**
  * Indefinite

#### System Generated Logs
* **Uses**
  * Server-wide generated logs, used in identifying any issues on the servers.
* **Collection**
  * These are logs that are generated by the operating system of the servers.
* **Storage**
  * Ultraseedbox Servers = Cleartext
  * Sentry.io = Cleartext
* **Access and Reasons for Access**
* Limited Access Ultraseedbox team
  * They are used to identify any issues in a specific server.
  * The logs are also aggregated by Sentry.io, which warns the team of any errors in any servers.
* **Retention**
  * Indefinite

#### Logs Generated by Installed Applications
* **Uses**
  * Logs generated by your installed applications, used in identifying issues within your slot.
* **Collection**
  * The user’s installed applications generate these logs.
* **Storage**
  * Django Suit = Cleartext
  * Installed Applications = Cleartext
* **Access and Reasons for Access**
* User
* Ultraseedbox team
  * This is needed to provide application-specific support inquiries, with your permission.
* **Retention**
  * Until the user uninstalls the application or removes it.

#### User’s bash History
* **Uses**
  * This is a record of all the commands entered by the user on the seedbox’s shell. It’s located in `$HOME/.bash_history`
* **Collection**
  * Each command entered on the shell is recorded.
* **Storage**
  * Ultraseedbox Servers = Cleartext
* **Access and Reasons for Access**
* User
* Ultraseedbox team
  * These are used for general or application-specific inquiries such as checking if the entered commands by the user are correct.
  * Also used to check for possible intrusions or server abuse.
* **Retention**
  * Indefinite until the user removes it.

#### Hosted Data
##### Installed Applications
* **Uses**
  * Essential files for installed applications to run properly
* **Collection**
  * The user installs this on your slot.
* **Storage**
  * Ultraseedbox Servers = Depends on the Application
* **Access and Reasons for Access**
* User
* Ultraseedbox team
  * This is for application-centric support inquiries, with the user’s permission.
* **Retention**
  * Indefinite until the user removes it.

##### User Data
* **Uses**
  * Data created by the user and/or the user’s applications and is stored on the user’s slot.
* **Collection**
  * This is created by the user and/or the user’s applications.
* **Storage**
  * Ultraseedbox Servers = Cleartext
* **Access and Reasons for Access**
* User
  * The user’s files are stored in one of the home folders in one of Ultraseedbox’s servers and are isolated from other users. Only the user can access it.
* Ultraseedbox team
  * This can be accessed for any support inquiries, with the user’s permission.
* **Retention**
  * Indefinite until the user removes it.
    * For any legitimate DMCA takedown notices, we’ll be informing the user and be asked to delete said content within 24 hours.
* **More Information**
  * Abuse Policy
  * Sensitive Data Policy