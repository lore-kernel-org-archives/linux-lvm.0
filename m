Message-Id: <199903111628.RAA09179@e35.msede.com>
Date: Thu, 11 Mar 1999 10:38:30 -0500
From: "Verloove, Olivier" <olivier_verloove@merck.com>
Subject: RE: [linux-lvm] Bonehead problem
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

In fact, I didn't have LVM 0.5 compiled on this system.
The problem was due to the device file /dev/lvm missing.

And thanks for the md[4-15] remark. I'm on RH5.2 and it was the cause of
vgscan hanging the system (see other message).

Olivier
> ----------
> From:
> Steve_J_Brueggeman@notes.seagate.com[SMTP:Steve_J_Brueggeman@notes.seagate
> .com]
> Sent: 	Thursday, 11 Mar, 1999 16:08
> To: 	linux-lvm@msede.com
> Subject: 	RE: [linux-lvm] Bonehead problem
> 
> 
> It sounds to me like you've got old modules hanging around as left-overs.
> Did you build LVM 0.5 with the same kernel version? (2.2.2 presumably).
> If
> so, did you clear out your old modules directory before you rebuilt the
> kernel with LVM 0.6?  Are you using modversions when you build the
> kernel/modules?
> 
> I've also noticed that vgscan will cause the kernel will complain about
> not
> being able to find some block devices that I have not compiled into
> modules, or the kernel.  This doesn't sound like your problem though.
> 
> I've also had a problem when vgscan ran, because of a bug in the md
> driver.
> I run RedHat 5.2, and the default installation created /dev/md0 through
> /dev/md15, but the default md driver is compiled to handle only 4 md
> devices (#define MAX_MD_DEV  4), and because of a bug in the md_open()
> (uses [minor] without checking minor is less than MAX_MD_DEV), my kernel
> would crash when vgscan tried to check /dev/md6 or so.  I just rm'd
> /dev/md[4-9] /dev/md1[0-5] to not cause the problem.   I don't think this
> is your problem either, but thought you might like to know.
> 
> Steve Brueggeman
> (All opinions are my own, and in no way reflect those of my employer).
> (<--legal-crud)
> 
> 
> 
> 
> 
> 
