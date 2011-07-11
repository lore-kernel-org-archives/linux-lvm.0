Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p6B2Rm1Y004918
	for <linux-lvm@redhat.com>; Sun, 10 Jul 2011 22:27:48 -0400
Received: from Ishtar.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6B2Rmkm030678
	for <linux-lvm@redhat.com>; Sun, 10 Jul 2011 22:27:48 -0400
Received: from [192.168.3.140] (Athenae2 [192.168.3.140])
	by Ishtar.tlinx.org (8.14.4/8.14.4/SuSE Linux 0.8) with ESMTP id
	p6B2RiHK014262
	for <linux-lvm@redhat.com>; Sun, 10 Jul 2011 19:27:46 -0700
Message-ID: <4E1A5FA0.9080505@tlinx.org>
Date: Sun, 10 Jul 2011 19:27:44 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
References: <4E1A526F.9090700@tlinx.org>
	<20110711021630.GC7857@agk-dp.fab.redhat.com>
In-Reply-To: <20110711021630.GC7857@agk-dp.fab.redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Inconsistent naming...?
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



Alasdair G Kergon wrote:
> The canonical name to use is /dev/<vgname>/<lvname>.
> That's been inherited from the original LVM1 code and has never changed.
> That's the only form of the name to use to maintain compatibility.
>   
---
    Those are the format's i've used (and am using), ... just that the 
output from
mount (or in /proc/mount) messed up...
