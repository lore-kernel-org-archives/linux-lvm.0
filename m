Received: from [10.34.131.9] (dhcp131-9.brq.redhat.com [10.34.131.9])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3J8BRb9003723
	for <linux-lvm@redhat.com>; Tue, 19 Apr 2016 04:11:27 -0400
References: <CAO_L6qEOfivZ2PwJEzNFWnuECikZb8HqOX2Hn9DigMC62WSgqA@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <5715E82D.1070300@redhat.com>
Date: Tue, 19 Apr 2016 10:11:25 +0200
MIME-Version: 1.0
In-Reply-To: <CAO_L6qEOfivZ2PwJEzNFWnuECikZb8HqOX2Hn9DigMC62WSgqA@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Thin Pool Performance
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
To: linux-lvm@redhat.com

Dne 19.4.2016 v 03:05 shankha napsal(a):
> Hi,
> Please allow me to describe our setup.
>
> 1) 8 SSDS with a raid5 on top of it. Let us call the raid device : dev_raid5
> 2) We create a Volume Group on dev_raid5
> 3) We create a thin pool occupying 100% of the volume group.
>
> We performed some experiments.
>
> Our random write operations dropped  by half and there was significant
> reduction for
> other operations(sequential read, sequential write, random reads) as
> well compared to native raid5
>
> If you wish I can share the data with you.
>
> We then changed our configuration from one POOL to 4 POOLS and were able to
> get back to 80% of the performance (compared to native raid5).
>
> To us it seems that the lvm metadata operations are the bottleneck.
>
> Do you have any suggestions on how to get back the performance with lvm ?
>
> LVM version:     2.02.130(2)-RHEL7 (2015-12-01)
> Library version: 1.02.107-RHEL7 (2015-12-01)
>


Hi


Thanks for playing with thin-pool, however your report is largely incomplete.

We do not see you actual VG setup.

Please attach  'vgs/lvs'  i.e. thin-pool zeroing (if you don't need it keep it 
disabled), chunk size (use bigger chunks if you do not need snapshots), number 
of simultaneously active thin volumes in single thin-pool (running hundreds of 
loaded thinLV is going to loose battle on locking) , size of thin pool 
metadata LV -  is this LV located on separate device (you should not use RAID5 
with metatadata)
and what kind of workload you try on ?

Regards

Zdenek
