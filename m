Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q7NGstO7013197
	for <linux-lvm@redhat.com>; Thu, 23 Aug 2012 12:54:55 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q7NGss1F006656
	for <linux-lvm@redhat.com>; Thu, 23 Aug 2012 12:54:54 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id q7NGsr14032549
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 23 Aug 2012 12:54:53 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by bmsred.bmsi.com (8.14.4/8.14.4) with ESMTP id q7NGrcpw023661
	for <linux-lvm@redhat.com>; Thu, 23 Aug 2012 12:53:39 -0400
Date: Thu, 23 Aug 2012 12:53:38 -0400 (EDT)
From: Stuart D Gathman <stuart@bmsi.com>
In-Reply-To: <50365BFF.503@redhat.com>
Message-ID: <alpine.LRH.2.02.1208231248210.23534@bmsred.bmsi.com>
References: <CAGQjrKZju5zQA9_cGtO+n0WRe2t6ZSJB+SKfr23+JJ3YzntgUQ@mail.gmail.com>
	<CAGQjrKYZw27r=xgB2DaBtap-jQ1oi-7_Ydw=3z+2kw4s_03hAA@mail.gmail.com>
	<50365BFF.503@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvextend NEVER works but screws up
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Aug 23, Bryn M. Reeves transmitted in part:

>> #resize2fs /dev/vg0/logs    ( and it gets screwed up here )
>> resize2fs 1.39 (29-May-2006) *resize2fs: Filesystem has unsupported
>> feature(s) while trying to open /dev/vg0/logs* *Couldn't find valid
>> filesystem superblock.*
>
> This is the problem. You appear to be using a version of e2fsprogs
> that is older than the version used to create the file system in the
> first place. In this case they will give up and refuse to do anything
> rather than potentially damage a file system that has unknown features
> enabled.
>
>> lvm version LVM version:     2.02.88(2)-RHEL5 (2012-01-20) Library
>> version: 1.02.67-RHEL5 (2011-10-14) Driver version:  4.11.6
>
> Can you post the version of e2fsprogs you have installed and also the
> output of "dumpe2fs -h /dev/vg0/logs"?

I can guess pretty confidently what the problem is.  RHEL5 supports
ext2 and ext3, but *not* ext4 (unless you install ext4progs, and then
you have to run resize4fs, not resize2fs).  But it has a very stable
Xen.  The OP probably has a VM that uses ext4, and it trying to resize
the filesystem using the old resize2fs on his RHEL5 dom0.

What the OP *should* do:

1) after extending the LV, shutdown and startup the VM so that it sees
the new size, and run resize2fs in the VM (where it is the right
version and will do an online resize).

   or

2) install e4fsprogs in RHEL5, and use resize4fs on dom0
