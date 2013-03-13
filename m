Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r2DFEK4x004602
	for <linux-lvm@redhat.com>; Wed, 13 Mar 2013 11:14:20 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.186])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2DFEH4E024484
	for <linux-lvm@redhat.com>; Wed, 13 Mar 2013 11:14:18 -0400
Message-ID: <514097C8.4030602@pse-consulting.de>
Date: Wed, 13 Mar 2013 16:14:16 +0100
From: Andreas Pflug <pgadmin@pse-consulting.de>
MIME-Version: 1.0
References: <513090CA.8050904@pse-consulting.de>
	<aac9d40a-ad92-41bc-a19a-6998bb8b057d@email.android.com>
	<5136F2F1.3020202@pse-consulting.de>
	<5136F738.1010707@hoster-ok.com>
	<5137091A.4070300@pse-consulting.de>
	<51370DDB.5010002@hoster-ok.com>
	<5137137B.5010800@pse-consulting.de>
	<5137267A.7040000@hoster-ok.com>
	<513733C0.2020207@pse-consulting.de>
	<5137447B.7030906@hoster-ok.com>
In-Reply-To: <5137447B.7030906@hoster-ok.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM snapshot with Clustered VG [SOLVED]
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
To: Vladislav Bogdanov <bubble@hoster-ok.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Hi Vladislav,

I finally succeeded making all working as expected!

What I did:
- compile corosync 2.3.0 
(http://corosync.org/download/corosync-2.3.0.tar.gz)
- compile libqb 0.14.4 
(https://fedorahosted.org/releases/q/u/quarterback/libqb-0.14.4.tar.gz)
- compile dlm_4.0.1 
(http://git.fedorahosted.org/cgit/dlm.git/snapshot/dlm-4.0.1.tar.gz)
- Compiled LVM 2.2.98 
(http://git.fedorahosted.org/cgit/lvm2.git/snapshot/lvm2-2_02_98.tar.gz)
    with your PREVIOUS patch ( 
https://www.redhat.com/archives/linux-lvm/2013-January/msg00006.html )

I made a 2-node test cluster, both accessing a test iscsi target, all 
daemons load fine.
Everything works as expected! Snapshotting is possible after -aey 
--force explicit exclusive locking, lvresize works as well.

Previously, I tried your latest patch. I had a plethiora of errors, 
starting with lvcreate failing:

#metadata/lv_manip.c:4137     Clearing start of logical volume "testvol2"
#device/dev-cache.c:599       /dev/san2/testvol2: stat failed: No such 
file or directory
#metadata/lv_manip.c:4140   /dev/san2/testvol2: not found: device not 
cleared
#metadata/lv_manip.c:4620   Aborting. Failed to wipe start of new LV.

I need to add -Z n to have it created. After that, most activations 
failed, with error code 5. I  went back to vanilla 2.2.98, all ok except 
exclusive locking, applied the initial locking patch and voila! All done.

Thanks for your support!
Andreas
