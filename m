Message-ID: <38443E3C.E60134CF@msede.com>
Date: Tue, 30 Nov 1999 22:14:36 +0100
From: Michael Marxmeier <mike@msede.com>
MIME-Version: 1.0
Subject: [linux-lvm] Translation of Torsten's Message
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Forwarded message from Holger.Rauch@datech.heitec.de.

-------- Forwarded Message --------
Hi folks!

Here is my translation of Torsten's message:

I'm currently a bit lazy, that's why I'm asking here whether someone
could potentially find my code useful. Maybe then I can manage to
write documentation for it.

I've created my own Linux installation CD (based on SuSE 6.2) which
allows me to:
- directly install LVM system (incl. initrd and / on a LV)
- install a larger number of systems at the same time
- make site-specific changes

The method used is rather simple: I boot the CD, mount a master
directory over NFS, and have then a script run that asks a few
questions as to how exactly I would like to configure my system. Then,
all that is done is that a big tar file will be extracted.

The config file looks roughly as follows:

[config_file]

That means: I can choose an image ws.tar.gz in an ASCII user interface
(which is shown to me in the selection box as "normal workstation");
that's preselected ("selected"=>1). And the size of the LVs is as
follows: "/usr" is predefined to hold 1024MB and has to have at least
512MB in size. /tmp is supposed to hold 256MB and doesn't need to have
a minimal size.
At the end of the installation a script ws.postinstall.sh will be run.
( I can specify more such images in my configuration, and then choose
among them ).
In addition, I can then choose among different kernels (IDE systems
vs. SCSI systems vs. SMP systems ) and install additional archives
based on the host (e.g. vmware + preinstalled NT *sigh*)
Finally, it is also intended to restore host specific files
(XF86Config,
ssh_host_key, ...) automatically.

Using this method, I need only 10 minutes for our typical WWW server
(from initially switching it on until I got a running system). That
includes all site-specific adaptions. (That all takes such a long time
because I have to change the boot order in the BIOS first and SCSI
systems take such a long time to boot. The actual installation takes
less than 5 minutes.)
Now to my prerequisites:
- There should be a machine that could be used as an NFS server (it
needs a lot of hard disk space), everything should work from the CD as
well (not tested). I was just using NFS because changes were easier to
incorporate.
- There should be quite a few machines (> 20) available that are
supposed to be installed in a similar way. Otherwise, it's not worth
the effort.

Advantages of that system:
- All hosts are configured identically, such that the effort to
administer the systems is minimized.
- All hosts are fully configured (e.g. the printer configuration is
working immediately)
- I don't need a backup of single machines since I can quickly
reinstall them from scratch using the master image.

Drawbacks:

- The effort to create a clean image should not be underestimated

Wishlist:

- RAID1 support (fails because I've not yet been able to get RAID1
  system with initrd up and running)
- striping support (is supposed to be easy, I just haven't been able
to come up
  with a user interface so far, append mode is already included)
- tuning of the FS/LVM parameters, other fs's instead of ext2
  (ReiserFS?)
- ...

Anyone interested should contact me, I think then I can manage to
document the whole sutff clearly and to put it on an ftp server

Greetings,

	Torsten

------------------------

Greetings,

	Holger

=========================================
Holger Rauch
HEITEC Datentechnik GmbH
Schuhstrasse 30
91052 Erlangen
Germany

Tel.: 09131 / 877 - 273
Fax: 09131 / 877 - 222
Email: Holger.Rauch@datech.heitec.de
=========================================
