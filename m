Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n6MGhpBX010730
	for <linux-lvm@redhat.com>; Wed, 22 Jul 2009 12:43:51 -0400
Subject: Re: [linux-lvm] Can't mount or run fdisk on an existing logical 
	volume, help!
From: "Bryn M. Reeves" <bmr@redhat.com>
In-Reply-To: <4A673358.2050104@whgl.uni-frankfurt.de>
References: <2473b43f0907211255u7c116b1er9c3483bec2472cd@mail.gmail.com>
	<20090721195830.GA30206@esri.com> <4A66A30F.1020906@cox.net>
	<2473b43f0907212241q3c07e2d4tb160a95b154ad201@mail.gmail.com>
	<4A66A873.8050100@cox.net>
	<2473b43f0907212301g605fd40cw894d9266b9877b41@mail.gmail.com>
	<4A673358.2050104@whgl.uni-frankfurt.de>
Date: Wed, 22 Jul 2009 17:49:55 +0100
Message-Id: <1248281395.14407.167.camel@breeves.fab.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 2009-07-22 at 17:42 +0200, Sven Eschenberg wrote:
> All 'logical' block devices behave pretty much like physical ones.
> 
> So you are free to put partition tables on top of lvs or dmcrypt block 
> devices, you can aswell put each other on top of each other. It just 
> adds possible layers of failure and or overhead.

Not really; Linux block devices don't have to support partitioning in
the kernel and this is the case for device-mapper devices.

In practice it doesn't make much difference since device-mapper also
allows arbitrary regions of existing devices to be mapped into a new
device. With a tool that can read and interpret partition table metadata
this allows partitioning to be added in user space for those devices
that don't support it natively.

> Since LVs give you the opportunity to be created in whatever size you 
> wish, in many usage cases it is perfectly normal and straight forward to 
> put a filesystem ontop of an LV instead of a partition table.

Yes, this is the typical usage. Partitioning LVs is mostly of use when
you for some reason want to treat the LV as a whole-disk image for a
device that would normally be partitioned, e.g. an image for a
virtualised system.

Regards,
Bryn.
