Message-ID: <38752438.EB555FCA@osp.nl>
Date: Fri, 07 Jan 2000 00:24:40 +0100
From: Jos Visser <josv@osp.nl>
MIME-Version: 1.0
Subject: Re: [linux-lvm] devfs...
References: <Pine.LNX.4.10.10001052326530.1271-100000@fuse.aethos.co.uk>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: James Pattinson <jamesp@aethos.co.uk>
Cc: linux-lvm@msede.com

Hi,

Maybe I'm a bit silly, but can't vgscan recusively descend into the /dev
directory and try to followup on all block devices it sees there with
exception to the obvious to-be-left-outs?

++Jos

James Pattinson wrote:
> 
> OK I've been looking around - and it seems that the latest devfs doesn't
> have /dev/sd/*  - instead we have lots of weird things, like
> /dev/discs/disc0/* /dev/discs/disc1/* etc ... I've fixed my vgscan but
> adding
> 
>    static char *devdir[] = {
>       "/dev/ida",
>       "/dev/ide/hd",
>       "/dev/loop",
>       "/dev/md",
>       "/dev/rd",
>       "/dev/sd",
> +     "/dev/discs/disc0",
> +     "/dev/discs/disc1",
> +     "/dev/discs/disc2",
> +     "/dev/discs/disc3",
> +     "/dev/discs/disc4",
>       "/dev",
>       NULL
> 
> to lvm_dir_cache.c and similar to pv_check_name.c.
> 
> It works for me but hopefully devfs will settle down and not keep changing
> soon...
> 
> Thanks,
> 
> james
> 
> On Wed, 5 Jan 2000, Heinz Mauelshagen wrote:
> 
> > > Hi
> > >
> > > I'm sure this is a FAQ but I can't find the answer anywhere.
> > >
> > > I've am using LVM 0.8i on 2.2.14 with the latest devfs patch.
> >
> > Sorry, this combination is not yet supported.
> > I still have to focus on devfs support 8*(
> >
> > > My root
> > > filesystem in on an LV and I have an initrd that does a vgscan and a
> > > vgchange. However now I'm using devfs, vgscan dooesn't find any of my
> > > volume groups - maybe because vgscan doesn't know to look in /dev/scsi or
> > > whatever. Is there a patch to fix this?
> >
> > vgscan (respectively the library routines involved) already
> > take care of devfs naming conventions.
> >
> > Did you mount devfs in linuxrc before running vgscan?
> >
> > Regards,
> > Heinz
> >
> > --
> >
> > =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> >
> > Systemmanagement CS-TS                           T-Nova
> >                                                  Entwicklungszentrum Darmstadt
> > Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
> > Senior Systems Engineer                          Postfach 10 05 41
> >                                                  64205 Darmstadt
> > mge@EZ-Darmstadt.Telekom.de                      Germany
> >                                                  +49 6151 886-425
> >                                                           FAX-386
> > =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> >

-- 
"If anyone wants to be first, he must be the very last, and the servant
of all"
