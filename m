Message-Id: <m10vr8B-0000YbC@duffy1.franken.de>
From: Rolf Jakob <rjakob@duffy1.franken.de>
Subject: Re: [linux-lvm] lvm-0.6, Linux 2.2.9 and devfs-patch-v99.2
In-Reply-To: <5lbtea33d6.fsf@tequila.cs.yale.edu> from Stefan Monnier at "Jun 20, 1999  6:37:41 pm"
Date: Mon, 21 Jun 1999 01:36:06 +0200 (MET DST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

> >>>>> "Rolf" == Rolf Jakob <rjakob@duffy1.franken.de> writes:
> > I managed to resize a mounted file system and several times it was possible
> > to copy more files on it after the resize. But from time to time I got an
> 
> Is it supposed to work on mounted filesystems ?
> The webpage doesn't seem to mention such a feature.

Well, some debug says something about flushing used blocks, so I think
yes, it's supposed to be. I was just hoping and trying :-)
But you're right, it isn't stated clearly. The author is just starting
a FAQ section on his home page.

Rolf
-- 
Rolf Jakob at home (rjakob@duffy1.franken.de)
WWW : http://www.franken.de/users/duffy1/rjakob (KDE-Utils and CCS)
