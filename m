Mime-Version: 1.0 (Apple Message framework v551)
From: Isaac Finnegan <isaac@coremobility.com>
Content-Transfer-Encoding: 7bit
Message-Id: <B88FB3C5-63A4-11D7-92BD-0003935486A4@coremobility.com>
Subject: [linux-lvm] root on LVM and one of the drives fails
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
Date: Mon Mar 31 12:16:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

I recently had a drive fail in a system that was entirely on LVM.  Is 
there any way to recover? I do not have a backup ( I had just installed 
a tape backup system, but hadn't run a backup) of the data or the 
lvmtab lvmtab.d lvmconf

I understand that this is not a very good situation. However, the first 
drive added is still fine and has the root filesystem on it ( I did not 
use striping)  so it seems that there should be some way to just get 
the filesystem up to get the lvm backups off to be able to do 
vgcfgrestore to some other drive to get the whole system up. I know 
that there's no way to recover data off of the drive that failed, but 
there should be a way to get into my root filesystem since 4 out of the 
6 drives are fine. And the first drive added (the one that had redhat 8 
installed on it with root on lvm) is still fine.

I have booted the system up off another redhat 8 install (new drive) 
and installed device-mapper and LVM2 but vgscan -P gives me this:

[root@jackintosh root]# vgscan -P
   Partial mode. Incomplete volume groups will be activated read-only.
   Reading all physical volumes.  This may take a while...
   4 PV(s) found for VG Primary: expected 7
   logical extent (0) already mapped.
   Couldn't fill logical volume maps.
   Volume group "Primary" not found
[root@jackintosh root]#

Can anyone help?

P.S.  please copy this email address as my main address was running off 
of said system.
