Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBV8e60R018537
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 31 Dec 2015 03:40:06 -0500
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mx1.redhat.com (Postfix) with ESMTPS id B938E101CF1
	for <linux-lvm@redhat.com>; Thu, 31 Dec 2015 08:40:05 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id p186so20363721qke.0
	for <linux-lvm@redhat.com>; Thu, 31 Dec 2015 00:40:05 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 31 Dec 2015 16:40:04 +0800
Message-ID: <CAAYit8TFUcWzveNPV3gsknnagWoEZVeKWWfWpKuFfmBauQhS2Q@mail.gmail.com>
From: "M.H. Tsai" <mingnus@gmail.com>
Subject: [linux-lvm] Could we manually suspend the origin before taking
	dm-thin snapshots?
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

I found an issue when taking dm-thin snapshots: LVM doesn't send
create_snap messages if the origin was already suspended, and LVM
doesn't report any error.

lvcreate vg1 --type thin --thinpool tp1 --virtualsize 1g
dmsetup suspend vg1-lv1
lvcreate vg1/lv1 --snapshot -an

This is due to commit a900d150 moves messaging from resume to suspend,
then LVM skips the suspend phase in this case. I'm not sure whether it
is a legal operation for LVM, but if LVM supports this feature, then
users can control the suspend timing.


Thanks,
Ming-Hung Tsai
