Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nBLJDbtG029662
	for <linux-lvm@redhat.com>; Mon, 21 Dec 2009 14:13:37 -0500
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nBLJDOOl032080
	for <linux-lvm@redhat.com>; Mon, 21 Dec 2009 14:13:24 -0500
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e36.co.us.ibm.com (8.14.3/8.13.1) with ESMTP id nBLJAp3U016424
	for <linux-lvm@redhat.com>; Mon, 21 Dec 2009 12:10:51 -0700
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	nBLJCuYO211728
	for <linux-lvm@redhat.com>; Mon, 21 Dec 2009 12:12:56 -0700
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.14.3/8.13.1/NCO v10.0 AVout) with ESMTP
	id nBLJCrIq024901
	for <linux-lvm@redhat.com>; Mon, 21 Dec 2009 12:12:53 -0700
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d03av01.boulder.ibm.com (8.14.3/8.13.1/NCO v10.0 AVin) with ESMTP id
	nBLJCqq0024870
	for <linux-lvm@redhat.com>; Mon, 21 Dec 2009 12:12:53 -0700
Date: Mon, 21 Dec 2009 11:12:52 -0800
From: malahal@us.ibm.com
Message-ID: <20091221191252.GA5855@us.ibm.com>
References: <20091217234212.938778E090A@hormel.redhat.com>
	<691e2b620912200536u3ac4fff6v9203ee435470f1b1@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <691e2b620912200536u3ac4fff6v9203ee435470f1b1@mail.gmail.com>
Subject: Re: [linux-lvm] linux-lvm Digest, Vol 70, Issue 6
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

Johan Gardell [gardin@gmail.com] wrote:
> Hi!
> 
> I was able to use dd to read from the two PVs, so i started looking in
> the /proc/* files as you said:
> 
> /proc/mounts:
> rootfs / rootfs rw 0 0
> none /sys sysfs rw,nosuid,nodev,noexec,relatime 0 0
> none /proc proc rw,nosuid,nodev,noexec,relatime 0 0
> udev /dev tmpfs rw,relatime,size=10240k,mode=755 0 0
> /dev/disk/by-uuid/56b77d5f-64e8-4392-be98-81a17a4c895d / reiserfs
> rw,relatime,notail 0 0
> tmpfs /lib/init/rw tmpfs rw,nosuid,relatime,mode=755 0 0
> tmpfs /dev/shm tmpfs rw,nosuid,nodev,relatime 0 0
> devpts /dev/pts devpts rw,nosuid,noexec,relatime,gid=5,mode=620,ptmxmode=000 0 0
> /dev/mapper/Dreamhack-dreamhacklv /home reiserfs rw,relatime 0 0
> 
> and in /proc/swap
> Filename				Type		Size	Used	Priority
> /dev/sdb3                               partition	1951888	0	-1
> 
> Which did not give much, but i looked in /proc/mdstat as well
> Personalities :
> md127 : inactive sdc[1](S) sda[0](S)
>       4514 blocks super external:imsm
> 
> unused devices: <none>
> 
> Doesn't that mean the PVs are mapped to the md127 device? (the
> /dev/md127 device exists as well)
> I googled some and found that mdadm --remove /dev/md127 /dev/sdc and
> the same for the other device should remove the devices from the raid,
> but i just want to check with you so that i don't toast my data.. :P
> Could this be the issue?

That is the most likely issue. You need to figure out why MD has taken
them (someone must have created MD labels on them???). If you are not
interested in what is stored there, you can certainly remove them from
mdadm configuration and put them under LVM control but don't expect to
get your data back. If you have stored something on them, you better use
MD and restore the data before you remove them from MD and place them
under LVM.

Thanks, Malahal.
