Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8JI3EV19939
	for <linux-lvm@redhat.com>; Mon, 19 Sep 2005 14:03:14 -0400
Received: from www.geoinf.fu-berlin.de (www.geoinf.fu-berlin.de [160.45.89.23])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j8JI38FL009665
	for <linux-lvm@redhat.com>; Mon, 19 Sep 2005 14:03:09 -0400
Received: from [160.45.89.15] (callisto.geoinf.fu-berlin.de [160.45.89.15])
	by www.geoinf.fu-berlin.de (Postfix) with ESMTP id 2A057A1E03
	for <linux-lvm@redhat.com>; Mon, 19 Sep 2005 20:03:14 +0200 (CEST)
Message-ID: <432EFD51.9040300@alice-it.net>
Date: Mon, 19 Sep 2005 20:02:57 +0200
From: Sebastian <sebastian@alice-it.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Removing PE from LV fails
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

Hello list,

sorry for my mail bombing this day, I was really upset about my 
troubles. I did actually kill the process by kill -9, and as far as I 
can see, there have been no problems.

Now I'd like to ask a question about my main problem:

I can't remove one PE from the VG. I'm running LVM 1.0.8-2 on RHEL 3. 
This is what the shell gives me:

    # pvmove /dev/sde
    pvmove -- moving physical extents in active volume group "express_vg"
    pvmove -- WARNING: if you lose power during the move you may need
            to restore your LVM metadata from backup!
    pvmove -- do you want to continue? [y/n] y
    Segmentation fault


I can't see the Distribution as well:

    # pvdisplay -v /dev/sde
    --- Physical volume ---
    PV Name               /dev/sde
    VG Name               express_vg
    PV Size               1.37 TB [2938208256 secs] / NOT usable 64.25
    MB [LVM: 215 KB]
    PV#                   6
    PV Status             available
    Allocatable           NO
    Cur LV                1
    PE Size (KByte)       65536
    Total PE              22415
    Free PE               19530
    Allocated PE          2885
    PV UUID               JtrSU1-82Om-HjJC-5rvC-aVwB-Cc5y-WsRbHQ

       --- Distribution of physical volume ---
       LV Name                   LE of LV  PE for LV
    Segmentation fault



Even with the -d option, there is not more information regarding the 
Distribution of physical volume. I it helps I can put the -d and -vv 
outputs on a webserver.

What I did not try yet is booting off a gentoo live-CD and using LVM2 to 
remove the PE. Is that a good decision?

Thank you for any help. Best regards,
Sebastian
