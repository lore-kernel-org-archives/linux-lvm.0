Message-Id: <199902180921.AA32120@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Re: your mail
Date: Thu, 18 Feb 1999 10:21:33 MET
In-Reply-To: <Pine.GHP.4.05.9902172219500.17992-100000@ixion.honeywell.com>; from "Shawn Leas" at Feb 17, 99 10:34 pm
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sleas@ixion.honeywell.com, linux-lvm@msede.com
Cc: mge@ts1.ez-darmstadt.telekom.de

> 
> On Thu, 18 Feb 1999, Heinz Mauelshagen wrote:
> 
> > This implies no need for a special boot area _if_ we lay all
> > sectors LILO needs into the LV parts on that one disk.
> > Or did you mean that with voot area?
> 

On Wed, 17 Feb 1999 22:34:49 -0600, Shawn Leas wrote:
> Mirrored configurations would work ok then I guess, right?

> This (mirroring) would be my main reason for root on an LV.

Yes, but LVM mirroring is future 8*(

If we will have mirroring support in the LVM some day it should not be the
big issue to activate a mirror at an early stage while initializing
the LVM driver (static bound into the kernel).


> By voot,
> what did you mean? (Sorry, it's probably in some M somewhere that I
> should be RTFing...)

Sorry, just an early morning hours typo coming much too late from work.

voot should have been boot (area).

RTFing beer on my bill ;*)

> 
> > If LILO would be able to deal with sectors scattered over many disks,
> > why to have a special boot area anyway?
> 
> Probably none. /me says KISS! ;P

As i said in another posting, LVM had to take care of LILO single disk
and 1024 cylinder limitations.

> 
> > HP-UX's 2nd stage bootstrap loader is only able to deal with a contiguous
> > HFS formated filesystem.
> > That's the reason they mark the boot/root LV contiguous.
> > Without tricks you are stuck with the initial created size.
> > AFAIK this hasn't been changed including 11.X.
> 
> Geez... Well, commercial eunices are driven my market demand and
> not quality or grace or programmer's pride. Luckily, there's you,
> Linus, Alan, Richard Gooch, SCT, HJ Lu, HPA, Andreas, and all the
> rest of the code wariors out there doing it better!
> 

Heinz
--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement C/S                             Deutsche Telekom AG
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
