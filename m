From: Steve_J_Brueggeman@notes.seagate.com
Message-ID: <88256871.006FAB7E.00@sv-gw1.stsv.seagate.com>
Date: Tue, 25 Jan 2000 14:19:21 -0600
Subject: RE: [linux-lvm] LVM seems to break tar and cp "stay-local" option
		s
Mime-Version: 1.0
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Jakma, Paul" <Paul.Jakma@compaq.com>
Cc: "'linux-lvm@msede.com'" <linux-lvm@msede.com>

Well, a quick of the tar source code reveals that they're using a stat(2) and
checking
parent_device != current_stat.st_dev

to determine if the filesystem has changed.

I just did a stat(1) on some files, (using LVM 0.7), and it always returns a
minor number of 0, no matter what Logical Volume the file I checked lives on.

Then again, I got the same result on files that reside on plain SCSI partitions
(I have root and /usr on /dev/sda1 and /dev/sda3 respectively)

System is RedHat 5.2, running linux-2.2.14 with LVM patches.

On a RedHat 6.0 system running linux-2.3.40 W/O LVM patches, /usr/bin/stat
returned expected device numbers.

I need to look into this a bit further.  More to come....

Steve Brueggeman






"Jakma, Paul" <Paul.Jakma@compaq.com> on 01/25/2000 01:07:10 PM

To:   "'Peter.Wuestefeld@resnova.de'" <Peter.Wuestefeld@resnova.de>
cc:   "'linux-lvm@msede.com'" <linux-lvm@msede.com> (bcc: Steve J Brueggeman)

Subject:  RE: [linux-lvm] LVM seems to break tar and cp "stay-local" option s



> Hi Paul,
>
> what about:
>
> cd /
> find . -print > /home/root/list
> vi list (edit to fit your wishes)
> tar -cvf- . -T /home/root/list | (cd /mynewroot; tar -xvf-)
>
> (you might want to check the tar option for "read list from file" - it
> seems to differ between distributions)
>

possible, and i did something similar in the end, eg  .... tar ... /bin /dev
/sbin ...

But the point is, why do these userland tools not recognise the boundary
between fs on ordinary device, and fs on lvm?

Also, another little issue, about partitioning:

if you change the partition table with fdisk, the kernel will not update
it's in-core idea of the partition layout if any of the partitions on that
disk are in-use, eg mounted fs or swap.

However, the kernel doesn't seem to recognise partitions that are active LVM
PV's as marking that disk in use. Ie i can repartition a disk in-use by LVM,
and the kernel does not seem to know that the disk is busy and hence will
commit the new partition table to memory.

I have a feeling LVM is forgetting to set some kind of flag that marks a
physical disk device as in-use. (and this might be related to the tar/cp
"stay-local" problem aswell). However i am not a kernel hacker... :)

regards,

Paul Jakma.
