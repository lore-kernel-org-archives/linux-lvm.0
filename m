Message-Id: <m10zT4p-0000YkC@duffy1.franken.de>
From: Rolf Jakob <rjakob@duffy1.franken.de>
Subject: Re: [linux-lvm] vgscan -- invalid i/o protocol version
In-Reply-To: <Pine.LNX.4.10.9906301639130.2611-100000@fuse.aethos.co.uk> from James Pattinson at "Jun 30, 1999  4:42:41 pm"
Date: Thu, 1 Jul 1999 00:43:35 +0200 (MET DST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

> Anyone seen this error msg before?
Yes :-)

> I'm running RH6 with kernel 2.2.10 and the LVM patches applied. I
> originially tried to follow the HOWTO but on the first command i got:
> 
> pvcreate -- ERROR: "/etc/lvmtab" doesn't exist; please run vgscan
> 
> so i ran vgscan and got the message in the subject line. It's possible I'm

Did you build LVM as a module ? Is the module loaded ? I get the same
message when I run vgscan without modprobe lvm.o.

> being really thick and I don't really know what I'm doing. Do I need the
> devfs patches too?

Not that I know of. I never tried it without devfs, but that has other
reasons (having to remove the first SCSI disk is a strong argument for
devfs :-)

Rolf
-- 
Rolf Jakob at home (rjakob@duffy1.franken.de)
WWW : http://www.franken.de/users/duffy1/rjakob (KDE-Utils and CCS)
