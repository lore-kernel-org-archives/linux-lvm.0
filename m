Subject: Re: [linux-lvm] Unable to create a physical volume on a whole disk
From: George Karaolides <george.karaolides@planitis.net>
Content-Transfer-Encoding: 7bit
Message-Id: <1049698519.3007.11.camel@ariel>
Mime-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Mon Apr  7 01:55:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: janvg@knoware.com

Hi Jan,

> I would like to create a pv on a whole disk but pvcreate gives me the
> message that there is a "partition table" on the disk.

> gw:/dev# pvcreate /dev/hdb
> pvcreate -- device "/dev/hdb" has a partition table

I think what teh message from pvcreate means is that this is a device
with a partition table, and pvceate isn't supposed to be used on such
devices with partition tables, but only on partition-like devices.  I
think pvcreate doesn't care whether the partition table is valid or not;
it only cares about the type of device.

I would suggest that, to use the space on a whole disk as a physical
volume, you try:

- Making just one partition of the whole disk space, with fdisk or other
partitioning tool of your choice; that will normally be /dev/hdb1
- Making a physical volume in that: pvcreate /dev/hdb1

-- 
Best regards,

|   George Karaolides                      Planitis Communications Ltd.,
|
|   tel:   +357 22 45 65 00              Office 102, 11 Florinis Street,
|
|   web:   www.planitis.net                             Nicosia CY 1065,
|
|   email: george.karaolides@planitis.net           Republic  of Cyprus.
|
