Message-ID: <DCBFB8E1BD8BD311A94D00A0C9CA44EA0CCCEB@storeage_nt>
From: Sergey Vichik <SVichik@store-age.com>
Subject: [linux-lvm] LVM for Redhat 6.1 (2.2.12 kernel)
Date: Fri, 16 Jun 2000 10:37:05 +0200
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "LVM list (E-mail)" <linux-lvm@msede.com>


Hello,

	I want to install LVM on  Redhat 6.1 (2.2.12-20 kernel), without
replacing the kernel to another version.
All LVM patches fails to do it because of RAID additions in ll_rw_blk.c .

	Is there some other patch that works for this kernel version ?
Or if isn't, a patch to upgrade to another version, where LVM patches will
work ?


Thank you.


Serg.
 
