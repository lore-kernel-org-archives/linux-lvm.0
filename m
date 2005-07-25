Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j6P2bWUJ007201
	for <linux-lvm@redhat.com>; Mon, 25 Jul 2005 03:37:32 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1DwsqS-0006VM-6h
	for linux-lvm@redhat.com; Mon, 25 Jul 2005 03:37:32 +0100
Date: Mon, 25 Jul 2005 03:37:32 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM / File descriptor .. left open / Snapshot-Problems
Message-ID: <20050725023732.GP23710@agk.surrey.redhat.com>
References: <200507231644.26202.Juergen.Vollmer@informatik-vollmer.de>
	<20050723152045.GH23710@agk.surrey.redhat.com>
	<200507242001.46066.Juergen.Vollmer@informatik-vollmer.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200507242001.46066.Juergen.Vollmer@informatik-vollmer.de>
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

> The majer difference has been between a success and a failure has been:
>   >   LV VGhome/lvm-snapshot in use: not removing
>   >   Couldn't deactivate new snapshot.
 
> after a non-successful lvcreate I get:
> Name             Maj Min Stat Open Targ Event  UUID
> VGhome-lvm--snapshot 253   1 L--w    0    1      0   
> 5mUudIrDe2N4x6x1D2T969Ux32kgljxXgbwKmGxoDE0SVIduDE3fboFFrMLFTqRB
> VGhome-LVhome    253   0 L--w    2    5      0 
> 5mUudIrDe2N4x6x1D2T969Ux32kgljxX00000000000000000000000000000000
 
Interesting.  [Close delayed?]
Would you retest with the latest lvm2 source code release from
sources.redhat.com/lvm2 ?

Alasdair
-- 
agk@redhat.com
