From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200003121930.UAA28702@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] vgcreate seg faults
Date: Sun, 12 Mar 2000 20:30:45 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

> I am trying to do a vgcreate, but I keep on getting a segmentation
> fault.
> 
> Doing a vgcreate -v shows that after vgcreate does:
> 
> vgcreate -- counting all existing volume groups
> Segmentation fault

Could you please send a "vgcreate -d" output of your attempt?

Thanks,
Heinz

> 
> I am using 2.2.14SMP kernel & 0.8i version of LVM.
> 
> Anyone have any ideas what could be causing this?
> 
> BTW, pvcreate works with no problem. pvdisplay shows the correct devices
> - /dev/sd[bc]1
> vgdisplay reports that there are no volumes (of course)
> 
> Thanks.
> 
> Goni Sarakinov
> Sarakinov Consulting, Inc.
> 
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
