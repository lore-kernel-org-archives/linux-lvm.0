Message-ID: <15AD5D7936F8D21198240000F831776E3E815F@dboexc1.dbo.cpqcorp.net>
From: "Jakma, Paul" <Paul.Jakma@compaq.com>
Subject: RE: [linux-lvm] LVM seems to break tar and cp "stay-local" option
	s
Date: Tue, 25 Jan 2000 19:07:10 -0000
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'Peter.Wuestefeld@resnova.de'" <Peter.Wuestefeld@resnova.de>
Cc: "'linux-lvm@msede.com'" <linux-lvm@msede.com>

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
