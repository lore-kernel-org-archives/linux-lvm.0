Received: from [172.16.44.152] (friday.brisbane.redhat.com [172.16.44.152])
	by pobox.brisbane.redhat.com (8.13.1/8.13.1) with ESMTP id
	l4T7aVWb004709
	for <linux-lvm@redhat.com>; Tue, 29 May 2007 17:36:31 +1000
Message-ID: <465BD7FE.7080501@gmail.com>
Date: Tue, 29 May 2007 17:36:30 +1000
From: David Robinson <zxvdr.au@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM on a fake disk
References: <465BD163.4010904@cesca.es>
In-Reply-To: <465BD163.4010904@cesca.es>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Jordi Prats wrote:
> Hi all,
> How can I define voluem groups and logical volumes using a disk image on 
> a file that will be the root filesystem of another machine (not the one 
> that is defining them)?

The link below provides some details which may help. You can use losetup 
to associate a loop device with a regular file, then treat it as you 
would to a normal block device.

http://fedoraproject.org/wiki/Docs/Fedora7VirtQuickStart#head-498c8bbe74fd334cf63a4f1f918be74c726238dd

ie:

# create a sparse file to use as the block device in the guest
dd if=/dev/zero of=disk1.img seek=8096 bs=1M count=0

# setup a loopback device
losetup /dev/loop0 disk1.img

/dev/loop0 can now be used like a normal block device. If you partition 
the device thou it's slightly different - you need to use kpartx to make 
the partitions usable.

ie:

# create a partition table on the device (/boot cannot be on an LVM volume)
fdisk /dev/loop0

# make the partitions visible (they will appear as /dev/mapper/loop0pX, 
where X is a partition number)
kpartx -a /dev/loop0

# then you can use LVM on the devices
pvcreate /dev/mapper/loop0p1

The LVM's point of view there is nothing special that needs to be done 
other than scanning for the volume groups (vgscan) and 
activating/deactivating them (vgchange -ay <vg>/ vgchange -an <vg>).

Dave
