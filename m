Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i83CnCJ0019373
	for <linux-lvm@redhat.com>; Fri, 3 Sep 2004 13:49:12 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1C3DV7-0002AD-Ck
	for linux-lvm@redhat.com; Fri, 03 Sep 2004 13:49:09 +0100
Date: Fri, 3 Sep 2004 13:49:09 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Re: partition strategy
Message-ID: <20040903124909.GN6264@agk.surrey.redhat.com>
References: <412CE781.9000409@m-cam.com> <41363AA0.5030107@m-cam.com>
	<20040902174230.GG6264@agk.surrey.redhat.com>
	<4137A15E.30208@m-cam.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4137A15E.30208@m-cam.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

> >>>Is it better to create 3 partitions 2 x230G + 1G 
> >>>Is it better to create 2 paritions 230G and 231G, put both in a vg, 

> >ie the first option.  
I meant the second option:-)

> Could you, please tell me what I am doing wrong? TIA.
 
> casals:~# lvextend -l +134 /dev/vg00/lvol0 /dev/hdc3
>  Using stripesize of last segment 8KB
>  Insufficient allocatable extents suitable for parallel use for logical 
> volume lvol0: 118816 required

If you don't specify the stripe settings, lvextend uses whatever
the last segment of the LV you're extending uses i.e. 2 stripes in 
this case.  So you need to specify -i1 to add a new segment with
just one stripe.

Alasdair
-- 
agk@redhat.com
