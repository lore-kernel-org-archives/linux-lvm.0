Date: Tue, 28 Sep 1999 14:33:51 -0500 (EST)
From: theodore russell wickell <twickell@indiana.edu>
Subject: [linux-lvm] red hat linux lvm question
Message-ID: <Pine.HPP.3.96.990928143318.11241B-100000@falstaff.ucs.indiana.edu>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com



Hello,

I am installing lvm-0.7 on Red Hat 6.0 with kernel 2.2.5-15

I compiled in the lvm as a module, but when I go to load the module, I get
the following errors.
/lib/modules/2.2.5-15/block/lvm.o: unresolved symbol del_mddev_mapping
/lib/modules/2.2.5-15/block/lvm.o: unresolved symbol md_hd_struct
/lib/modules/2.2.5-15/block/lvm.o: unresolved symbol add_mddev_mapping

I am missing a patch or something? Please let me know what I may have
messed up or if there is a special patch I need for this kernel.

If you need more info to be able to help me please let know.

Rusty Wickell
 

----------------------------------------------------------------------------
Rusty Wickell					200 S. Jordan Ave.
Digital Library Sytem Administrator		Simon 060
Indiana University				Bloomington IN 
812-856-5174					47405
----------------------------------------------------------------------------
