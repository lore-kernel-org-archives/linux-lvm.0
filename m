Date: Wed, 5 Jan 2000 23:30:28 +0000 (GMT)
From: James Pattinson <jamesp@aethos.co.uk>
Subject: Re: [linux-lvm] devfs...
In-Reply-To: <200001052234.XAA14354@u9etz.ez-darmstadt.telekom.de>
Message-ID: <Pine.LNX.4.10.10001052326530.1271-100000@fuse.aethos.co.uk>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

OK I've been looking around - and it seems that the latest devfs doesn't
have /dev/sd/*  - instead we have lots of weird things, like
/dev/discs/disc0/* /dev/discs/disc1/* etc ... I've fixed my vgscan but
adding

   static char *devdir[] = {
      "/dev/ida",
      "/dev/ide/hd",
      "/dev/loop",
      "/dev/md",
      "/dev/rd",
      "/dev/sd",
+     "/dev/discs/disc0",
+     "/dev/discs/disc1",
+     "/dev/discs/disc2",
+     "/dev/discs/disc3",
+     "/dev/discs/disc4",
      "/dev",
      NULL

to lvm_dir_cache.c and similar to pv_check_name.c.

It works for me but hopefully devfs will settle down and not keep changing
soon...

Thanks,

james

On Wed, 5 Jan 2000, Heinz Mauelshagen wrote:

> > Hi
> > 
> > I'm sure this is a FAQ but I can't find the answer anywhere.
> > 
> > I've am using LVM 0.8i on 2.2.14 with the latest devfs patch.
> 
> Sorry, this combination is not yet supported.
> I still have to focus on devfs support 8*(
> 
> > My root
> > filesystem in on an LV and I have an initrd that does a vgscan and a
> > vgchange. However now I'm using devfs, vgscan dooesn't find any of my
> > volume groups - maybe because vgscan doesn't know to look in /dev/scsi or
> > whatever. Is there a patch to fix this?
> 
> vgscan (respectively the library routines involved) already
> take care of devfs naming conventions.
> 
> Did you mount devfs in linuxrc before running vgscan?
> 
> Regards,
> Heinz
> 
> -- 
> 
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> 
> Systemmanagement CS-TS                           T-Nova
>                                                  Entwicklungszentrum Darmstadt
> Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
> Senior Systems Engineer                          Postfach 10 05 41
>                                                  64205 Darmstadt
> mge@EZ-Darmstadt.Telekom.de                      Germany
>                                                  +49 6151 886-425
>                                                           FAX-386
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> 
