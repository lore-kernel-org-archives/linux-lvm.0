Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBN9ofMS013352
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 23 Dec 2015 04:50:41 -0500
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mx1.redhat.com (Postfix) with ESMTPS id F03FF49DB5
	for <linux-lvm@redhat.com>; Wed, 23 Dec 2015 09:50:40 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id p187so158145241qkd.1
	for <linux-lvm@redhat.com>; Wed, 23 Dec 2015 01:50:40 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 23 Dec 2015 17:50:40 +0800
Message-ID: <CAAYit8SM0KNv88TiOqD9mNBrk4DX3dG9AcRA9V9aZvAQdJt7vw@mail.gmail.com>
From: "M.H. Tsai" <mingnus@gmail.com>
Subject: [linux-lvm] Possible bug in expanding thinpool: lvextend doens't
 expand the top-level dm-linear device
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi All,

I'm running LVM2.2.02.138 on Ubuntu 14.04.  When I try to expand a
thinpool, I found that lvextend doesn't expand the top-level dm-linear
device of the thinpool. The following are the reproduce steps

# lvcreate vg1 --type thin-pool --thinpool tp1 --size 1g
--poolmetadataspare=n -Zn
# lvcreate vg1 --type thin --thinpool tp1 --virtualsize 100m --name lvol0
# lvextend vg1/tp1 --size +100m

After running lvextend, the table of vg1-tp1_tdata and vg1-tp1-tpool
are expanded, but the dm-linear table of vg1-tp1 remains unchanged.

I think that the function _lv_update_and_reload() erroneously operates
on the holder of of tp1, that is, lvol0. This might be caused by
commit fa64823, hence the subsequent actions runs on the lock_lv. The
verbose output also shows that the tree_action() is running on lvol0,
not tp1.

Creating PRELOAD tree for vg1/lvol0.
Creating SUSPEND tree for vg1/lvol0.
Creating ACTIVATE tree for vg1/lvol0.
Creating CLEAN tree for vg1/lvol0.

Is that a bug?


Thanks,
Ming-Hung Tsai
