Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4OCTTO14240
	for <linux-lvm@redhat.com>; Tue, 24 May 2005 08:29:29 -0400
Received: from tyo201.gate.nec.co.jp (TYO201.gate.nec.co.jp [202.32.8.214])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j4OCTQqg032612
	for <linux-lvm@redhat.com>; Tue, 24 May 2005 08:29:27 -0400
Received: from mailgate3.nec.co.jp (mailgate99.nec.co.jp [10.7.69.186])
	by tyo201.gate.nec.co.jp (8.11.7/3.7W01080315) with ESMTP id
	j4OCTKw20010
	for <linux-lvm@redhat.com>; Tue, 24 May 2005 21:29:20 +0900 (JST)
Received: (from root@localhost) by mailgate3.nec.co.jp
	(8.11.7/3.7W-MAILGATE-NEC) id j4OCTKj17790 for linux-lvm@redhat.com;
	Tue, 24 May 2005 21:29:20 +0900 (JST)
Received: from genzui.jp.nec.com (genzui.jp.nec.com [10.26.220.13]) by
	mailsv4.nec.co.jp (8.11.7/3.7W-MAILSV4-NEC) with ESMTP
	id j4OCTJc02367 for <linux-lvm@redhat.com>;
	Tue, 24 May 2005 21:29:19 +0900 (JST)
Message-Id: <42931ECB.4000806@vx.cnt.dnes.jp.nec.com>
Date: Tue, 24 May 2005 21:32:11 +0900
From: "Shinn'ya Hoshino" <s-hoshino@vx.cnt.dnes.jp.nec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] "pvchange --uuid" failed when PV is in use
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

Hello,

I tried to "pvchange --uuid /dev/sdc1" to change of PV UUID.
But FAILED to change PV UUID on PV metadata, only changed on VG
metadata. I'm trying to correct source code, please help.

When PV is orphan, "pvchange --uuid /dev/sdc1" changes PV UUID
successfully. At this time, pvchange calls pv_write(). But when
PV is in use by VG, pvchange only calls vg_write(), pv_write()
is not called.

vg_write() does not have function to change PV metadata.
Therefore, probably pvchange needs to call pv_write() to write
UUID into PV metadata. But pv_write() is forbidden to call when
PV is in use by VG. LV is not mounted... Even if there was no
LV, it failed.

Please teach me why it is forbidden.
If there is a method of allowing pv_write(), I want to try it.

BTW, I want to activate VG on raw-level duplicated PV. I look
for this ML. When edit lvm.conf and "pvchange --uuid" and
vgrename, it turned out that it is possible. However, if
pvchange does not function correctly, there is no how to adopt a
measure.

Best Regards,

-- 
/* -------------------------------------------------------------
   Shinn'ya Hoshino     mailto:s-hoshino@vx.cnt.dnes.jp.nec.com
------------------------------------------------------------- */
