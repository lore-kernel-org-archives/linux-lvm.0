Message-Id: <199902180911.AA29444@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Re: your mail
Date: Thu, 18 Feb 1999 10:12:12 MET
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com


> 
> Heinz:
> >LILO is able to deal with sectors scattered over a boot disk limited
> >by the 1024 cylinder BIOS rsstriction.
> >This implies no need for a special boot area _if_ we lay all
> >sectors LILO needs into the LV parts on that one disk.
> >Or did you mean that with voot area?
> >
> >If LILO would be able to deal with sectors scattered over many disks,
> >why to have a special boot area anyway?
> 

Daniel:
> Okay.  Let me make sure I understand this.  I think that what you're saying
> is that at this point, LILO should be able handle an LV like any other
> partition as far as booting is concerned?

No, only if the logical extents belonging to the boot logical volume
all are on _one_ bootable physical disk _and_ don't suffer from a 1024 cylinder
limit or anything similar.

LVM had to care about keeping up those restrictions.

> If so, then the real problem
> lies in getting the LVM turned on early enough that we can finish the boot
> process, correct?

Yes.
It would imply an extension to the LVM driver init stuff to
deal with such a kind of early activation of the boot volume group if
the driver is static bound into the kernel.


> And if that were the case, we should be able to treat
> the LVM like any other necessary kernel driver and install it with an
> initrd.

If we had a boot logical volume we could have a static LVM bound kernel
or an initrd solution.

> Sorry to repeat things, but I want to make sure that I have a firm
> understanding of what you're saying.

You are welcome!

It helps me to be more precise and others to join in 8*)


Regards,
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
