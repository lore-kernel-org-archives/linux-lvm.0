Message-Id: <199908221116.AA20083@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] LVM in stock kernel!?
Date: Sun, 22 Aug 1999 13:14:36 METDST
In-Reply-To: <19990822081621.A13324@ladystrange.bluehorizon.nl>; from "pamvdam@ramoth.xs4all.nl" at Aug 22, 99 8:16 am
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pamvdam@ramoth.xs4all.nl
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com


Hi Pascal,

saw your mail today concerned with writes beyond the end of the device,
Have seen this a couple of times before 8*(

It was a kernel problem in the block i/o layer these days not forced
by the LVM but brougt to the surface by the heavy i/o load LVM striped 
LVs pushed to the system.

Do you see the same trouble with LVM 0.7 in older kernel releases?

Regards,
Heinz

> 
> On Sat, Aug 21, 1999 at 10:39:30PM +0000, Heinz Mauelshagen wrote:
> > 
> > Hi everybody!
> > 
> > Dirk Hohndel told me last week, that Linus wants to wait before putting LVM
> > into the stock kernel to see if enough people are interested to have this.
> > 
> > Because a feature freeze for 2.4 is already comming up, i hereby kindly ask 
> > everybody to convince Linus to put the LVM into the stock kernel.
> > 
> > Send him mails please 8*)
> 
> Will do so, but there might be still problems with LVM and the 2.3.14+
> kernels. The bad_lvm_ptr and the Oops: lvm_request messages.
> 
> Now I'll bring my LVM wishes to Linus.
> 
> Best regards,
> 
> 	Pascal
> 
> 
> > 
> > Thanks in advance.
> > 
> > Kind regards,
> > Heinz
> > --
> > 
> > =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> > 
> > Systemmanagement CS-TS                           T-Nova
> >                                                  Entwicklungszentrum Darmstadt
> > Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
> > Senior Systems Engineer                          Postfach 10 05 41
> >                                                  64205 Darmstadt
> > mge@ez-darmstadt.telekom.de                      Germany
> >                                                  +49 6151 886-425
> >                                                           FAX-386
> > =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
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
