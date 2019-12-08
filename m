Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B9FE2026D69
	for <linux-lvm@redhat.com>; Sun,  8 Dec 2019 19:30:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCE971801906
	for <linux-lvm@redhat.com>; Sun,  8 Dec 2019 19:30:26 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id n9so12630307wmd.3
	for <linux-lvm@redhat.com>; Sun, 08 Dec 2019 11:30:24 -0800 (PST)
Received: from [192.168.200.100] (80.49.186.102.ipv4.supernova.orange.pl.
	[80.49.186.102])
	by smtp.gmail.com with ESMTPSA id m8sm11262712wmf.8.2019.12.08.11.30.23
	for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 08 Dec 2019 11:30:23 -0800 (PST)
From: =?utf-8?Q?=C5=81ukasz_Czerpak?= <lukasz.czerpak@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Message-Id: <B1ED1228-4BFA-49EE-BB61-27D5B7D9553D@gmail.com>
Date: Sun, 8 Dec 2019 20:30:22 +0100
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Thin pool vg1-thinpool1-tpool (253:3) transaction_id is
 549, while expected 505.
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Hi,

I cannot get my LVM working. 

The structure is as follows:

vg1 -> thinpool1 -> 11x lvs

I extended size of one of child LVs, after that ran xfs_growfs which got stuck. After 1hr I did cold reboot and thinpool reported the following:

$ lvchange -ay vg1
  WARNING: Not using lvmetad because a repair command was run.
  Thin pool vg1-thinpool1-tpool (253:3) transaction_id is 549, while expected 505.
  Thin pool vg1-thinpool1-tpool (253:3) transaction_id is 549, while expected 505.
  Thin pool vg1-thinpool1-tpool (253:3) transaction_id is 549, while expected 505.
  Thin pool vg1-thinpool1-tpool (253:3) transaction_id is 549, while expected 505.
  Thin pool vg1-thinpool1-tpool (253:3) transaction_id is 549, while expected 505.
  Thin pool vg1-thinpool1-tpool (253:3) transaction_id is 549, while expected 505.
  Thin pool vg1-thinpool1-tpool (253:3) transaction_id is 549, while expected 505.
  Thin pool vg1-thinpool1-tpool (253:3) transaction_id is 549, while expected 505.
  Thin pool vg1-thinpool1-tpool (253:3) transaction_id is 549, while expected 505.
  Thin pool vg1-thinpool1-tpool (253:3) transaction_id is 549, while expected 505.
  Thin pool vg1-thinpool1-tpool (253:3) transaction_id is 549, while expected 505.
  Thin pool vg1-thinpool1-tpool (253:3) transaction_id is 549, while expected 505.


I tried lvconvert —repair vg1/thinpool1 but it always throws transaction id mismatch error:

$ lvconvert --repair vg1/thinpool1
  WARNING: Disabling lvmetad cache for repair command.
  WARNING: Not using lvmetad because of repair.
  Transaction id 505 from pool "vg1/thinpool1" does not match repaired transaction id 549 from /dev/mapper/vg1-lvol2_pmspare.
  WARNING: LV vg1/thinpool1_meta3 holds a backup of the unrepaired metadata. Use lvremove when no longer required.
  WARNING: New metadata LV vg1/thinpool1_tmeta might use different PVs.  Move it with pvmove if required.

I have no idea on how to proceed and more importantly *how to access/recover data in LVs*. I desperately looking for any help :(

—
Best regards,
Łukasz Czerpak
