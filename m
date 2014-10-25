Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9PHcq9p012222
	for <linux-lvm@redhat.com>; Sat, 25 Oct 2014 13:38:52 -0400
Received: from ibsr002.ib.pl (ibsr002.ib.pl [164.40.241.6])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9PHcnig019169
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 25 Oct 2014 13:38:50 -0400
Message-ID: <544BE01F.9080503@ib.pl>
Date: Sat, 25 Oct 2014 19:38:39 +0200
From: IB Development Team <dev@ib.pl>
MIME-Version: 1.0
References: <544A8CA4.2030506@ib.pl> <544B9C87.9050501@gmail.com>
In-Reply-To: <544B9C87.9050501@gmail.com>
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
To: linux-lvm@redhat.com

W dniu 2014-10-25 o 14:50, Zdenek Kabelac pisze:

>> Is there any way to make LVM2 tools wipe added/freed LV space or plans to add
>> such functionality?

> lvm.conf    devices { issue_discard = 1 }
>
> See it that fits your need ?
> Note: when using this option - vg/lvremove becomes 'irreversible'operation.

issue_discard seems to require "underlying storage support" which is probably not available in 
common RAID/SATA/SAS/DRBD scenarios. Universal, open (source) solution would be better here probably 
(with hardware alternatives where possible).

>> When LVM based storage is used for guest virtual disks, it is possible that
>> after resizing/snapshoting LV, disk data fragments from one guest will be
>> visible to other guest, which may cause serious security problems if not wiped
>> somehow[...]

> thin provisioning with zeroing enabled for thin-pool -Zy is likely better option.

Sounds interesting. Is it stable solution for production systems? Does it perform not worse than 
"regular" preallocated LV?

> Note: you could obviously implement 'workaround' something like:
>
> lvcreate -l100%FREE -n trim_me vg
> blkdiscard /dev/vg/trim_me
> (or if disk doesn't support TRIM -   dd if=/dev/zero of=/dev/vg/trim_me....)
> lvremove vg/trim_me

If I understand correctly, in this scenario, guest data may still be present outside "cleaned" LV 
(i.e. data that was saved outside LV in snapshot LV during backups). If so - cleaning should be 
probably done transparently by LVM "software" layer, even without "underlying storage support".

Regards,
Pawel

IB Development Team
https://dev.ib.pl/
