Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8QNnmr03231
	for <linux-lvm@redhat.com>; Sun, 26 Sep 2004 19:49:48 -0400
Received: from nexredback-216-168-119-94.nexicom.net
	(nexredback-216-168-119-94.nexicom.net [216.168.119.94])
	by mx3.redhat.com (8.12.11/8.12.10) with SMTP id i8QNneJs000492
	for <linux-lvm@redhat.com>; Sun, 26 Sep 2004 19:49:42 -0400
Message-ID: <4157558E.7030409@mikebabcock.ca>
Date: Sun, 26 Sep 2004 19:49:34 -0400
From: "Michael T. Babcock" <mtb@mikebabcock.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] which files, which physical volumes?
References: <CB8795BC-0F0E-11D9-AF91-000A95730E92@spamaps.org>
	<4155EBA2.7020609@myself.gen.nz>
In-Reply-To: <4155EBA2.7020609@myself.gen.nz>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: steve@myself.gen.nz, LVM general discussion and development <linux-lvm@redhat.com>

Steve Wray wrote:

> Well then its bogus; the physical volume I am trying to pvmove has a 
> capacity of around 9G whereas the volume group of which it is a part 
> has a nice 42G free.
>
> So how does that work out to not enough extents?


Does the Volume Group in question have 42GB of unallocated extents, or 
42GB free on the allocated Logical Volumes?

If you had VG main with 60GB total containing LVs lv1 and lv2 each 20GB 
then you'd have 2GB unallocated on the VG.

If you want more unallocated space on e.g. /dev/hdc1 (a member of VG 
main) to move part of lv1 onto (from /dev/hda1), you'd have to do 
something like:

resize_filesystem /dev/main/lv2 (down to smaller size)
lvresize -L (new size) /dev/main/lv2 # to resize the logical volume 
using the space
pvmove -n /dev/main/lv2 /dev/hdc1 # to move as much as possible of lv2 
off this PV
pvmove -n /dev/main/lv1 /dev/hda1 /dev/hdc1

Does that make sense to you?
-- 
Michael T. Babcock
