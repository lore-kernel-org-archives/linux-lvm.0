Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4F425D6D0
	for <linux-lvm@redhat.com>; Tue, 10 Sep 2019 22:58:25 +0000 (UTC)
Received: from mr012msb.fastweb.it (mr012msb.fastweb.it [85.18.95.109])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 33B843091D69
	for <linux-lvm@redhat.com>; Tue, 10 Sep 2019 22:58:22 +0000 (UTC)
Received: from ceres.assyoma.it (93.63.55.57) by mr012msb.fastweb.it (5.8.208)
	id 5D4007AA03E0B3F2 for linux-lvm@redhat.com;
	Wed, 11 Sep 2019 00:58:20 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 11 Sep 2019 00:58:20 +0200
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <c9570c19bfd78579f77ff85e81ce0137@assyoma.it>
Subject: [linux-lvm] Forcing a specific io scheduler
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
To: linux-lvm@redhat.com

Hi all,
I have a (virtual) block devices which does not expose any io scheduler:
[root@localhost block]# cat /sys/block/zd0/queue/scheduler
none

I created an lvm volume on top of that block devices with:
[root@localhost ~]# pvcreate /dev/zd0
   Physical volume "/dev/zd0" successfully created.
[root@localhost ~]# vgcreate vg_test /dev/zd0
   Volume group "vg_test" successfully created
[root@localhost ~]# lvcreate vg_test --name lv_test -l +100%FREE
   Logical volume "lv_test" created.

With my surprise, I can not select any additional io scheduler:
[root@localhost block]# cat /sys/block/dm-2/queue/scheduler
none

I am missing something? Can a scheduler be forced on a lvm volume?
Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
