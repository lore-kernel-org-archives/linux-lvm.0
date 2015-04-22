Received: from [10.34.131.89] (dhcp131-89.brq.redhat.com [10.34.131.89])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t3M9m2IS004564
	for <linux-lvm@redhat.com>; Wed, 22 Apr 2015 05:48:02 -0400
Message-ID: <55376E51.2040400@redhat.com>
Date: Wed, 22 Apr 2015 11:48:01 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <loom.20150421T105704-216@post.gmane.org>
In-Reply-To: <loom.20150421T105704-216@post.gmane.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] persistent value of tunables for dmsetup
	--target=cache ?
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

Dne 21.4.2015 v 10:58 nikhil napsal(a):
> Hello,
>
> how do I ensure that the tunable (for eg. dmsetup message vg02-jetcache_lv 0
> write_promote_adjustment 0) will remain the same value even after reboot?
>
> Seems like the tunables values reset to earlier values upon reboot of the
> machine.
>
> Help! :)


By using them, when you create/load  dm table for your cache target.

Zdenek
