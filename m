Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5AHVuvM011615
	for <linux-lvm@redhat.com>; Sat, 10 Jun 2006 13:31:56 -0400
Received: from mail.solid-soft.at (mail.solid-soft.at [193.83.215.58])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k5AHVou8021045
	for <linux-lvm@redhat.com>; Sat, 10 Jun 2006 13:31:50 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.solid-soft.at (Postfix on SuSE Linux 8.0 (i386)) with ESMTP id
	BEB2435D57
	for <linux-lvm@redhat.com>; Sat, 10 Jun 2006 19:31:43 +0200 (CEST)
Received: from mail.solid-soft.at ([127.0.0.1])
	by localhost (gateway [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 12189-04 for <linux-lvm@redhat.com>;
	Sat, 10 Jun 2006 19:31:38 +0200 (CEST)
Received: from [192.168.17.36] (pundit1.solid-soft.at [192.168.17.36])
	by mail.solid-soft.at (Postfix on SuSE Linux 8.0 (i386)) with ESMTP id
	F0513357A8
	for <linux-lvm@redhat.com>; Sat, 10 Jun 2006 19:31:37 +0200 (CEST)
Message-ID: <448B01F9.604@solid-soft.at>
Date: Sat, 10 Jun 2006 19:31:37 +0200
From: Robert Valentan <rov_200603@solid-soft.at>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvcreate - race condition creating snapshots
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
To: linux-lvm@redhat.com

I think, there is a race condition in lvcreate while
makeing a new snapshot.

System: Tyan with 2 Opteron 246
        xen 3.0.2-3
        linux 2.6.16.13
        lvm 2.02.07
        3ware-Raid 9550 Raid5

Under xen i was unable to create a snapshot, I got
always "LV system/snap in use: not deactivating".
Without xen, i got occasionally a snapshot.


After i make a "dirty hack":
------ begin ----------
*** old/lvcreate.c      2006-06-10 19:22:37.000000000 +0200
--- lvcreate.c  2006-06-10 19:23:04.000000000 +0200
***************
*** 776,781 ****
--- 776,787 ----
                /* Reset permission after zeroing */
                if (!(lp->permission & LVM_WRITE))
                        lv->status &= ~LVM_WRITE;
+
+                 { struct timeval tv ;
+                   tv.tv_sec=10;
+                   tv.tv_usec=0;
+                   select(2, 0, 0, 0, &tv);
+                 }
                if (!deactivate_lv(cmd, lv)) {
                        log_err("Couldn't deactivate new snapshot.");
                        return 0;
------ end ---------

i got always a snapshot (on all 3 systems!). I think, there is an
other thread which is creating the new lv, and it will take longer as
the lvcreate will "think". I have to less knowledge to make a patch,
which is waiting for the correct event (creating lv complete).

-- 
regards
Robert Valentan
