Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4M51O018866
	for <linux-lvm@redhat.com>; Sat, 22 May 2004 01:01:24 -0400
Received: from bucket.localnet (dsl-202-72-149-28.wa.westnet.com.au
	[202.72.149.28])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i4M51LGG009313
	for <linux-lvm@redhat.com>; Sat, 22 May 2004 01:01:23 -0400
Received: from [127.0.0.1] (6to4-localhost [127.0.0.1] (may be forged))
	by bucket.localnet (8.12.8/8.12.8) with ESMTP id i4M523mn009468
	for <linux-lvm@redhat.com>; Sat, 22 May 2004 13:02:04 +0800
Subject: Re: [linux-lvm] Snapshot support for LVM2?
From: Craig Ringer <craig@postnewspapers.com.au>
In-Reply-To: <20040517133351.L5945@homer.msp.redhat.com>
References: <8CCBDD5583C50E4196F012E79439B45C04C9A3EF@atl-ms1.megatrends.com>
	<20040517133351.L5945@homer.msp.redhat.com>
Message-Id: <1085202063.25224.17.camel@rasputin.localnet>
Mime-Version: 1.0
Date: Sat, 22 May 2004 13:01:04 +0800
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM <linux-lvm@redhat.com>

On Tue, 2004-05-18 at 02:33, Alasdair G Kergon wrote:

> For 2.6, there is not a stable snapshot release yet, but it's close.
> The snapshot support in
>   ftp://sources.redhat.com/pub/dm/patches/2.6-unstable/2.6.6-rc2/2.6.6-rc2-udm1.tar.bz2
> is the best available; there's still an issue with SMP.

Is there anywhere I could go for more detail on the status of the patch
- especially said SMP issue?

Craig Ringer
