Message-Id: <199902180316.AA16171@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Re: your mail
Date: Thu, 18 Feb 1999 4:17:18 MET
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com


> 
> On Wed, 17 Feb 1999, Michael Marxmeier wrote:
> 
> > Heinz wrote:
> > > /boot must be in a regular disk partition containing basic commands,
> > > device specials and LVM driver/commands.
> > > About 20-30MB should be sufficient to set this up.
> > 
> > IMO this could even be less if initrd is used.
> > We may need about 1-2 MB per kernel image + 1-2 MB for the initial
> > utilities (shell, vgchange, mount).
> 
> How about a special boot area inside a boot-configured
> root volume group? That way, lilo could be modified to run the
> second stage boot loader which could then be as heavyweight
> as anyone needs it.

LILO is able to deal with sectors scattered over a boot disk limited
by the 1024 cylinder BIOS rsstriction.
This implies no need for a special boot area _if_ we lay all
sectors LILO needs into the LV parts on that one disk.
Or did you mean that with voot area?

If LILO would be able to deal with sectors scattered over many disks,
why to have a special boot area anyway?

> 
> Isn't this sort of how hpux handles it?
> 


HP-UX's 2nd stage bootstrap loader is only able to deal with a contiguous
HFS formated filesystem.
That's the reason they mark the boot/root LV contiguous.
Without tricks you are stuck with the initial created size.
AFAIK this hasn't been changed including 11.X.


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
