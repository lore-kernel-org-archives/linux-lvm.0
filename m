Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l93IVhRC029260
	for <linux-lvm@redhat.com>; Wed, 3 Oct 2007 14:31:43 -0400
Received: from mailout1.imos.net (mailout1.imos.net [212.87.132.33])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l93IVaxq019690
	for <linux-lvm@redhat.com>; Wed, 3 Oct 2007 14:31:36 -0400
Received: from homer.imos.net (homer.imos.net [212.87.132.35])
	by mailout1.imos.net (8.14.1/8.14.1) with ESMTP id l93IVZuH031485
	for <linux-lvm@redhat.com>; Wed, 3 Oct 2007 20:31:35 +0200
Received: from lstyd.imos.net (lstyd.imos.net [212.87.130.122])
	by homer.imos.net (8.14.1/8.14.1) with ESMTP id l93IVZ1V015036
	for <linux-lvm@redhat.com>; Wed, 3 Oct 2007 20:31:35 +0200
Received: from [5.34.46.207] ([5.34.46.207])
	by lstyd.imos.net (8.14.0/8.13.7) with ESMTP id l93LK8Kh005442
	for <linux-lvm@redhat.com>; Wed, 3 Oct 2007 23:20:09 +0200
Message-ID: <4703E000.4050307@theendofthetunnel.de>
Date: Wed, 03 Oct 2007 20:31:28 +0200
From: Hannes Dorbath <light@theendofthetunnel.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Where to report bugs?
References: <4703B2CD.9050206@theendofthetunnel.de>
	<20071003171552.GL18444@agk.fab.redhat.com>
In-Reply-To: <20071003171552.GL18444@agk.fab.redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Alasdair G Kergon wrote:
> If you want to use bugzilla rather than this mailing list, file bugs that
> you find in upstream CVS against:
> 
>   Product Fedora
>   Version devel
>   Component lvm2

OK, if this ML is fine as well, I'll post it here:

Summary is that an active snapshot LV that loses its COW PV and is in
the same VG as the origin LV makes the origin LV disappear.

Example:
1. Create 2 PVs. Let's say /dev/sda and /dev/sdb
2. Create a VG with PV /dev/sda named data
3. Create a LV on VG data named origin
4. Extend VG data with PV /dev/sdb
5. Create a snapshot LV of LV origin, in VG data, on PV /dev/sdb, named snap
6. Remove /dev/sdb physically from the system (or disable in BIOS)
7. Reboot
8. Use vgreduce --removemissing to get VG data up again

LV origin is gone and can only be brought back from backup with
vgcfgrestore.

lvm 2.02.28
dev-mapper 1.02.22-r1
kernel 2.6.22-r8


-- 
Best regards,
Hannes Dorbath
