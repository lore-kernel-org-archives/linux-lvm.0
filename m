Date: Mon, 5 Jul 1999 16:21:44 -0400
From: root <root@gate.penguinpowered.com>
Message-Id: <199907052021.QAA09282@gate.penguinpowered.com>
Subject: [linux-lvm] another invalid i/o ... error
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hi there.

I've been reading the mailing list archives avidly, trying to solve my problem.

As a big fan of LVM on HPUX, I wanted to implement this on my Sparc Linux
system.  I installed RedHat 6.0 and Alan Cox's 2.2.10-ac7 (just to be current).

Anyhow, LVM was built as a module and seems to install fine:
[root@gate 0.6]# lsmod
[No write since last change]
Module                  Size  Used by
lvm                    28352   0

I downloaded the lvm_6.0.tar.gz file, and applied the patch.  It built and
installed fine.  I made the /dev/lvm entry (mknod /dev/lvm c 109 0).

But running vgscan results in the oft-reported error:
[root@gate 0.6]# vgscan
vgscan -- invalid i/o protocol version

So, Here's the end of an strace vgscan, note the open of "di2", whatever that is.  After scratching my head for a few days, I made a device file in the
current directory  (mknod di2 c 109 0) and re-ran vgscan -- got another odd
error.  Anyhow, here's the straces:


<snip>

getpid()                                = 9242
getuid()                                = 0
geteuid()                               = 0
open("di2", O_RDONLY)                   = -1 ENOENT (No such file or directory)
write(2, "vgscan -- invalid i/o protocol v"..., 40vgscan -- invalid i/o protocol version

) = 40
exit(96)                                = ?
[root@gate 0.6]# mknod di2 c 109 0
[root@gate 0.6]# strace vgscan

   <snip>

getpid()                                = 9245
getuid()                                = 0
geteuid()                               = 0
open("di2", O_RDONLY)                   = 3
ioctl(3, 0x4004fe98, 0xefffebd6)        = 0
close(3)                                = 0
write(2, "vgscan -- logical volume manager"..., 44vgscan -- logical volume manager yet locked
) = 44
exit(97)                                = ?


Any sage advice for me?
I'm not subscribed to the list, but an reading the archive web page.  I'll 
subscribe when I get back to work... :)

Simon Galton
galtons@thegeek.org
