Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9OJxckP006068
	for <linux-lvm@redhat.com>; Fri, 24 Oct 2014 15:59:38 -0400
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9OJxash025398
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Fri, 24 Oct 2014 15:59:37 -0400
Received: by mail-qc0-f179.google.com with SMTP id x3so1298291qcv.38
	for <linux-lvm@redhat.com>; Fri, 24 Oct 2014 12:59:36 -0700 (PDT)
MIME-Version: 1.0
Sender: vase@selfip.ru
From: Vasiliy Tolstov <v.tolstov@selfip.ru>
Date: Fri, 24 Oct 2014 23:59:20 +0400
Message-ID: <CACaajQsU_z8pwUGMHfD1y2dVkP_gKgajM6bBV1wFpxpF_7m1nA@mail.gmail.com>
Subject: [linux-lvm] fix corrupted thin pool
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
To: LVM <linux-lvm@redhat.com>, dm-devel@redhat.com

Hello! By mistake i'm restore by vcfgrestore thin volume, after that i
have errors on this thin pool on all volumes like :
 lvchange -ay vg1/2735
  Thin pool transaction_id=120, while expected: 114.
Does it possible to recovery from this? I'm try lvconvert --recover
and get tp1_tmeta0 but i'm don't understand whan i need to do next..?


-- 
Vasiliy Tolstov,
e-mail: v.tolstov@selfip.ru
jabber: vase@selfip.ru
