Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9BDudr01902
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2004 09:56:39 -0400
Received: from mail2.m-cam.com ([63.124.102.77])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i9BDuXB3002962
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2004 09:56:39 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail2.m-cam.com (Postfix) with ESMTP id 5D4E93E8EA
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2004 09:52:07 -0400 (EDT)
Received: from mail2.m-cam.com ([127.0.0.1])
	by localhost (mail2.m-cam.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 07272-05 for <linux-lvm@redhat.com>;
	Mon, 11 Oct 2004 09:51:54 -0400 (EDT)
Received: from [192.168.1.21] (unknown [192.168.1.21])
	by mail2.m-cam.com (Postfix) with ESMTP id 68FF53E8B9
	for <linux-lvm@redhat.com>; Mon, 11 Oct 2004 09:51:54 -0400 (EDT)
Message-ID: <416A90FE.5010504@m-cam.com>
Date: Mon, 11 Oct 2004 09:56:15 -0400
From: Arshavir Grigorian <ag@m-cam.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How to extend the file system online?
References: <i1958990824043.04841@send4.inner-21cn.com>
In-Reply-To: <i1958990824043.04841@send4.inner-21cn.com>
Content-Transfer-Encoding: 8bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Rocty Wang wrote:

> Hi, all,
>
> After I used LVM2 to create PV, VG, LV on the attached storage
>
> disks, I want to format logical volume as a file system and
>
> possibly extend the file system of LV online. But when I prefer to
>
> “ext3” file system, I find the tool “resize2fs” only can resize
>
> ext3 file system offline.
>
> OS: Linux Fedora Core2(kernel 2.6.7-1.494.2.2smp)
>
> LVM version: 2.00.15(2004-04-19)
>
> Library version: 1.00.14-ioctl(2004-04-06)
>
> Driver version: 4.1.0
>
> Operations:
>
> pvcreate /dev/sda
>
> pvcreate /dev/sdb
>
> vgcreate vg1 /dev/sda /dev/sdb
>
> lvcreate –L 100G –n lv1 vg1
>
> mke2fs /dev/vg1/lv1
>
> mount /dev/vg1/lv1 /mnt
>
> lvextend –L +50G /dev/vg1/lv1
>
> Then I used “resize2fs” tool to extend file system, but failed.
>
> I know it must be done when “umount” the lv1.
>
> If another tool can finish that running under Linux?
>
> Or if any other file system can be mounted and resized online under 
> Linux?
>
> XFS? I don’t know.
>
> Anyone can help me? Thanks!
>
> Rocty Wang
>
> 2004-10-09
>
You can try ReiserFS, which does allow to be resized while mounted. 
--Arshavir
