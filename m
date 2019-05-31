Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D58A761D0E
	for <linux-lvm@redhat.com>; Fri, 31 May 2019 13:17:00 +0000 (UTC)
Received: from mr011msb.fastweb.it (mr011msb.fastweb.it [85.18.95.108])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DD86A3179B6C
	for <linux-lvm@redhat.com>; Fri, 31 May 2019 13:16:40 +0000 (UTC)
Received: from ceres.assyoma.it (93.63.55.57) by mr011msb.fastweb.it (5.8.208)
	id 5CC3FE0203658ACC for linux-lvm@redhat.com;
	Fri, 31 May 2019 15:13:46 +0200
Received: from gdanti-lenovo.assyoma.it (unknown [172.31.255.5])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ceres.assyoma.it (Postfix) with ESMTPSA id 6AD1D254861
	for <linux-lvm@redhat.com>; Fri, 31 May 2019 15:13:46 +0200 (CEST)
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <93f53408-2f37-dec3-5c68-deef021f530c@assyoma.it>
Date: Fri, 31 May 2019 15:13:41 +0200
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Fast thin volume preallocation?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi all,
doing some tests on a 4-bays, entry-level NAS/SAN system, I discovered 
it is entirely based on lvm thin volumes.

On configuring what it calls "thick volumes" it create a new thin 
logical volume and pre-allocates all space inside the new volume.

What surprised me is the speed at which this allocation happens: a 2 TB 
volume was allocated (ie: all data chunks were touched) in about 2 min. 
This immediately exclude any simple zeroing of the volume, which will 
require much more time.

I tried on a regular CentOS box + lvmthin with lvm zeroing disabled and, 
indeed, allocating all blocks inside a thin volume requires much more 
time. I tried both a very simple "dd if=/dev/zero of=/dev/test/thinvol 
bs=1M oflag=direct" and "blkdiscard -z /dev/test/thinvol".

Being curious, I found that the NAS use a binary [1] that seems to 
create a pattern of null writes with extremely high queue depth [2].

So, my questions:
- for what you know, are commercial NAS using some patched/custom 
lvmthin version which enables fast volume preallocation, or early zero 
rejection?
- does standard lvmthin support something similar? If not, how do you 
see a zero coalesce/compression/trim/whatever feature?
- can I obtain something similar by simply touching (maybe with a 512B 
only write) once each thin chunk?

Thanks.

[1] I am not calling it because I don't know if discovering the binary, 
and so the NAS vendor, is contrary to this mailing list policy.

[2] iostat -x 1 produces the following example output. Please see how 
*no* writes are passed on backing devices:

    extended device statistics
device mgr/s mgw/s    r/s    w/s    kr/s    kw/s   size queue   wait 
svc_t  %b
sda        0     0  105.2    0.0   841.3     0.0    8.0   0.0    0.2 
0.2   2
sdb        0     0   62.9    0.0   503.2     0.0    8.0   0.0    0.2 
0.2   1
sdd        0     0  124.8    0.0   998.5     0.0    8.0   0.0    0.0 
0.0   0
sdc        0     0  119.9    0.0   959.2     0.0    8.0   0.0    0.2 
0.2   2
mtdblock0     0     0    0.0    0.0     0.0     0.0    0.0   0.0    0.0 
  0.0   0
mtdblock1     0     0    0.0    0.0     0.0     0.0    0.0   0.0    0.0 
  0.0   0
mtdblock2     0     0    0.0    0.0     0.0     0.0    0.0   0.0    0.0 
  0.0   0
mtdblock3     0     0    0.0    0.0     0.0     0.0    0.0   0.0    0.0 
  0.0   0
mtdblock4     0     0    0.0    0.0     0.0     0.0    0.0   0.0    0.0 
  0.0   0
mtdblock5     0     0    0.0    0.0     0.0     0.0    0.0   0.0    0.0 
  0.0   0
mtdblock6     0     0    0.0    0.0     0.0     0.0    0.0   0.0    0.0 
  0.0   0
md9        0     0    0.0    0.0     0.0     0.0    0.0   0.0    0.0 
0.0   0
md13       0     0    0.0    0.0     0.0     0.0    0.0   0.0    0.0 
0.0   0
md256      0     0    0.0    0.0     0.0     0.0    0.0   0.0    0.0 
0.0   0
md322      0     0    0.0    0.0     0.0     0.0    0.0   0.0    0.0 
0.0   0
md1        0     0  412.8    0.0  3302.2     0.0    8.0   0.0    0.0 
0.0   0
dm-1       0     0  412.8    0.0  3302.2     0.0    8.0   0.0    0.1 
0.1   5
dm-2       0     0    0.0    0.0     0.0     0.0    0.0   0.0    0.0 
0.0   0
dm-3       0     0    0.0    0.0     0.0     0.0    0.0   0.0    0.0 
0.0   0
dm-4       0     0    0.0    0.0     0.0     0.0    0.0   0.0    0.0 
0.0   0
dm-5       0     0    0.0    0.0     0.0     0.0    0.0   0.0    0.0 
0.0   0
dm-6       0     0    0.0    0.0     0.0     0.0    0.0   0.0    0.0 
0.0   0
dm-7       0     0    0.0    0.0     0.0     0.0    0.0   0.0    0.0 
0.0   0
dm-8       0     0    0.0    0.0     0.0     0.0    0.0   1.0    0.0 
0.0  99
dm-0       0     0    0.0    0.0     0.0     0.0    0.0   1.0    0.0 
0.0  99
dm-9       0     0    0.0    0.0     0.0     0.0    0.0 345966.5    0.0 
  0.0  99
dm-10      0     0    0.0    0.0     0.0     0.0    0.0   0.0    0.0 
0.0   0

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
