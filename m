From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200008030742.e737gX632588@webber.adilger.net>
Subject: Re: [linux-lvm] lvrename oddities
In-Reply-To: <OF47714B36.BB532552-ONC125692F.00703DF0@resnova.de>
 "from Peter.Wuestefeld@resnova.de at Aug 3, 2000 08:47:40 am"
Date: Thu, 3 Aug 2000 01:42:33 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter.Wuestefeld@resnova.de
Cc: Linux LVM mailing list <linux-lvm@msede.com>

Peter Wuestefeld writes:
> When booting, vgscan wipes out /etc/lvmtab.d and its contents as well as
> /etc/lvmtab.

Not that it is a fix for your problem, but I wonder about the reason for
using vgscan at boot time...  I know that this is what the LVM documentation
says to do, but _I_ would much rather have only "vgchange -a y" at boot time.
If LVM work needs to be done (PV/VG added or removed) the sysadmin should
know about it and be required to do something.  Nothing like having all of
your VGs dissapear after a reboot because a cable was disconnected...  At
most, it should do like AIX and simply mark the PV/VG as inactive or similar.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
