Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBOHitCi006196
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 24 Dec 2016 12:44:55 -0500
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ECC6DC049D5C
	for <linux-lvm@redhat.com>; Sat, 24 Dec 2016 17:44:54 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id x2so126051301itf.1
	for <linux-lvm@redhat.com>; Sat, 24 Dec 2016 09:44:54 -0800 (PST)
MIME-Version: 1.0
From: Matt Joyce <mttjocy@gmail.com>
Date: Sat, 24 Dec 2016 17:44:33 +0000
Message-ID: <CAKGZFci3=JchgD_fOLWJYZ4ZdKvUjRx-1vXW++QJ2P-338YOyQ@mail.gmail.com>
Subject: [linux-lvm] LVM Cache Error: Manual Repair Required
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I am having some issues with the cache on my LV preventing the LV from
activating correctly usually some time on google gives me answers to
the problem but this time I am having no luck everything I try results
in the same "Manual repair required!" error.

$ sudo lvchange -ay hdd-vg/data-lv
  Check of pool hdd-vg/data-lv_cache failed (status:1). Manual repair required!

$ sudo lvconvert --repair hdd-vg/data-lv
  Can't repair LV "data-lv" of segtype cache.

$ sudo lvconvert --repair hdd-vg/data-lv_cache
  Internal error: pool_is_active called with non-pool LV data-lv_cache.
bad checksum in superblock
  Repair of thin metadata volume of thin pool hdd-vg/data-lv_cache
failed (status:1). Manual repair required!

$ sudo lvremove hdd-vg/data-lv_cache
Do you really want to remove and DISCARD logical volume data-lv_cache? [y/n]: y
  Check of pool hdd-vg/data-lv_cache failed (status:1). Manual repair required!
  Failed to active cache locally hdd-vg/data-lv.

I have even tried resorting to removing the entire origin LV and even
the VG since the data on it is completely replaceable but nothing
works due to the manual repair required error I am at a loss what else
to try here.

Could someone give me some pointers how to go about resolving this?
