From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200001052234.XAA14354@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] devfs...
In-Reply-To: <Pine.LNX.4.10.10001051729490.1995-100000@fuse.aethos.co.uk> from James Pattinson at "Jan 5, 2000  5:33: 7 pm"
Date: Wed, 5 Jan 2000 23:34:33 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: James Pattinson <jamesp@aethos.co.uk>
Cc: mge@ez-darmstadt.telekom.de, linux-lvm@msede.com

> Hi
> 
> I'm sure this is a FAQ but I can't find the answer anywhere.
> 
> I've am using LVM 0.8i on 2.2.14 with the latest devfs patch.

Sorry, this combination is not yet supported.
I still have to focus on devfs support 8*(

> My root
> filesystem in on an LV and I have an initrd that does a vgscan and a
> vgchange. However now I'm using devfs, vgscan dooesn't find any of my
> volume groups - maybe because vgscan doesn't know to look in /dev/scsi or
> whatever. Is there a patch to fix this?

vgscan (respectively the library routines involved) already
take care of devfs naming conventions.

Did you mount devfs in linuxrc before running vgscan?

Regards,
Heinz

-- 

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@EZ-Darmstadt.Telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
