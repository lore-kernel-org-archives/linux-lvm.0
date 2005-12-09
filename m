Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jB9JD1V09149
	for <linux-lvm@redhat.com>; Fri, 9 Dec 2005 14:13:01 -0500
Received: from rwcrmhc11.comcast.net (rwcrmhc11.comcast.net [216.148.227.151])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jB9JCosc024093
	for <linux-lvm@redhat.com>; Fri, 9 Dec 2005 14:12:55 -0500
Received: from [192.168.1.3] (silvio.localnet [192.168.1.3])
	by furio.localnet (8.13.4/8.13.4) with ESMTP id jB9JCieu009093
	for <linux-lvm@redhat.com>; Fri, 9 Dec 2005 14:12:44 -0500
Message-ID: <4399D72B.80408@mattgillen.net>
Date: Fri, 09 Dec 2005 14:12:43 -0500
From: Matthew Gillen <me@mattgillen.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Newbie of LVM
References: <20051209033914.33441.qmail@web32605.mail.mud.yahoo.com>
In-Reply-To: <20051209033914.33441.qmail@web32605.mail.mud.yahoo.com>
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

Way Loss wrote:
> Hi all,
> 
>    I am very new to LVM. Here is the detail of my
> current fs.
> Filesystem            Size  Used Avail Use% Mounted on
> /dev/md1              9.4G  2.5G  6.5G  28% /
> /dev/md2              9.4G  7.6G  1.4G  85% /home
> /dev/md3              9.4G  6.6G  2.4G  74% /var
> /dev/md4              958M   18M  892M   2% /tmp
> /dev/md5              153G  119G   27G  82% /www
> 
>     My md5 is almost full and I wanna use LVM to merge
> my md5 with a new partition from a new hdd. I wanna
> ask if this possible for LVM to merge 2 partition
> together while one of them have data on it? I can't
> suffer any data loss and want to make sure that LVM
> works perfectly to what I want.
>    Thanks all.

You're out of luck.  You can't take an existing partition and keep the
data yet switch it over to LVM.  It's like RAID that way: you need to
set up the lower level stuff *before* you format the disk/partition with
your filesystem and start putting data on it.

To do what you want is possible, provided that you created an LVM from
the beginning that had md5 as a PhysicalVolume, then created your
filesystem on the Logical Volume.  But it seems clear from your fstab
that you didn't do that.

Sorry,
--Matt
