Return-Path: <ben@trez42.net>
From: Benoit Gaussen <ben@trez42.net>
Date: Wed, 14 Feb 2001 19:18:31 +0100
Subject: Re: [linux-lvm] LVM with devfs questions and patches 
Message-ID: <20010214191831.A12417@trez42.net>
Mime-Version: 1.0
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>Thanks for those, I've reworked them a little but the effect should be the same.
>

Hi, 

I saw the changes in the CVS tree except for one thing that I forgot to tell
about in my previous mail. 

There is a mistake in the devfs registration of /dev/lvm, the major and
minor numbers are swapped :

Just an extract of the patch :

 lvm_devfs_handle = devfs_register(
-		0 , "lvm", 0, 0, LVM_CHAR_MAJOR,
+		0 , "lvm", 0, LVM_CHAR_MAJOR, 0,
 		S_IFCHR | S_IRUSR | S_IWUSR | S_IRGRP,
 		&lvm_chr_fops, NULL);
	 
	
Ben.


-- 
Unix IS user friendly, it is just selective about who his friends are.
                                                             Anonymous
