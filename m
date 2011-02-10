Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p1ALEhHZ022223
	for <linux-lvm@redhat.com>; Thu, 10 Feb 2011 16:14:43 -0500
Received: from smtp103.prem.mail.ac4.yahoo.com
	(smtp103.prem.mail.ac4.yahoo.com [76.13.13.42])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id p1ALEVYt020782
	for <linux-lvm@redhat.com>; Thu, 10 Feb 2011 16:14:31 -0500
Message-ID: <4D54552E.6070202@Yahoo.com>
Date: Thu, 10 Feb 2011 16:14:22 -0500
From: Peter Flass <Peter_Flass@Yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Cannot access logical volume (open count=1)
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
To: linux-lvm@redhat.com

I'm truly sorry to bother the developers' list with this question, but 
I've searched and can't find an ansewr that works.  A system crash seems 
to have corrupted something in my fedora system.  I boot to a rescue CD 
and look thru LVM.  The disk (sdb) has one vg and three lv's on it.  
Call the vg vg_xxx, the lv's are lv_boot (ext3, I believe), lv_swap (no 
fs) and lv_home (ext4).  I can't fsck (e2fsck) lv_home or do anything 
else with it, LVM says it's open count=1 where the open count of the 
other two lv's is zero.

I can't find who has it open.  /proc/mounts shows /dev/sdb1 mounted on 
/media/usb0, when I umount  it (either by mount point or device) it 
disappears, but the lv still shows open, and as a result I am unable to 
do anything with it.  lsof also shows nothing open that resembles this 
lv.  I can inactivate the other two lvs in this vg, but not lv_home.

What can I do to fix this problem?
