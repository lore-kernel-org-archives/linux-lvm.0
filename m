Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t6AMxnp8029786
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 10 Jul 2015 18:59:49 -0400
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mx1.redhat.com (Postfix) with ESMTPS id CC5F12D2F1F
	for <linux-lvm@redhat.com>; Fri, 10 Jul 2015 22:59:47 +0000 (UTC)
Received: by wifm2 with SMTP id m2so58061247wif.1
	for <linux-lvm@redhat.com>; Fri, 10 Jul 2015 15:59:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFDa5Q0feMgByDV_FTPzeB6s1EkxX6vsqQeayPbKKfSmkJ+2Sw@mail.gmail.com>
References: <CAFDa5Q0feMgByDV_FTPzeB6s1EkxX6vsqQeayPbKKfSmkJ+2Sw@mail.gmail.com>
From: Dax Kelson <dkelson@gurulabs.com>
Date: Fri, 10 Jul 2015 16:59:27 -0600
Message-ID: <CAFDa5Q349Nea9whsOejG7oMVHKqt73eKuLO1svLm7uRyut2S4g@mail.gmail.com>
Subject: Re: [linux-lvm] Trying to see a difference in performance with LVM
	Cache
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

On Fri, Jul 10, 2015 at 4:53 PM, Dax Kelson <dkelson@gurulabs.com> wrote:
> My "root" LV is attached to a LVM Cache Pool that is about 900GB in size.
>
> The Origin/Slow LV can do about 560 MB/sec and the Fast/CacheLV can do
> about double that speed.


Here is the speed going directly against the Cache data LV and the OriginLV.

[root@virthost03 tmp]# echo 1 > /proc/sys/vm/drop_caches
[root@virthost03 tmp]# dd if=/dev/mapper/virthost03-CacheLV_cdata
of=/dev/null count=1 skip=30  bs=1GB
1+0 records in
1+0 records out
1000000000 bytes (1.0 GB) copied, 1.08997 s, 917 MB/s
[root@virthost03 tmp]# echo 1 > /proc/sys/vm/drop_caches
[root@virthost03 tmp]# dd if=/dev/mapper/virthost03-root_corig
of=/dev/null count=1 skip=30  bs=1GB
1+0 records in
1+0 records out
1000000000 bytes (1.0 GB) copied, 1.73674 s, 576 MB/s
[root@virthost03 tmp]#

Reading from the CacheLV is slower than even the OriginLV?!?

[root@virthost03 tmp]# echo 1 > /proc/sys/vm/drop_caches
[root@virthost03 tmp]# dd if=/dev/mapper/virthost03-root  of=/dev/null
count=1 skip=30  bs=1GB
1+0 records in
1+0 records out
1000000000 bytes (1.0 GB) copied, 6.77021 s, 148 MB/s
