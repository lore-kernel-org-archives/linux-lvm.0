Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j7VHaGHQ012304
	for <linux-lvm@redhat.com>; Wed, 31 Aug 2005 18:36:16 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1EAWVU-0004NM-BV
	for linux-lvm@redhat.com; Wed, 31 Aug 2005 18:36:16 +0100
Date: Wed, 31 Aug 2005 18:36:16 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Mirror Capabilities on LVM2
Message-ID: <20050831173616.GF15141@agk.surrey.redhat.com>
References: <430F7668.6060500@fastenal.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <430F7668.6060500@fastenal.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

So far, you can just create a new mirror LV with (e.g.) lvcreate -m1.
(needs at least 3 PVs in the VG)

Eventually you'll be able to use lvconvert to convert an existing 
LV into a mirror.  Kernel-side improvements are on they way too
(device error-handling/read balancing).

> whether the ability to attach one lv to another and form a mirror and then split
> the mirrored lv into two distinct lvs that are both mountable (similar to a
> snapshot only a completely separate lv).  

We're planning to support that, yes.

Alasdair
-- 
agk@redhat.com
