Received: from [10.40.200.108] (ovpn-200-108.brq.redhat.com [10.40.200.108])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v02F66Y2029331
	for <linux-lvm@redhat.com>; Mon, 2 Jan 2017 10:06:06 -0500
References: <45f36905-feee-8fdf-8545-05d4937a95c1@knebb.de>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <71b437e8-4aca-0b97-ebab-ee577418db94@redhat.com>
Date: Mon, 2 Jan 2017 16:06:05 +0100
MIME-Version: 1.0
In-Reply-To: <45f36905-feee-8fdf-8545-05d4937a95c1@knebb.de>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM filter ignored?
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

Dne 29.12.2016 v 21:28 knebb@knebb.de napsal(a):
> Hi all,
>
> I am using LVM for several years but now I face an issue where I have no clue
> how to deal with.
>
> I want to have a VG on top of a drbd device (Distributed Replicated Block
> Device) which should not be an issue according to docs:
> https://www.drbd.org/en/doc/users-guide-83/s-lvm-drbd-as-pv
>
> Unfortunately I am always getting "duplicate device" errors as LVM recons a pv
> on /dev/sdb (underlying device for drbd) as well as on /dev/drbd0
>
> Now I tried to configure filters to match my setup. But it seems I do not
> understand the filter rules.
>
> I need to enable /dev/sda incl. all partitions. (for root)
> I need to disable /dev/sdb at all as it is the device for drbd!
> I need to enable /dev/drbd0 as the "real" PV.
> I can disable all others.
>
> So I tried:
> filter = [ "r|sdb.*/|","a|drbd0/|","a|.*/|" ]
>


Hi

Just check the 'comment' for filters in lvm.conf -
there is stated you should NOT mix  'r' & 'a' together
(there is even no need for this in 99.9999%)

So please focus on keeping things simple:

- either use plain list of rejects  'r'
- or set 'white-list' with all 'a'  finished with 'r .*'

Every other usage does require quite good understanding how
the devices are scanned and how many accessible paths for them
exists in today's /dev directory.

To to be exact in your case:

Use just:    [ "r|/dev/sdb|" ]

OR  (if you want to use just drdb0) :

[ "a|drbd0/|", "r|.*/|" ]

(eventually add more 'a' with more PV devices you have)


Regards

Zdenek
