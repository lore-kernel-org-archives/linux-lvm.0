Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o1PGBqfA005752
	for <linux-lvm@redhat.com>; Thu, 25 Feb 2010 11:11:52 -0500
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o1PGBcJp020711
	for <linux-lvm@redhat.com>; Thu, 25 Feb 2010 11:11:38 -0500
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e32.co.us.ibm.com (8.14.3/8.13.1) with ESMTP id o1PG5DNa023160
	for <linux-lvm@redhat.com>; Thu, 25 Feb 2010 09:05:13 -0700
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	o1PGBQpw095936
	for <linux-lvm@redhat.com>; Thu, 25 Feb 2010 09:11:27 -0700
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.14.3/8.13.1/NCO v10.0 AVout) with ESMTP
	id o1PGBD3J002042
	for <linux-lvm@redhat.com>; Thu, 25 Feb 2010 09:11:14 -0700
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d03av01.boulder.ibm.com (8.14.3/8.13.1/NCO v10.0 AVin) with ESMTP id
	o1PGBDvS001998
	for <linux-lvm@redhat.com>; Thu, 25 Feb 2010 09:11:13 -0700
Date: Thu, 25 Feb 2010 08:11:12 -0800
From: malahal@us.ibm.com
Message-ID: <20100225161112.GA14691@us.ibm.com>
References: <ece181eaa6b6652da66cb42699955e87.squirrel@fela.liber4e.com>
	<20100224185530.GA22199@us.ibm.com>
	<cbc809246d15e30c4dd15df41e2889b9.squirrel@fela.liber4e.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cbc809246d15e30c4dd15df41e2889b9.squirrel@fela.liber4e.com>
Subject: Re: [linux-lvm] Mirror fail/recover test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

jose nuno neto [jose.neto@liber4e.com] wrote:
> Much thanks for your interest
> im putting more info below
> 
> > jose nuno neto [jose.neto@liber4e.com] wrote:
> >> Hi
> >>
> >> I'm trying to test the failure of a SAN Mirrored Lv, and the recover and
> >> check for data lost.
> >>
> >> Im runing RedHat 5.4
> >> 2.6.18-164.2.1.el5
> >> lvm2-2.02.46-8.el5_4.1
> 
> multipath -l -v2 | grep -A 7 3600a0b800048f9b200000c2b4b5980b7
> mpath12 (3600a0b800048f9b200000c2b4b5980b7) dm-8 SUN,CSM200_R
> [size=52G][features=1 queue_if_no_path][hwhandler=1 rdac][rw]
> \_ round-robin 0 [prio=0][enabled]
>  \_ 7:0:1:1  sdo  8:224  [active][undef]
>  \_ 9:0:1:1  sdq  65:0   [active][undef]
> \_ round-robin 0 [prio=0][enabled]
>  \_ 7:0:0:1  sdd  8:48   [active][undef]
>  \_ 9:0:0:1  sdf  8:80   [active][undef]
> 
> Before UnPluging
> dmsetup status mpath12
> 0 109051904 multipath 2 0 0 0 2 1 E 0 2 0 8:224 A 0 65:0 A 0 E 0 2 0 8:48
> A 0 8:80 A 0
> 
> echo offline > /sys/block/sdd/device/state
> echo offline > /sys/block/sdo/device/state
> echo offline > /sys/block/sdq/device/state
> echo offline > /sys/block/sdf/device/state
> 
> dmsetup status mpath12
> 0 109051904 multipath 2 0 0 0 2 1 E 0 2 0 8:224 F 1 65:0 F 1 E 0 2 0 8:48
> F 1 8:80 F 1

I was actually asking for "dmsetup status <mirror-device>" rather than
multipath device. I didn't know that you were using multipath devices!!!

Anyway, looks like you have mpath12 that probably queues I/O on path
failures rather than failing them back to upper layers. In other words,
if you were to run "dd" or any other app to mpath12, it would hang too.

mpath12 seems to keep the request and forever wait for the paths to
become available again in your case. If you really want it to fail,
configure your multipath accordingly.

Thanks, Malahal.
PS: "features=1 queue_if_no_path" in your 'multipath -ll' output is the
source of error here...
