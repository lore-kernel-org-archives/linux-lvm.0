Message-ID: <20000424214319.25170.qmail@web110.yahoomail.com>
Date: Mon, 24 Apr 2000 14:43:19 -0700 (PDT)
From: Chris Campbell <dash_ampersand@yahoo.com>
Subject: [linux-lvm] vg problems after power failure
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

We had a power failure and our server (fortunately not
"production" yet...) lost power.  Now vgscan does not
find volume groups.  Also, at boot time, Linux says it
finds a partition -- sdb1.  This shouldn't be
happening, should it?


[root@microviz00 lvmconf]# vgscan -v vgscan --
removing "/etc/lvmtab" and "/etc/lvmtab.d" vgscan --
reading all physical volumes (this may take a
while...) vgscan -- no volume groups found            
                                                      
                                      

Is there anything I might try to get it to recognize
the volume group?  Thanks in advance.



Chris

__________________________________________________
Do You Yahoo!?
Send online invitations with Yahoo! Invites.
http://invites.yahoo.com
