Message-Id: <m10tenl-0000YbC@duffy1.franken.de>
From: Rolf Jakob <rjakob@duffy1.franken.de>
Subject: Re: [linux-lvm] lvm-0.6, Linux 2.2.9 and devfs-patch-v99.2
In-Reply-To: <199906132233.AA06526@mailgate1b.telekom.de> from Heinz Mauelshagen at "Jun 14, 1999  0:30:30 am"
Date: Tue, 15 Jun 1999 00:01:56 +0200 (MET DST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

> > 
> > Hi,
> > 
> > Is lvm-0.6 (patched with lvm_0.6-patch-15031999a.gz) supposed to
> > work with Linux 2.2.9 and devfs-patch-v99-2 ?
> > 
> 
> No, not yet 8*(
> 

Just found out : devfs-patch-v99 (mind the missing -2) is working,
hmm, well, at least the compiling didn't stop. No time yet to check
it out, but I don't suspect any difficulties from that.
I used a patch-v92 (IIRC) and didn't encounter problems (beside
non-devfs-aware applications of course :-).

The next step is building dtfs, but I couldn't compile it.

Rolf
-- 
Rolf Jakob at home (rjakob@duffy1.franken.de)
WWW : http://www.franken.de/users/duffy1/rjakob (KDE-Utils and CCS)
