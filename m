Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F360810021B2
	for <linux-lvm@redhat.com>; Tue, 25 Sep 2018 10:19:05 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
	[209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 239AD3001749
	for <linux-lvm@redhat.com>; Tue, 25 Sep 2018 10:19:05 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id s69-v6so1002212oie.10
	for <linux-lvm@redhat.com>; Tue, 25 Sep 2018 03:19:05 -0700 (PDT)
MIME-Version: 1.0
From: Damon Wang <damon.devops@gmail.com>
Date: Tue, 25 Sep 2018 18:18:53 +0800
Message-ID: <CABZYMH498m-hNpkbAagiNPmFjFLrMZZZncx6S1ksupRVnPtYqw@mail.gmail.com>
Subject: [linux-lvm] [lvmlockd] recovery lvmlockd after kill_vg
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

Hi,

  AFAIK once sanlock can not access lease storage, it will run
"kill_vg" to lvmlockd, and the standard process should be deactivate
logical volumes and drop vg locks.

  But sometimes the storage will recovery after kill_vg(and before we
deactivate or drop lock), and then it will prints "storage failed for
sanlock leases" on lvm commands like this:

[root@dev1-2 ~]# vgck 71b1110c97bd48aaa25366e2dc11f65f
  WARNING: Not using lvmetad because config setting use_lvmetad=0.
  WARNING: To avoid corruption, rescan devices to make changes visible
(pvscan --cache).
  VG 71b1110c97bd48aaa25366e2dc11f65f lock skipped: storage failed for
sanlock leases
  Reading VG 71b1110c97bd48aaa25366e2dc11f65f without a lock.

  so what should I do to recovery this, (better) without affect
volumes in using?

  I find a way but it seems very tricky: save "lvmlockctl -i" output,
run lvmlockctl -r vg and then activate volumes as the previous output.

  Do we have an "official" way to handle this? Since it is pretty
common that when I find lvmlockd failed, the storage has already
recovered.

Thanks,
Damon Wang
