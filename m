Message-ID: <19990329140718.57465@doit.wisc.edu>
Date: Mon, 29 Mar 1999 14:07:18 -0600
From: jleu@doit.wisc.edu
Subject: [linux-lvm] LVM on Sparc-linux 2.2.4
Reply-To: jleu@doit.wisc.edu
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Has anyone tries LVM on SPARC-linux kernel 2.2.4?

I applied that patch, but the LVM option didn't show up in 
the menu config.  I tried adding the appropriate defines to .config
but I'm not sure if that worked.

When I run vgscan it says:

vgscan -- invalid i/o protocol version

Anyone else see this?

Jim

-- 
James R. Leu        |  University of Wisconsin - Madison
Network Engineer    |  Division of Information Technology
jleu@doit.wisc.edu  |  Network Engineering Technology  
