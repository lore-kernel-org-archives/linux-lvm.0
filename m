Date: Wed, 5 Jan 2000 23:03:15 +0000 (GMT)
From: James Pattinson <jamesp@aethos.co.uk>
Subject: Re: [linux-lvm] devfs...
In-Reply-To: <200001052234.XAA14354@u9etz.ez-darmstadt.telekom.de>
Message-ID: <Pine.LNX.4.10.10001052300530.1224-100000@fuse.aethos.co.uk>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Cc: mge@ez-darmstadt.telekom.de, linux-lvm@msede.com

Well I have things working now - my linuxrc actually creates (mknod)
/dev/sd[a-d] with the correct device numbers. Then the vgscan works and
real root is mounted. This is all working fine. So I'm now not sure why it
wasn't working before, if LVM really does know about the devfs naming
conventions. I did an strace on vgscan and it didn't look at /dev/scsi or
/dev/discs or anything like that.

Cheers

James

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
