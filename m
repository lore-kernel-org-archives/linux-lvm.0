Return-Path: <vidalrod@informatik.tu-muenchen.de>
Message-ID: <3B1234CC.CC273F94@in.tum.de>
Date: Mon, 28 May 2001 13:21:48 +0200
From: David Vidal Rodriguez <vidalrod@informatik.tu-muenchen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Symbol not found when pvcreating...
References: <3B0E7C7C.E434D0AE@in.tum.de> <20010528113839.J26710@sistina.com>
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

>
> > Another --developer-- question:
> > I've looked at the LVM code and a structure called partition, #include'd
> > from <linux/genhd.h>, which contains the relevant information of a
> > partition. What I don't understand is how to get this information from
> > the kernel/drive (syscall, ioctl???). I'd be glad if somebody explained
> > that to me briefly.
>
> That's just needed for the generic disk interface.
> It doesn't make any sense to create a partition table on a logical volume.

What I meant is how to get the partition data, such as partition id, start, end,
etc.,  from a _real_ partition (you have get it in order to know if we are
initializing a PV on a partition marked as 0x8E). That sounds a bit off-topic, I
know...

Cheers,
--
  ------------------------------------------------------------------------
 David Vidal R. (vidalrod <at> in DOT tum DOT de)
 http://dvr.ismad.com
 "Ein Computer ohne Windows ist wie ein Fisch ohne Fahrrad."
