Date: Sun, 27 Aug 2000 09:19:34 -0400
From: Peter Green <pcg@gospelcom.net>
Subject: Re: [linux-lvm] LVM & NFS
Message-ID: <20000827091934.B15752@gospelcom.net>
References: <Pine.SOL.4.21.0008262033450.13945-100000@flora01.SLAC.Stanford.EDU>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.SOL.4.21.0008262033450.13945-100000@flora01.SLAC.Stanford.EDU>; from bulfon@SLAC.Stanford.EDU on Sat, Aug 26, 2000 at 08:47:38PM -0700
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cristina Bulfon <bulfon@SLAC.Stanford.EDU>
Cc: linux-lvm@msede.com, Shahram Rahatlou <rahatlou@SLAC.Stanford.EDU>

also sprach bulfon:
> 
> Hello,
> 
> I have a PC with RH 6.1 kernel 2.2.13, lvm kernel patch for 2.2.13, and
> lvm 0.8-pre02,10.1999.

I've done this with RH6.1, kernel 2.4.0-0.21 (from RedHat rawhide), lvm
0.8final.

> lvm works fine but when I tried to export a logical volume of 82GB, to
> another Linux machine I got:
> 
> mount: my_server:/my_logica_volume failed, reason given by
> server: Permission denied

Is this the *real* error message you're getting? Or did you sanitize the
error message? (My guess is that you sanitized it and your logical volume is
not really called ``my_logica_volume''.)

What does /etc/exports read? What do other log files say?

> I did the same NFS configuration with a small partition (not LVM) and it
> worked.
> 
> Any idea ? Is there any special configuration/setting to export LVM
> volumes via NFS?

Not that I've run into in my brief time of using LVM and NFS.

/pg
-- 
Peter Green : Gospel Communications Network, SysAdmin : pcg@gospelcom.net
---
panic("Foooooooood fight!");
(Panic message in the kernel.)
