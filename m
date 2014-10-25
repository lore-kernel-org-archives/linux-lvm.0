Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9PCoK9W030192
	for <linux-lvm@redhat.com>; Sat, 25 Oct 2014 08:50:20 -0400
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9PCoHnO022644
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Sat, 25 Oct 2014 08:50:18 -0400
Received: by mail-la0-f44.google.com with SMTP id hs14so3895317lab.17
	for <linux-lvm@redhat.com>; Sat, 25 Oct 2014 05:50:17 -0700 (PDT)
Received: from [192.168.192.99] (ip-94-113-161-170.net.upcbroadband.cz.
	[94.113.161.170])
	by mx.google.com with ESMTPSA id lv10sm2884273lac.7.2014.10.25.05.50.16
	for <linux-lvm@redhat.com>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 25 Oct 2014 05:50:16 -0700 (PDT)
Message-ID: <544B9C87.9050501@gmail.com>
Date: Sat, 25 Oct 2014 14:50:15 +0200
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
MIME-Version: 1.0
References: <544A8CA4.2030506@ib.pl>
In-Reply-To: <544A8CA4.2030506@ib.pl>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Virtualization and LVM data security
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 24.10.2014 v 19:30 IB Development Team napsal(a):
> Hello,
>
> Is there any way to make LVM2 tools wipe added/freed LV space or plans to add
> such functionality?
>

lvm.conf    devices { issue_discard = 1 }

See it that fits your need ?
Note: when using this option - vg/lvremove becomes 'irreversible'operation.

> When LVM based storage is used for guest virtual disks, it is possible that
> after resizing/snapshoting LV, disk data fragments from one guest will be
> visible to other guest, which may cause serious security problems if not wiped
> somehow; some pages with more info in this topic:
>
> http://blog.brightbox.co.uk/posts/secure-virtual-disk-deletion-is-your-data-safe
> http://brightbox.com/blog/2012/04/27/dirty-disks/
> http://docs.openstack.org/security-guide/content/ch046_data-residency.html
>
> Don't know LVM2 internals well but if there is no such functionality in LVM2
> now, maybe adding options like --wipe and --wipe-bandwidth (to allow one to
> control I/O load while wiping) for create/resize/remove/snapshot commands (and
> other maybe if such risk exist there) will be possible in future LVM versions
> to better meet security requirements in virtualized environments?

thin provisioning with zeroing enabled for thin-pool -Zy is likely better option.

There is no extra utility like  'fstrim' from empty space in volume group.

Note: you could obviously implement 'workaround' something like:

lvcreate -l100%FREE -n trim_me vg
blkdiscard /dev/vg/trim_me
(or if disk doesn't support TRIM -   dd if=/dev/zero of=/dev/vg/trim_me....)
lvremove vg/trim_me

Zdenek
