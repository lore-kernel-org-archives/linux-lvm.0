Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l14Irj9U011023
	for <linux-lvm@redhat.com>; Sun, 4 Feb 2007 13:53:45 -0500
Received: from smtp4-g19.free.fr (smtp4-g19.free.fr [212.27.42.30])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l14Irgoq014624
	for <linux-lvm@redhat.com>; Sun, 4 Feb 2007 13:53:42 -0500
Received: from [192.168.0.1] (bon31-1-82-66-78-161.fbx.proxad.net
	[82.66.78.161])
	by smtp4-g19.free.fr (Postfix) with ESMTP id DC8E04F1F0
	for <linux-lvm@redhat.com>; Sun,  4 Feb 2007 19:53:41 +0100 (CET)
Message-ID: <45C62BB0.6090004@free.fr>
Date: Sun, 04 Feb 2007 19:53:36 +0100
From: Georges Giralt <georges.giralt@free.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] replacing a failling disk on a mirrred VG.
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi !
I run A Fedora Core 6 box with
lvm> version
   LVM version:     2.02.17 (2006-12-14)
   Library version: 1.02.13 (2006-11-28)
   Driver version:  4.10.0
lvm>
on a 2.6.19 kernel.
My VG comprises 3PV  onto which I've spread 4 mirrored LVs.
PV 0 : LV1 mirror copy 0, LV2 mirror copy 0, lv3 mirror copy 0 and lv4 
mirror copy 0
PV 1 : LV1 mirror copy 1, LV2 mirror log, LV3 mirror log and LV4 mirror 
copy 1
PV2 : LV1 mirror log, LV2 mirror copy 1 , LV3 mirror copy 1 and LV4 
mirror log.
I plan to replace (Smart signals a future failure) the PV #1.
Question : What is the best route to do this ? And is it feasible ?
Thanks a lot in advance for your answer !
-- 
Ce message est constitu� d'au moins 50 % d'�lectrons recycl�s.
S'il vous pla�t, aidez nous � conserver nos ressources,
recyclez vos �lectrons !
