Message-Id: <199908230752.AA06046@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] LVM in stock kernel!?
Date: Mon, 23 Aug 1999 9:50:18 METDST
In-Reply-To: <19990822170713.A18493@ladystrange.bluehorizon.nl>; from "pamvdam@ramoth.xs4all.nl" at Aug 22, 99 5:07 pm
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pamvdam@ramoth.xs4all.nl
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com


Hi Pascal and all 8*)

> 
> On Sun, Aug 22, 1999 at 01:14:36PM +0000, Heinz Mauelshagen wrote:
> > 
> > Hi Pascal,
> > 
> > saw your mail today concerned with writes beyond the end of the device,
> > Have seen this a couple of times before 8*(
> > 
> > It was a kernel problem in the block i/o layer these days not forced
> > by the LVM but brougt to the surface by the heavy i/o load LVM striped 
> > LVs pushed to the system.
> 
> It was a problem.... Mmmm. In 2.3.14 it still is.
> 
> > 
> > Do you see the same trouble with LVM 0.7 in older kernel releases?
> 
> 2.3.13 and the 2.3.14-pre release gave the same problem. I don't
> know about earlier releases.

Oops, should have been more precise 8*)

I ment earlier versions because i've observed the 'beyond end of device'
behaviour with 2.3.13 by myself.

> Shall we bring this up to the linux kernel list?

Yes please.
Do it.

> The MD users should
> have noticed it too. Indeed there was VERY heavy I/O
> on the stripes.
> 
> BTW: 2.3.14 needed a little extra patch wrt the 2.3.13 LVM patch. Some-
> body will have ported it too, if not say so, and I'll mail you the diff.
> 
--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
