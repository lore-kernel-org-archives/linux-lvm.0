From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200004271314.PAA09502@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Protection of used scsi disks by LVM
Date: Thu, 27 Apr 2000 15:14:44 +0200 (MEST)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com


Hi Sergey.

> 
> Hello,
> 
> I have a question : 
> Why does LVM not protect the scsi devices which are used for volumes ?
> 

Because it can't.
The only way would be to remove then underlying devices from the genhd
in the kernel, which obviously is not a good idea(tm) ;-{)

> I can easily go to /dev/sda1 for example, and erase everything on it.

These are the UNIX/Linux semantics.

If one has the file/device special permission one can do every kind
of stupid things which come to ones mind.

> 
> Of course it is a stupid thing to do, but there is a minimal requirement on
> protection, isn't it ?
> 

Yes, you are right.
but IMHO there's no way today with the existing kernel implementation.

> I cannot think about the way to protect it, because LVM uses those disks as
> every other programs.
> 
> Any ideas ?
> 

Regards,
Heinz

-- 

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement TS                              T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@EZ-Darmstadt.Telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
