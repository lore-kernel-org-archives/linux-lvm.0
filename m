Date: Fri, 1 Oct 1999 13:19:32 -0500 (EST)
From: theodore russell wickell <twickell@indiana.edu>
Subject: [linux-lvm] unresolved symbols.
Message-ID: <Pine.HPP.3.96.991001131544.20591F-100000@falstaff.ucs.indiana.edu>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hi,

I compiled the 2.2.12 kernel with the lvm as a module using the
patch-2.2.11-LVM.gz patch with no problem.
When I boot I find though it can not load the lvm module because of the
following unresolved dependencies:

Oct  1 11:42:32 persephone insmod: /lib/modules/2.2.5-15/block/lvm.o:
unresolved
 symbol del_mddev_mapping
Oct  1 11:42:32 persephone insmod: /lib/modules/2.2.5-15/block/lvm.o:
unresolved
 symbol md_hd_struct
Oct  1 11:42:32 persephone insmod: /lib/modules/2.2.5-15/block/lvm.o:
unresolved
 symbol add_mddev_mapping


Has anyone seen this? Am I forgetting some other option?

Thanks,
Rusty

----------------------------------------------------------------------------
Rusty Wickell					200 S. Jordan Ave.
Digital Library Sytem Administrator		Simon 060
Indiana University				Bloomington IN 
812-856-5174					47405
----------------------------------------------------------------------------
