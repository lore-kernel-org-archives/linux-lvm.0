Return-Path: <lars@larsshack.org>
Date: Wed, 21 Mar 2001 12:33:51 -0500 (EST)
From: Lars Kellogg-Stedman <lars@larsshack.org>
Subject: Re: [linux-lvm] LVM and fault tolerance
In-Reply-To: <3AB7C41F.F1F35EDE@tnonline.net>
Message-ID: <Pine.LNX.4.30.0103211228450.8192-100000@flowers.house.larsshack.org>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

> Is there any possibility to add fault tolerance to LVM. I would like
> to span several disks (of different sizes) and have fault tolerance to
> it. Also, most important, is to be able to extend it with additional
> disks without loosing data.

Disclaimer: I've only recently started working with LVM under Linux.

That said, I think that the general solution to fault tolerance is to
combine LVM with either (a) the software RAID (md) subsystem, or (b)
hardware RAID devices.

For example, you can create a number of md devices, using RAID1 or RAID5
for fault tolerance, and then run pvcreate on them and manage them with
lvm.

I'm doing this right now with a 4-disk RAID5 array (3 disks + 1 hot
spare), and it seems to be working just fine.

-- Lars

-- 
Lars Kellogg-Stedman <lars@larsshack.org>
