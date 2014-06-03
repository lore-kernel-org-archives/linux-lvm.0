Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s53FMCAZ025040
	for <linux-lvm@redhat.com>; Tue, 3 Jun 2014 11:22:12 -0400
Received: from mail.botanicus.net (ns362512.ip-91-121-174.eu [91.121.174.40])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s53FMARC023059
	for <linux-lvm@redhat.com>; Tue, 3 Jun 2014 11:22:11 -0400
Date: Tue, 3 Jun 2014 15:22:09 +0000
From: dw+linux-lvm@hmmz.org
Message-ID: <20140603152209.GA13815@k2>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Thin snapshot caching behaviour
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

Hi there,

While playing with LVM thin provisioning, I've noticed that snapshots
seem to have different caching semantics compared to their original thin
LV.

I've hunted everywhere for documentation that describes this difference,
or even an indication of on what layer it occurs, but I can find none.
Perhaps someone here could shed some light?

Thin volume behaves like a regular drive:

    # echo 1 > /proc/sys/vm/drop_caches

    # dd if=/dev/vg0/tv0 of=/dev/null bs=64k count=1000
    65536000 bytes (66 MB) copied, 0.946389 s, 69.2 MB/s

    # dd if=/dev/vg0/tv0 of=/dev/null bs=64k count=1000
    65536000 bytes (66 MB) copied, 0.00810655 s, 8.1 GB/s

Create activated snapshot:

    # lvcreate -kn -s -n tv0s /dev/vg0/tv0
      Logical volume "tv0s" created

    # dd if=/dev/vg0/tv0s of=/dev/null bs=64k count=1000
    65536000 bytes (66 MB) copied, 1.00061 s, 65.5 MB/s

Second dd shows no/very little speedup:

    # time dd if=/dev/vg0/tv0s of=/dev/null bs=64k count=1000
    65536000 bytes (66 MB) copied, 0.921402 s, 71.1 MB/s

Thanks,


David
