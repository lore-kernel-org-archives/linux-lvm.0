Date: Wed, 17 Feb 1999 22:34:49 -0600 (CST)
From: Shawn Leas <sleas@ixion.honeywell.com>
Subject: Re: [linux-lvm] Re: your mail
In-Reply-To: <199902180316.AA16770@mailgate1b.telekom.de>
Message-Id: <Pine.GHP.4.05.9902172219500.17992-100000@ixion.honeywell.com>
Mime-Version: 1.0
Resent-To: linux-lvm@msede.com
Resent-Message-Id: <Pine.GHP.4.05.9902172236380.17992@ixion.honeywell.com>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Cc: mge@ts1.ez-darmstadt.telekom.de

On Thu, 18 Feb 1999, Heinz Mauelshagen wrote:

> This implies no need for a special boot area _if_ we lay all
> sectors LILO needs into the LV parts on that one disk.
> Or did you mean that with voot area?

Mirrored configurations would work ok then I guess, right? This
(mirroring) would be my main reason for root on an LV. By voot,
what did you mean? (Sorry, it's probably in some M somewhere that I
should be RTFing...)

> If LILO would be able to deal with sectors scattered over many disks,
> why to have a special boot area anyway?

Probably none. /me says KISS! ;P

> HP-UX's 2nd stage bootstrap loader is only able to deal with a contiguous
> HFS formated filesystem.
> That's the reason they mark the boot/root LV contiguous.
> Without tricks you are stuck with the initial created size.
> AFAIK this hasn't been changed including 11.X.

Geez... Well, commercial eunices are driven my market demand and
not quality or grace or programmer's pride. Luckily, there's you,
Linus, Alan, Richard Gooch, SCT, HJ Lu, HPA, Andreas, and all the
rest of the code wariors out there doing it better!

-Shawn
<=========== America Held Hostage ===========>
   Day 2219 for the poor and the middle class. 
   Day 2238 for the rich and the dead.
   703 days remaining in the Raw Deal.
<============================================> 
