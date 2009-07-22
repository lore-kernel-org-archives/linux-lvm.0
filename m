Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n6MD0Q1t027576
	for <linux-lvm@redhat.com>; Wed, 22 Jul 2009 09:00:26 -0400
Subject: Re: [linux-lvm] Can't mount or run fdisk on an existing logical 
	volume, help!
From: "Bryn M. Reeves" <bmr@redhat.com>
In-Reply-To: <2473b43f0907212241q3c07e2d4tb160a95b154ad201@mail.gmail.com>
References: <2473b43f0907211255u7c116b1er9c3483bec2472cd@mail.gmail.com>
	<20090721195830.GA30206@esri.com> <4A66A30F.1020906@cox.net>
	<2473b43f0907212241q3c07e2d4tb160a95b154ad201@mail.gmail.com>
Date: Wed, 22 Jul 2009 14:06:30 +0100
Message-Id: <1248267990.14407.121.camel@breeves.fab.redhat.com>
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

On Tue, 2009-07-21 at 23:41 -0600, Adam Olsen wrote:
> On Tue, Jul 21, 2009 at 11:26 PM, Ron Johnson<ron.l.johnson@cox.net> wrote:
> > But doesn't fdisk only work on *physical* block devices?
> >
> > IOW, why fdisk an lv ?
> 
> No, it works on logical volumes too.  You still need to create
> partitions even on the logical ones.
> 

You don't "need" to, but you can if you want (although if you wish to
access the partitions on the host that has the volume group and logical
volumes visible you'll need to use kpartx since device-mapper devices
are not themselves partitionable in the kernel).

Regards,
Bryn.
