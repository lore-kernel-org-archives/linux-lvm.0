Message-ID: <37233A05.27BFC35E@geotec.net>
Date: Sun, 25 Apr 1999 10:51:34 -0500
From: Eric Smith <seric@geotec.net>
MIME-Version: 1.0
Subject: [linux-lvm] vgscan & vgchange -a y location in startup scripts
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

On my Alpha, with RedHat 5.2 (SysV style init), where exactly should I
put the vgscan and vgchange -a y?

** Should I put it in /etc/init.d/rc.sysinit?  And if so, should it be
AFTER mounting / and /proc (but before, of course, mounting anything
else)?

** Should it be after fsck runs?

I have the kernel patched and lvm installed (with patch) and I'm ready
to try it out.  But I need to know just where to put vgscan and vgchange
-a y!


THANKS!

Regards,

--Eric Smith
