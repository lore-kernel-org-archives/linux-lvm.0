Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k846o9RU015377
	for <linux-lvm@redhat.com>; Mon, 4 Sep 2006 02:50:09 -0400
Received: from server.webcom.sk (server.webcom.sk [86.110.225.18])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k846o8vl031062
	for <linux-lvm@redhat.com>; Mon, 4 Sep 2006 02:50:08 -0400
Received: from localhost (localhost.webcom.sk [127.0.0.1])
	by server.webcom.sk (Postfix) with ESMTP id 94F1878C60
	for <linux-lvm@redhat.com>; Mon,  4 Sep 2006 08:51:28 +0200 (CEST)
Received: from server.webcom.sk ([127.0.0.1])
	by localhost (mail.webcom.sk [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RrMFyZI-MI37 for <linux-lvm@redhat.com>;
	Mon,  4 Sep 2006 08:51:28 +0200 (CEST)
Received: from [192.168.0.1] (chello082119103193.chello.sk [82.119.103.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by server.webcom.sk (Postfix) with ESMTP id 06CFE78C49
	for <linux-lvm@redhat.com>; Mon,  4 Sep 2006 08:51:27 +0200 (CEST)
Message-ID: <44FBCC9E.2080801@webcom.sk>
Date: Mon, 04 Sep 2006 08:50:06 +0200
From: Roman Fordinal <aben@webcom.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Problem with mapping logical volumes
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
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

I have specific problem after upgrading system packages on my Gentoo box.
- baselayout-1.12.4-r7
- lvm2-2.02.06
- udev-087

The problem is what the block devices can't be created.
vgdisplay don't show me any logical volume in volume group vg0.

but vgscan read correctly metadata from physical volumes:
...
#device/dev-io.c:437         Opened /dev/sda6 RO
#device/dev-io.c:264       /dev/sda6: size is 19534977 sectors
#device/dev-io.c:483         Closed /dev/sda6
#device/dev-io.c:264       /dev/sda6: size is 19534977 sectors
#device/dev-io.c:437         Opened /dev/sda6 RO O_DIRECT
#device/dev-io.c:134         /dev/sda6: block size is 512 bytes
#device/dev-io.c:483         Closed /dev/sda6
#filters/filter-composite.c:31         Using /dev/sda6
#device/dev-io.c:437         Opened /dev/sda6 RO O_DIRECT
#device/dev-io.c:134         /dev/sda6: block size is 512 bytes
#label/label.c:158       /dev/sda6: lvm2 label detected
#cache/lvmcache.c:651         lvmcache: /dev/sda6: now orphaned
#format_text/format-text.c:954         /dev/sda6: Found metadata at 
82432 size 6372 for vg0 (n0vfht-OPSK-FPiM-7JHp-EEDx-XVj3-iLmYZL)
#cache/lvmcache.c:651         lvmcache: /dev/sda6: now in VG vg0
#cache/lvmcache.c:465         lvmcache: /dev/sda6: setting vg0 VGID to 
n0vfhtOPSKFPiM7JHpEEDxXVj3iLmYZL
#cache/lvmcache.c:665         lvmcache: /dev/sda6: VG vg0 now exported
#cache/lvmcache.c:686         lvmcache: /dev/sda6: VG vg0: Set creation 
host to (none).
#device/dev-io.c:483         Closed /dev/sda6
...
...
#metadata/pv_manip.c:241         /dev/sda8 0:      0    680: downloads(0:0)
#metadata/pv_manip.c:241         /dev/sda8 1:    680    512: 
downloads(2048:0)
#metadata/pv_manip.c:241         /dev/sda8 2:   1192    512: opt(1024:0)
#metadata/pv_manip.c:241         /dev/sda8 3:   1704    567: usr(3072:0)
#metadata/pv_manip.c:241         /dev/sda8 4:   2271   2462: media(5864:0)
#metadata/pv_manip.c:241         /dev/sda8 5:   4733      8: opt(1016:0)
#metadata/pv_manip.c:241         /dev/sda8 6:   4741     28: 
downloads(2560:0)
#metadata/pv_manip.c:241         /dev/sda9 0:      0   4571: media(10789:0)
#metadata/pv_manip.c:241         /dev/sda9 1:   4571    198: 
downloads(2588:0)
#metadata/pv_manip.c:241         /dev/sda10 0:      0    201: usr(3639:0)
#metadata/pv_manip.c:241         /dev/sda10 1:    201    512: 
downloads(5120:0)
#metadata/pv_manip.c:241         /dev/sda10 2:    713   1914: media(8326:0)
#metadata/pv_manip.c:241         /dev/sda10 3:   2627   2142: 
downloads(2786:0)
#metadata/pv_manip.c:241         /dev/sda11 0:      0    549: media(10240:0)
#metadata/pv_manip.c:241         /dev/sda11 1:    549    192: 
downloads(4928:0)
#metadata/pv_manip.c:241         /dev/sda11 2:    741    125: temp(0:0)
#metadata/pv_manip.c:241         /dev/sda11 3:    866    256: cache(0:0)
#metadata/pv_manip.c:241         /dev/sda11 4:   1122    512: 
downloads(5632:0)
#metadata/pv_manip.c:241         /dev/sda11 5:   1634   2560: usr(0:0)
#metadata/pv_manip.c:241         /dev/sda11 6:   4194    575: opt(1536:0)
#metadata/pv_manip.c:241         /dev/sda12 0:      0   1280: 
downloads(6144:0)
#metadata/pv_manip.c:241         /dev/sda12 1:   1280   3481: media(0:0)
#metadata/pv_manip.c:241         /dev/sda12 2:   4761      8: opt(2111:0)
#metadata/pv_manip.c:241         /dev/sda13 0:      0   1368: 
downloads(680:0)
#metadata/pv_manip.c:241         /dev/sda13 1:   1368   1016: opt(0:0)
#metadata/pv_manip.c:241         /dev/sda13 2:   2384   2383: media(3481:0)
#metadata/pv_manip.c:241         /dev/sda13 3:   4767      2: opt(2119:0)
#metadata/pv_manip.c:241         /dev/sda14 0:      0    695: opt(2121:0)
#metadata/pv_manip.c:241         /dev/sda14 1:    695    512: media(15360:0)
#metadata/pv_manip.c:241         /dev/sda14 2:   1207    512: usr(2560:0)
#metadata/pv_manip.c:241         /dev/sda14 3:   1719   2560: opt(2816:0)
#metadata/pv_manip.c:241         /dev/sda14 4:   4279    490: temp(125:0)
#metadata/pv_manip.c:241         /dev/sda6 0:      0   1945: temp(615:0)
#metadata/pv_manip.c:241         /dev/sda6 1:   1945    256: 
downloads(7424:0)
#metadata/pv_manip.c:241         /dev/sda6 2:   2201    183: NULL(0:0)
#locking/file_locking.c:59       Unlocking /var/lock/lvm/V_vg0
#device/dev-io.c:483         Closed /dev/sda6
#device/dev-io.c:483         Closed /dev/sda8
#device/dev-io.c:483         Closed /dev/sda9
#device/dev-io.c:483         Closed /dev/sda10
#device/dev-io.c:483         Closed /dev/sda11
#device/dev-io.c:483         Closed /dev/sda12
#device/dev-io.c:483         Closed /dev/sda13
#device/dev-io.c:483         Closed /dev/sda14
     Wiping internal VG cache
