Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i768XPa13721
	for <linux-lvm@redhat.com>; Fri, 6 Aug 2004 04:33:25 -0400
Received: from grassmarket.ucs.ed.ac.uk (grassmarket.ucs.ed.ac.uk
	[129.215.166.64])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i768XEXn022483
	for <linux-lvm@redhat.com>; Fri, 6 Aug 2004 04:33:14 -0400
Received: from grassmarket.ucs.ed.ac.uk (localhost [127.0.0.1])
	by grassmarket.ucs.ed.ac.uk (8.12.10/8.12.10) with ESMTP id
	i768XDcn013126
	for <linux-lvm@redhat.com>; Fri, 6 Aug 2004 09:33:13 +0100 (BST)
Received: (from nobody@localhost)
	by grassmarket.ucs.ed.ac.uk (8.12.10/8.12.9/Submit) id i768XDuU013124
	for linux-lvm@redhat.com; Fri, 6 Aug 2004 09:33:13 +0100 (BST)
Message-ID: <1091781193.4113424926227@sms.ed.ac.uk>
Date: Fri,  6 Aug 2004 09:33:13 +0100
From: Rupert Hair <rupert.hair@ntlworld.com>
Subject: Re: [linux-lvm] ext3 on LVM2 on RAID 5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi Peter & other LVM people,

Thanks for your reply.  I have had the array setup for a few days now and i=
ts
already half full :-).  Luckily I decided on the same chunk size, PE size a=
nd
stride values as you have recommended.  I'm very pleased with the performan=
ce
and the CPU utilisation even under full speed write to the RAID 5 is nice a=
nd
low.  I would recommend this setup to anyone who wants the best =EF=BF=BD:G=
B ratio,
redundancy and the ability to add more drives later.

One thing that I'm still wondering about is does the PE size effect perform=
ance?
 I presumed that, as its only a logical devision of the data (i.e. it does =
not
control striping of the data), it would have no effect on the performance.



Quoting "Peter A. Castro" <doctor@fruitbat.org>:

> I run this kind of setup with 6 SCSI drives and 4 SATA drives and have
> not had any problems.  The LVM and RAID how-to's are pretty complete as
> to how this all hangs together.  Basically the stride is your chunk-size
> divided by your filesystem block size.
Are there any howtos specifically for LVM on RAID?  I cobbled my setup toge=
ther
with help from the Software RAID howto
(http://www.tldp.org/HOWTO/Software-RAID-HOWTO-5.html) and a few other rand=
om
docs found using google.

> Eg: I have a chunk-size of 128k, and a physical extent size of 16M.  I
> use a 4k block size in mke2fs and thus the stride is 128k/4k =3D 32.  I'd
> suggest you use mdadm instead of the raidtools as it's a heck of a lot
> easier to use.
>
> $ mdadm --create /dev/md0 --chunk=3D128 --level=3D5  --raid-devices=3D6 \
>   /dev/sdb1 /dev/sdc1 /dev/sdd1 /dev/sde1 /dev/sdf1 /dev/sdg1
> $ vgscan    # assumes you've setup proper mask to look only at /dev/md?
> $ pvcreate /dev/md0
> $ vgcreate --autobackup y --physicalextentsize 16M vg0 /dev/md0
> $ lvcreate --autobackup y --size 50G --name worklv vg0
> $ mke2fs -b 4096 -f 4096 -j -O sparse_super -R stride=3D32 /dev/vg0/worklv
Thats a great guide.  Thanks.

> I see from below you are using both PATA and SATA.  You might want to
> partition these drives into separate raid arrays (ie: all PATA in one,
> all SATA in another).  The PATA will be slower than the SATA.  If you mix
> the drives in the array your performance might suffer.  I'd suggest you
> try mixing and matching and then run some disk performance tests on the
> raw raid partitions before deciding on a final configuration.  Hint: you
> don't need to create huge arrays for these tests.  Use smaller disk
> partitions for your tests to reduce the amount of time spent on building
> the test arrays.  When you've come up with the best performing
> combination, then you can re-create the partitions full size.
Are the PATA only slower when you have two of them on one channel?  In my s=
etup
the PATA and SATA disks are the same models (the PATA are a bit older thoug=
h).
As far as I understand it no disks available at the moment are fast enough =
to
out pace an ATA100 or 133 PATA controller so the SATA shouldn't be faster j=
ust
because they have ATA150.

Thanks again to Peter and everyone who has contributed to LVM,

Rupert
