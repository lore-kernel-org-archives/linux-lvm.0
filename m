From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200001300032.BAA04349@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Trouble 2.2.14 setup - unresolved symbol lvm_map_ptr (My first time)
In-Reply-To: <3893853C.F247822A@alwan.com> from Chris Anderson at "Jan 29, 2000  6:26:37 pm"
Date: Sun, 30 Jan 2000 01:32:08 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Chris Anderson <chris@alwan.com>
Cc: mge@ez-darmstadt.telekom.de, linux-lvm@msede.com


Please have a look at the BUGS file on the <ftp://linux.msede.com/lvm/v0.8>
as well. The fixes in there should help.

Heinz


> Started from scratch (new kernel code and lvm patch) and got it to work.
> At least that part.  Now I am getting a core dump.  I will work this out
> too I guess.
> 
> I use veritas every other day in my job as a DBA and it works real nice.
> I wish the install for LVM was as easy.  If this stuff does get into the
> common source I hope others get it running much easier then I.  Is this
> stuff ready for prime time? (Doc, programs and all)
> 
> My current state is below:
> 
> $ vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- no volume groups found
> 
> $ pvcreate /dev/hda8
> pvcreate -- reinitializing physical volume
> pvcreate -- physical volume "/dev/hda8" successfully created
> 
> $ vgcreate main_vg /dev/hda8
> Segmentation fault (core dumped)
> 
> 
> > -------- Original Message --------
> > Date: Sat, 29 Jan 2000 13:41:49 -0600
> > Resent-Date: Sat, 29 Jan 2000 21:14:28 MEZ
> > From: Chris Anderson <chris@alwan.com>
> > Organization: Alwan, Inc.
> > Subject: Trouble 2.2.14 setup - unresolved symbol lvm_map_ptr (My
> > first time)
> >
> > Ok this is my first try at LVM and I did not get it working.
> >
> > I ran the 2.2.13 patch on the linux source and it seemed to compile
> > file.  I want to setup LVM as a module so I set the flag in the config
> > to module.  Do all the compiles then after a reboot i run the below
> > commands.  Note I did poke around in the doc and found nothing.
> >
> > $ depmod -a
> > /lib/modules/2.2.14/block/lvm.o: unresolved symbol(s)
> >
> > $ modprobe lvm
> > /lib/modules/2.2.14/block/lvm.o: unresolved symbol lvm_map_ptr
> >
> > It looks like something is wrong.  Any help please?  I hope this is a
> > easy one.
> >
> > chris@alwan.com
Content-Description: S/MIME Cryptographic Signature

[Attachment, skipping...]


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
