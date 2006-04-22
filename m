Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3MCxk25027767
	for <linux-lvm@redhat.com>; Sat, 22 Apr 2006 08:59:46 -0400
Received: from mail1.cc.huji.ac.il (mail1.cc.huji.ac.il [132.64.1.17])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k3MCxeXi030145
	for <linux-lvm@redhat.com>; Sat, 22 Apr 2006 08:59:40 -0400
Received: from kaminsky.dyndns.org (di8-32047.dialin.huji.ac.il [132.64.32.47])
	by mail1.cc.huji.ac.il (8.12.11.20060308/8.12.11) with ESMTP id
	k3MCxc7T014416
	for <linux-lvm@redhat.com>; Sat, 22 Apr 2006 15:59:38 +0300
Date: Sat, 22 Apr 2006 15:59:54 +0300
From: Moshe Kaminsky <kaminsky@math.huji.ac.il>
Message-ID: <20060422125954.GA5908@kaminsky>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] volume group uuid not found
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lvm <linux-lvm@redhat.com>

Hi,

I have the following problem: when running

vgchange -a y vg

I get errors of the following type:

Volume group uuid not found: ...

The ... stands for the concatenation of the VG uuid and the LV uuid for 
that volume (this is repeated for each logical volume.) The result is 
that the group is not activated. This happens also with a new test VG 
and LV I created, and for any operation with the LV (though sometimes 
the operation succeeds despite the message, eg when creating a new LV.)

Here are some other diagnostics that may be relevant:
When I run pvs I get the message

Can't read vg: skipping

When I run

lvdisplay -v /dev/vg/home

I get (among other things)

LV status: NOT available

I tried running 'vgcfgbackup' and 'vgcfgrestore', it didn't help.

The whole thing used to work, so this may be a result of some upgrade. 
This is all happening on a Gentoo system, with kernel version 2.6.16. 
The output of lvm version is:

LVM version: 2.02.03
Library version: 1.02.03
Driver version: 4.5.0

I can't try too many things there since almost all partitions on the 
machine are managed by lvm.

Any help is greatly appreciated,
Thanks,
Moshe

-- 
I love deadlines. I like the whooshing sound they make as they fly by. 
                                        -- Douglas Adams
    
    Moshe Kaminsky <kaminsky@math.huji.ac.il>
    Home: 08-9456841
