Message-ID: <20000730232548.21372.qmail@web119.yahoomail.com>
Date: Sun, 30 Jul 2000 16:25:48 -0700 (PDT)
From: Chris Campbell <dash_ampersand@yahoo.com>
Subject: [linux-lvm] RAID performance help
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

I had mentioned to the list before about my
performance problems.  We are not using write-back
caching.  I will enable that after we get our
automatic [power fail] shutdown scripts going again. 
Could someone recommend some parameters for PEs on LVM
combined with block size on the LVM?  I believe we
have options for 2K to 256K on our RAID controller.  I
am looking at going with RAID 1+0 or maybe just doing
striping on the thing.  Our current setup yields
horrid write performance.

Thanks,

Chris

__________________________________________________
Do You Yahoo!?
Kick off your party with Yahoo! Invites.
http://invites.yahoo.com/
