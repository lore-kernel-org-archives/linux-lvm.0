Received: from alatyr.brq.redhat.com (vpn1-4-12.ams2.redhat.com [10.36.4.12])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with
	ESMTP id s0G5gdt9021286
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 16 Jan 2014 00:42:41 -0500
Message-ID: <52D7714F.3080105@redhat.com>
Date: Thu, 16 Jan 2014 06:42:39 +0100
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <87zjmxzmga.fsf@red.mvo.lan>	<52D6B4AF.9010007@mglug.de>	<CADxRZqwmcmqjM6qV184HtD5-X4WRxExhchAo7twWHEt7_Vuf4w@mail.gmail.com>
	<084301cf125a$d4b4a980$7e1dfc80$@acm.org>
In-Reply-To: <084301cf125a$d4b4a980$7e1dfc80$@acm.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Identifying useable block devices
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

On 01/16/2014 02:32 AM, Paul B. Henson wrote:
>> Anatoly Pugachev
>> Sent: Wednesday, January 15, 2014 12:25 PM
>>
>>> the /dev/mapper/.. devices are for internal use only.
>>
>> If so, how come most commands use it (df, mount, findmnt, etc..) and
>> not /dev/vg/vol notation?
> 
> Because /dev/vg/vol is just a symlink to /dev/mapper/vg-vol, and mount
> dereferences it and uses the authoritative name when it actually mounts it.

This applies only if the symlinks/nodes are created directly with
libdevmapper - which is the old classical way. If udev is used to manage /dev
content for dm/lvm devices then the /dev/vg/vol is a symlink to /dev/dm-X
(also /dev/mapper/vg-vol is a symlink to /dev/dm-X). And dm-X is not a
stable name - it can be different across reboots and activation/deactivation
cycle (hence it's never used in scripts etc.). So you have to be very careful
when dereferencing symlinks.

As for mount, findmnt and other utilities from util-linux - they all use
one common code which can handle this situation (e.g. if you call
"findmnt /dev/vg/vol", it shows you /dev/mapper/vg-vol on output, not
the dm-X the /dev/vg/vol is referencing actually).
-- 
Peter
