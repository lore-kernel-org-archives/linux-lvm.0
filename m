Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n6MCx2rf027095
	for <linux-lvm@redhat.com>; Wed, 22 Jul 2009 08:59:02 -0400
Subject: Re: [linux-lvm] Can't mount or run fdisk on an existing
	logical	volume, help!
From: "Bryn M. Reeves" <bmr@redhat.com>
In-Reply-To: <4A66A30F.1020906@cox.net>
References: <2473b43f0907211255u7c116b1er9c3483bec2472cd@mail.gmail.com>
	<20090721195830.GA30206@esri.com>  <4A66A30F.1020906@cox.net>
Date: Wed, 22 Jul 2009 14:05:06 +0100
Message-Id: <1248267906.14407.118.camel@breeves.fab.redhat.com>
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

On Wed, 2009-07-22 at 00:26 -0500, Ron Johnson wrote:
> On 2009-07-21 14:58, Ray Van Dolson wrote:
> > On Tue, Jul 21, 2009 at 12:55:50PM -0700, Adam Olsen wrote:
> >> This pretty much sums it up:
> >>
> >> imgserv:/storage/# lvscan
> >>   ACTIVE            '/dev/storage/storage' [3.62 TB] inherit
> >> imgserv:/storage/# fdisk /dev/storage/storage
> >>
> 
> But doesn't fdisk only work on *physical* block devices?
> 
> IOW, why fdisk an lv ?
> 

You're using it as the backing store for a whole-disk image, e.g. for a
virtualised OS instance?

Bryn.
