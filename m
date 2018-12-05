Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AADDC2C8F9
	for <linux-lvm@redhat.com>; Wed,  5 Dec 2018 15:01:29 +0000 (UTC)
Received: from mail.chelmska.waw.pl (mail.chelmska.waw.pl [80.55.22.106])
	by mx1.redhat.com (Postfix) with ESMTP id 1E4DE308A946
	for <linux-lvm@redhat.com>; Wed,  5 Dec 2018 15:01:23 +0000 (UTC)
Date: Wed, 5 Dec 2018 16:01:13 +0100
From: Marcin Wolcendorf <antymat+redhat@chelmska.waw.pl>
Message-ID: <20181205150113.ehnb33t7abnnrmfk@chelmska.waw.pl>
References: <20181205061938.vbkwk6ydnehacxml@chelmska.waw.pl>
	<bdb0d980-2e33-bba3-6d81-747d8143699d@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bdb0d980-2e33-bba3-6d81-747d8143699d@redhat.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] lvmcache writethrough synchronisation at system
 startup
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
To: linux-lvm@redhat.com

Hi,

Thanks for your reply!

On Wed, Dec 05, 2018 at 03:23:21PM +0100, Zdenek Kabelac wrote:
> Dne 05. 12. 18 v 7:19 Marcin Wolcendorf napsal(a):
> > My setup:
> > I have 2 mdraid devices: one 24T raid6, one 1T raid1, and one separate SSD. All
> > are LUKS-encrypted, SSD is partitioned into MBR boot partition, encrypted /boot
> > partition and a big encrypted partition for a PV. The encrypted block devices
> > (except /boot) are PVs in my VG. The 24T RAID holds the origin LV, the 1T RAID
> > is made into a cachepool.
> 
> Hi
> 
> I'd say in your case it's very important which version of kernel is in use,
> as there very couple fixes solving this issue in not too long history.

$ uname -a
Linux hal-9002 4.18.0-2-amd64 #1 SMP Debian 4.18.10-2 (2018-11-02) x86_64 GNU/Linux

I think it's not *that* old.
I searched for some info about this issue, but my google mojo left me and I
didn't find anything. Can you point me to some place - like commit or bug
description - where I could read about those fixes? 

> Secondary issue is - it's always good idea there is correct shutdown process
> instead of just 'power-off' althouhg in 'writethrough' case it should not be
> that big issue (but here applies the advice number one - use recent
> kernels).

OK, so how should the shutdown look like?

BR,
M.W.
-- 
Delta: We're Amtrak with wings.    -- David Letterman
