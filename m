Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o5TE7nh4014758
	for <linux-lvm@redhat.com>; Tue, 29 Jun 2010 10:07:49 -0400
Received: from Ishtar.sc.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o5TE7Ygg007780
	for <linux-lvm@redhat.com>; Tue, 29 Jun 2010 10:07:36 -0400
Received: from [192.168.3.12] (Athenae [192.168.3.12])
	by Ishtar.sc.tlinx.org (8.14.3/8.14.3/SuSE Linux 0.8) with ESMTP id
	o5TE7Tme007543
	for <linux-lvm@redhat.com>; Tue, 29 Jun 2010 07:07:32 -0700
Message-ID: <4C29FE21.10600@tlinx.org>
Date: Tue, 29 Jun 2010 07:07:29 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvremove: 'snapshot': can't remove 'active'? ,
	non-mounted file system
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>





lvremove -v /dev/Home/2010.06.27-06.18.55
    Using logical volume(s) on command line
  Can't remove open logical volume "2010.06.27-06.18.55"

But it isn't mounted.

So why is it saying it is 'open':

ll /dev/mapper shows:


crw-rw---- 1  10, 58 2010-02-02 21:08 control
brw-r----- 1 252,  4 2010-02-02 21:08 Home-2010.06.27--06.18.55
brw-r----- 1 252,  3 2010-02-02 21:08 Home-2010.06.27--06.18.55-cow
brw-r----- 1 252,  2 2010-02-02 21:08 Home-Home
brw-r----- 1 252,  1 2010-02-02 21:08 Home-Home-real
brw-r----- 1 252,  0 2010-02-02 21:08 Home-Share
brw-r----- 1 252,  5 2010-02-02 21:08 Space-Backup
brw-r----- 1 252, 11 2010-06-29 06:40 Space-boot
brw-r----- 1 252,  6 2010-06-29 06:40 Space-root
brw-r----- 1 252,  7 2010-06-28 17:45 Space-Torrents
brw-r----- 1 252,  8 2010-06-29 06:40 Space-usr
brw-r----- 1 252,  9 2010-06-29 06:40 Space-var
brw-r----- 1 252, 10 2010-06-29 06:40 Space-var_cache

So 252 is the mapper device?

Is my real Home partition on 252,1?

I just got a backup error when I tried to backup Home,
which would correspond to 252,2 above.  It thinks it
is no longer the same file system as the previous backup,

Should I be backing up Home-Home-real?  That doesn't
seem right...
