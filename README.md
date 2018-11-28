# HC-Cloud-DevOps

HAP

1. AppMachine (Windows for now. Could be Docker or Lambda, but not right now)
  1. Tiny disk space
  2. Normal amount of RAM
  3. It was running on Lambdas, but performance was an issue
  4. auth-sandbox.ha.com
  5. portal-sandbox.ha.com
2. Database
  1. Currently a SQL Server RDS instance
3. There are a handful of S3 buckets that this application uses
4. Code
  1. Source: [https://hurontfs.visualstudio.com/products/\_git/HHPortal](https://hurontfs.visualstudio.com/products/_git/HHPortal)
  2. Builds: [https://hurontfs.visualstudio.com/products/\_build?definitionId=6](https://hurontfs.visualstudio.com/products/_build?definitionId=6)
5. Ports/Communications
  1. We will need to communicate to Hospitals&#39; SSO systems (LDAP, WSFed, SAML2P) with VPNs, secured traffic, etc.

MyRounding

1. AppMachine (Linux AWS image)
  1. 300Gb disk space
  2. Normal amount of RAM
  3. Currently, QA, UAT, and Prod are built via CloudFormation templates.
  4. myrounding-sandbox.ha.com
2. Mirth Machine (I don&#39;t know if this is Linux or Windows)
  1. This machine handles the ADT traffic
  2. Can be very small for sandbox
3. Database
  1. Currently a MySql RDS instance
4. This was built by Matt Wooley.  Reach out with any questions
5. Code
  1. Source: [https://mr-master-dev.myrounding.com:8443/projects/MYRAPP/repos/mr-webapp/browse](https://mr-master-dev.myrounding.com:8443/projects/MYRAPP/repos/mr-webapp/browse)
  2. Builds: documented on the MyRounding – DevOps TEAMS site.
6. Ports/Communications
  1. If you want to get code directly from our Source Control, we will need a connection into the corresponding server in the MR world

Studer Group Portal, LEM, and PCM

1. AppMachine
  1. Windows Server 2012
  2. 256Gb disk space
  3. Normal amount of RAM
  4. sgportal-sandbox.ha.com
  5. lem-sandbox.ha.com
  6. pcm-sandbox.ha.com
  7. Will also hold:
    1. SFTP server
    2. Interface / datafeed files
2. Database
  1. Windows Server 2012
  2. SQL Server 2016
  3. SQL Server Reporting Services 2012 or 2016
  4. 256GB disk space
  5. Normal amount of RAM
3. Code
Can reach out to Tim Karki for help in deploying to AWS.
  1. Portal
    1. Source: [https://hurontfs.visualstudio.com/products/\_git/Portal](https://hurontfs.visualstudio.com/products/_git/Portal)
    2. Builds: obtained from Daniel Judge
  2. LEM
    1. Source: [https://hurontfs.visualstudio.com/products/\_git/LEM](https://hurontfs.visualstudio.com/products/_git/LEM)
    2. Builds: obtained from Daniel Judge
  3. PCM
    1. Source: [https://hurontfs.visualstudio.com/products/\_git/PCM](https://hurontfs.visualstudio.com/products/_git/PCM)
    2. Builds: obtained from Daniel Judge
