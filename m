Return-Path: <andewid@tnonline.net>
Message-ID: <3ABA91DE.29985185@tnonline.net>
Date: Fri, 23 Mar 2001 00:59:26 +0100
From: Anders Widman <andewid@tnonline.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM and fault tolerance
References: <Pine.LNX.4.30.0103211228450.8192-100000@flowers.house.larsshack.org>
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


Lars Kellogg-Stedman wrote:

> > Is there any possibility to add fault tolerance to LVM. I would like
> > to span several disks (of different sizes) and have fault tolerance to
> > it. Also, most important, is to be able to extend it with additional
> > disks without loosing data.
>
> Disclaimer: I've only recently started working with LVM under Linux.
>
> That said, I think that the general solution to fault tolerance is to
> combine LVM with either (a) the software RAID (md) subsystem, or (b)
> hardware RAID devices.
>

Well, it will have to be software RAID (limited budget)

>
> For example, you can create a number of md devices, using RAID1 or RAID5
> for fault tolerance, and then run pvcreate on them and manage them with
> lvm.
>
> I'm doing this right now with a 4-disk RAID5 array (3 disks + 1 hot
> spare), and it seems to be working just fine.
>

So, how is this actually working then. Let say I have this disk
configuration:

2x 40gb
2x 60gb
2x 80gb

I want maximum amount of diskspace available for storage. High speed is not
needed at all as this is mainly for storage and streaming low bitrate media.
Still, I need to be able to add additional disks, maybe two extra 80gb
disks. Would it be possible to keep ecc/crc data on one disk only, or stripe
it over all disks. Mirroring is to expensive in this sence too.

The problem with RAID-5 is that all disks need to be of the same size and
that it is not expandable (or is it?).

//Anders

>
> -- Lars
>
> --
> Lars Kellogg-Stedman <lars@larsshack.org>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
