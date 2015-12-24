Received: from [10.40.200.21] (ovpn-200-21.brq.redhat.com [10.40.200.21])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBO94R7Q021475
	for <linux-lvm@redhat.com>; Thu, 24 Dec 2015 04:04:28 -0500
References: <CAAYit8SM0KNv88TiOqD9mNBrk4DX3dG9AcRA9V9aZvAQdJt7vw@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <567BB51A.4070101@redhat.com>
Date: Thu, 24 Dec 2015 10:04:26 +0100
MIME-Version: 1.0
In-Reply-To: <CAAYit8SM0KNv88TiOqD9mNBrk4DX3dG9AcRA9V9aZvAQdJt7vw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Possible bug in expanding thinpool: lvextend
 doens't expand the top-level dm-linear device
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

Dne 23.12.2015 v 10:50 M.H. Tsai napsal(a):
> Hi All,
>
> I'm running LVM2.2.02.138 on Ubuntu 14.04.  When I try to expand a
> thinpool, I found that lvextend doesn't expand the top-level dm-linear
> device of the thinpool. The following are the reproduce steps
>
> # lvcreate vg1 --type thin-pool --thinpool tp1 --size 1g
> --poolmetadataspare=n -Zn
> # lvcreate vg1 --type thin --thinpool tp1 --virtualsize 100m --name lvol0
> # lvextend vg1/tp1 --size +100m
>
> After running lvextend, the table of vg1-tp1_tdata and vg1-tp1-tpool
> are expanded, but the dm-linear table of vg1-tp1 remains unchanged.
>
> I think that the function _lv_update_and_reload() erroneously operates
> on the holder of of tp1, that is, lvol0. This might be caused by
> commit fa64823, hence the subsequent actions runs on the lock_lv. The
> verbose output also shows that the tree_action() is running on lvol0,
> not tp1.
>
> Creating PRELOAD tree for vg1/lvol0.
> Creating SUSPEND tree for vg1/lvol0.
> Creating ACTIVATE tree for vg1/lvol0.
> Creating CLEAN tree for vg1/lvol0.
>
> Is that a bug?
>
>
> Thanks,
> Ming-Hung Tsai

Hi

Please check with commit cd8e95d9337207a8f87a6f68dc9b1db7e3828bbf included 
(2.02.139).

It's been known issue, the size of top-level 'fake' pool device is however not 
really important - no one should be actually using it and the size could have 
been artificial.

In fact - I do plan to rework this 'pool' device 'faking' to avoid need
of this 'extra' device - but it's 'a little bit' complex - so it will take
some time (I've even fix to correct the size of fake device - but then I've 
realized it would be actually much better without it)

So do not worry about the size of this device - the only device which does 
matter is -tpool.

Regards

Zdenek
