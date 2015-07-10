Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t6AMrx9q024668
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 10 Jul 2015 18:53:59 -0400
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mx1.redhat.com (Postfix) with ESMTPS id 75273BC6D4
	for <linux-lvm@redhat.com>; Fri, 10 Jul 2015 22:53:57 +0000 (UTC)
Received: by wicmz13 with SMTP id mz13so23858246wic.0
	for <linux-lvm@redhat.com>; Fri, 10 Jul 2015 15:53:56 -0700 (PDT)
MIME-Version: 1.0
From: Dax Kelson <dkelson@gurulabs.com>
Date: Fri, 10 Jul 2015 16:53:36 -0600
Message-ID: <CAFDa5Q0feMgByDV_FTPzeB6s1EkxX6vsqQeayPbKKfSmkJ+2Sw@mail.gmail.com>
Subject: [linux-lvm] Trying to see a difference in performance with LVM Cache
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

My "root" LV is attached to a LVM Cache Pool that is about 900GB in size.

The Origin/Slow LV can do about 560 MB/sec and the Fast/CacheLV can do
about double that speed.

# lvs
  LV   VG         Attr       LSize   Pool      Origin       Data%
Meta%  Move Log Cpy%Sync Convert
  root virthost03 Cwi-aoC--- 831.94g [CacheLV] [root_corig] 0.06
8.27            0.00
  swap virthost03 -wi-ao----   4.00g

I'm trying see a performance difference, and I would expect these
speeds to increase.

[root@virthost03 tmp]# echo 1 > /proc/sys/vm/drop_caches
[root@virthost03 tmp]# dd if=/dev/virthost03/root of=/dev/null count=1
skip=30  bs=1GB
1+0 records in
1+0 records out
1000000000 bytes (1.0 GB) copied, 5.88505 s, 170 MB/s
[root@virthost03 tmp]# echo 1 > /proc/sys/vm/drop_caches
[root@virthost03 tmp]# dd if=/dev/virthost03/root of=/dev/null count=1
skip=30  bs=1GB
1+0 records in
1+0 records out
1000000000 bytes (1.0 GB) copied, 6.04174 s, 166 MB/s
[root@virthost03 tmp]# echo 1 > /proc/sys/vm/drop_caches
[root@virthost03 tmp]# dd if=/dev/virthost03/root of=/dev/null count=1
skip=30  bs=1GB
1+0 records in
1+0 records out
1000000000 bytes (1.0 GB) copied, 6.27378 s, 159 MB/s
[root@virthost03 tmp]# echo 1 > /proc/sys/vm/drop_caches
[root@virthost03 tmp]# dd if=/dev/virthost03/root of=/dev/null count=1
skip=30  bs=1GB
1+0 records in
1+0 records out
1000000000 bytes (1.0 GB) copied, 8.66593 s, 115 MB/s
[root@virthost03 tmp]#

Help?
