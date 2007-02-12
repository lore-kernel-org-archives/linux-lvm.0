Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1CKi81r023023
	for <linux-lvm@redhat.com>; Mon, 12 Feb 2007 15:44:08 -0500
Received: from nlpi042.sbcis.sbc.com (nlpi042.sbcis.sbc.com [207.115.36.71])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l1CKi5Rc006224
	for <linux-lvm@redhat.com>; Mon, 12 Feb 2007 15:44:06 -0500
Received: from [69.104.219.9] (adsl-69-104-219-9.dsl.irvnca.pacbell.net
	[69.104.219.9]) (authenticated bits=0)
	by nlpi042.sbcis.sbc.com (8.13.8 smtpauth/dk/8.13.8) with ESMTP id
	l1CKgsoG006955
	for <linux-lvm@redhat.com>; Mon, 12 Feb 2007 14:43:02 -0600
Message-ID: <45D0D187.4020206@pacbell.net>
Date: Mon, 12 Feb 2007 12:43:51 -0800
From: Duane Clark <duane_clark@pacbell.net>
MIME-Version: 1.0
References: <682963.73875.qm@web38214.mail.mud.yahoo.com>
In-Reply-To: <682963.73875.qm@web38214.mail.mud.yahoo.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: Extending the Root Volume with LVM
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Sean McGlynn wrote:
> I am working with RHEL 4 Update 4.  When initially installing the OS I 
> allowed the installation to automatically partition the disk, and it 
> used LVM to create a logical volume to mount the root file system.  The 
> only other logical volume it created was for the swap file.
>  
> Now, as an experiment, I am attempting to extend the volume group and 
> logical volume on which root is mounted.  Everything appeared to 
> be going smoothly (extending the VG, extending the LV, doing a vgchange, 
> and then a lvm lvchange), but I am now at the point where I want to run 
> e2fsck to check the file system and resize2fs to resize the files system 
> to realize the added space, and I can't do either because the volume is 
> mounted, and cannot be unmounted.
>  
> I've read a few suggestions such as using the installation media to go 
> in in rescue mode, but nothing seems to do the trick. 

Why, what problems are you running into? When rescue mode asked if you 
wanted it to find and mount the filesystems, did you select "skip"? Here 
is step by step how I reduced the LVM on FC4, including e2fsck and 
resize2fs:

https://www.redhat.com/archives/linux-lvm/2006-August/msg00081.html

> I also read 
> something that said that you cannot extend the root volume, and that you 
> shouldn't have to.  This appears to be more accurate than anything else 
> I've read.

Definitely not true. I have used the above technique on several drives.
