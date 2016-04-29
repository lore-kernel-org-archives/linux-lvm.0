Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3T8slqx023641
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 29 Apr 2016 04:54:48 -0400
Received: from kenny.mojhosting.sk (mail-o.oneemedia.com [92.240.244.203])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B975381F03
	for <linux-lvm@redhat.com>; Fri, 29 Apr 2016 08:54:46 +0000 (UTC)
Date: Fri, 29 Apr 2016 10:44:20 +0200
From: Marek Podmaka <marki@marki-online.net>
Message-ID: <1009262601.20160429104420@marki-online.net>
In-Reply-To: <75be777705b8abc643a67ca9b90d7b1b@dds.nl>
References: <75be777705b8abc643a67ca9b90d7b1b@dds.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] about the lying nature of thin
Reply-To: Marek Podmaka <marki@marki-online.net>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: Xen <list@xenhideout.nl>
Cc: Linux lvm <linux-lvm@redhat.com>

Hello Xen,

Friday, April 29, 2016, 0:37:23, you wrote:

> In practical matters a thin volume only starts to lie when "real space"
> < "virtual space" -- a condition you are normally trying to avoid.

> Thin pools do not lie by default. They lie when they cannot fulfill
> their obligations, and this is precisely the reason for the idea I 
> suggested: to stop the lie, to be honest.

I would say that thin provisioning is designed to lie about the
available space. This is what it was invented for. As long as the used
space (not virtual space) is not greater then real space, everything
is ok. Your analogy with customers still applies and whole IT business
is based on it (over-provisioning home internet connection speed,
"guaranteed" webhosting disk space). It seems to me that disk space
was the last thing to get over- (or thin-) provisioned :)

Now I'm not sure what your use-case for thin pools is.

I don't see it much useful if the presented space is smaller than
available physical space. In that case I can just use plain LVM with
PV/VG/LV. For snaphosts you don't care much as if the snapshot
overfills, it just becomes invalid, but won't influence the original
LV.

But their use case is to simplify the complexity of adding storage.
Traditionally you need to add new physical disks to the storage /
server, add it to LVM as new PV, add this PV to VG, extend LV and
finally extend filesystem. Usually the storage part and server (LVM)
part is done by different people / teams. By using thinp, you create
big enough VG, LV and filesystem. Then as it is needed you just add
physical disks and you're done.

Another benefit is disk space saving. Traditionally you need to have
some reserve as free space in each filesystem for growth. With many
filesystems you just wasted a lot of space. With thinp, this free
space is "shared".

And regarding your other mail about presenting parts / chunks of
blocks from block layer... This is what device mapper (and LVM built
on top of it) does - it takes many parts of many block devices and
creates new linear block device out of them (whether it is stripped
LV, mirrored LV, dm-crypt or just concatenation of 2 disks).

-- 
  bYE, Marki
