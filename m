From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200001011813.TAA27045@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Preserving LVs
In-Reply-To: <Pine.LNX.4.10.9912301401320.5932-100000@prag.datech2.er.heitec.net> from Holger Rauch at "Dec 30, 1999  2: 6:37 pm"
Date: Sat, 1 Jan 2000 19:13:12 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Holger.Rauch@datech.heitec.de
Cc: linux-lvm@msede.com, mge@ez-darmstadt.telekom.de


Hapy new year Holger.

> Hi!
> 
> How can I preserve existing LVs (such as the ones used for the
> "/usr/local" and "/home" fs) over new installations?


If you don't touch the disks/partitions where the physical volumes forming
the volume group containing your logical volumes reside, just do
a vgscan after upgrading/reinstalling Linux (including LVM).

It just searches the disks to find all physical volumes, rebuilds the working
VGDA (Volume Group Descriptor Area) file in /etc/lvmtab.d/ and reinserts
the voulume grouo name in /etc/lvmtab.
"vgchange -ay" afterwards activates the VG(s) to
access the "/usr/local" etc. LVs.

> Sure, the kernel
> resides in "/boot", so I can keep that as well, but all the user mode
> tools are gone.
> >From time to time it's just necessary to do a complete installation from
> scratch to keep track with the latest Linux distributions (the "update"
> function doesn't always work), and I don't want to run into problems
> later. That's why I'm asking this question here.
> 

Hope the above information covers what you are searching for 8*)

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
