Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102141919.f1EJJhQ10900@webber.adilger.net>
Subject: Re: [linux-lvm] LVM with devfs questions and patches
In-Reply-To: <20010214191831.A12417@trez42.net> from Benoit Gaussen at "Feb 14,
 2001 07:18:31 pm"
Date: Wed, 14 Feb 2001 12:19:42 -0700 (MST)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Benoit Gaussen writes:
> I saw the changes in the CVS tree except for one thing that I forgot to tell
> about in my previous mail. 
> 
> There is a mistake in the devfs registration of /dev/lvm, the major and
> minor numbers are swapped :
> 
> Just an extract of the patch :
> 
>  lvm_devfs_handle = devfs_register(
> -		0 , "lvm", 0, 0, LVM_CHAR_MAJOR,
> +		0 , "lvm", 0, LVM_CHAR_MAJOR, 0,
>  		S_IFCHR | S_IRUSR | S_IWUSR | S_IRGRP,
>  		&lvm_chr_fops, NULL);

I noticed your change, and it is also in the devfs patch that I submitted.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
