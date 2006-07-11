Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6BHmuUM021430
	for <linux-lvm@redhat.com>; Tue, 11 Jul 2006 13:48:56 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6BHmnsY022729
	for <linux-lvm@redhat.com>; Tue, 11 Jul 2006 13:48:50 -0400
Message-ID: <44B3E470.90404@conterra.de>
Date: Tue, 11 Jul 2006 19:48:32 +0200
From: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Copying LVM from one system to another
References: <32F72C4D4D0EC8458CA5BFD76A6D6C680ACF39D0@gimli.xb.local>
	<1152551925.8360.52.camel@localhost.localdomain>
In-Reply-To: <1152551925.8360.52.camel@localhost.localdomain>
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
Content-Type: text/plain; charset="us-ascii"
To: mingz@ele.uri.edu, LVM general discussion and development <linux-lvm@redhat.com>

Ming Zhang wrote:
> if HW is the same, why not use ghost or alike software to do a clone?

Don't "clone" the LVM PVs if you ever want to connect both disks simultaneously.
For normal partitions this is fine, as those are identified by the device
name. So you can easily distinguish /dev/hda1 from /dev/hdc1.

LVM however identifies the different VG/LV/PV by its content, regardless of
where the disks are connected. If you connect your LVM disk to a different
cable or controller, don't worry, it will be found automatically. If two disks,
however, look exactly the same, LVM gets confused. 

Instead you should connect both disk:

arrange booting from <newdisk>,
lvm from <olddisk> should still work, even if connected differently.

pvcreate <new disk>
vgextend <new disk>
pvmove <olddisk>
vgreduce <olddisk>

to migrate all LVM content to the new disk.

Dieter.
