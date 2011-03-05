Received: from [10.36.4.136] (vpn1-4-136.ams2.redhat.com [10.36.4.136])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p25FBq4s024708
	for <linux-lvm@redhat.com>; Sat, 5 Mar 2011 10:11:52 -0500
Message-ID: <4D7252B8.7040600@redhat.com>
Date: Sat, 05 Mar 2011 16:11:52 +0100
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
References: <AANLkTimg-wAqrWxGaj-HSFYazPV-GT7kWKfdYGst9tM3@mail.gmail.com>	<Pine.LNX.4.64.1103031516340.14941@bmsred.bmsi.com>	<1299228115.13997.37.camel@localhost>
	<AANLkTinATFdAZ6fsrE_vkfJ6pMrF6v0xfN4hu8sqEP0N@mail.gmail.com>
In-Reply-To: <AANLkTinATFdAZ6fsrE_vkfJ6pMrF6v0xfN4hu8sqEP0N@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Resizing underlying LVM partition after cloning to
 bigger disk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 03/05/2011 03:13 AM, Scott Arthur wrote:
> I've been playing around on a test system with a similar partition
> table.
> 
> Have successfully resized 2 to fill the disk extent. Partition 5
> however proves to be problematic.
> 
> Using fdisk, I tried deleting 2 and 5 and recreating based on
> sectors, but couldn't recreate 5 on the same starting sector, it told
> me I was out of bounds.
> 
> I then tried the same thing with fdisk but with cylinders instead and
> both partitions were recreated okay, but destroyed all my LVM stuff.
> 
> I can happily resize 2 using parted but parted wont resize 5.

If the start of partition moves (even by 1 sector) LVM metadata will
not be recognised. So you must manipulate only with partition end.
Cylinders can round up the start of partition so this can easily happen.

fdisk in sector mode (fdisk -u) should allow that, if it is not possible,
I guess it is bug (be sure to use new fdisk from util-linux[-ng], there
was a lot of bugfixes in last years).
(and partition 5 is extended partition so you probably need to resize
"parent" partion before it as well.)

Anyway, from the LVM point of view you can do both - either move partition
end to enlarge disk (and inform LVM about it using pvresize afterward)
or simply add new partition to VG.
(The problems are usualy outside of LVM scope - like 2G partition limitation,
problems to change open partition size in kernel etc.)

Just avoid moving the start sector of PV - this will not work.

Milan
