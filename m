Received: from [10.34.130.160] (dhcp130-160.brq.redhat.com [10.34.130.160])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8ACxjTQ000956
	for <linux-lvm@redhat.com>; Thu, 10 Sep 2015 08:59:46 -0400
References: <CAAxjCEwMqpAWFc+BBNW6bLUC7mkjkjdvFkRz66WnZEB__qW2dw@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <55F17EC1.6070903@redhat.com>
Date: Thu, 10 Sep 2015 14:59:45 +0200
MIME-Version: 1.0
In-Reply-To: <CAAxjCEwMqpAWFc+BBNW6bLUC7mkjkjdvFkRz66WnZEB__qW2dw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Strange dm-cache activity at startup
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

Dne 10.9.2015 v 11:30 Stefan Ring napsal(a):
> I have a fairly simple dm-cache setup with one PV on an HDD partition
> as the origin block device, and the cache LVs live on a partition on
> an SSD. The cache is in writethrough mode. Since I have no prior
> experience with this, I basically followed the lvmcache man page when
> creating this setup a few months ago.
>
> Every morning at startup, the system immediately starts prolonged
> activity on the devices involved in the cache setup. iostat shows
> reading activity from the cache device and constant write activity on
> the HDD. The HDD is fully utilized, and this goes on for more than an
> hour. After that, everything goes into what I would consider the
> "normal" state with only the IO activity going on that I actively
> throw at it.
>
> Is this normal/expected? What does it do? Why does it write back huge
> amounts of data to the HDD after each system start?
>
> Kernel is currently 3.17.8-200.fc20.x86_64 (Fedora)
> Userland has been upgraded to fc22 meanwhile

Please first try to use the latest kernel.
Kernel 3.17 is almost a year old.

Lots of optimizations went in meanwhile.
It's pointless to hunt already fixed bug.

Zdenek
