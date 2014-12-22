Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sBMBii3u024108
	for <linux-lvm@redhat.com>; Mon, 22 Dec 2014 06:44:44 -0500
Received: from alukardd.org (alukardd.org [188.134.93.171])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sBMBifXl027384
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 22 Dec 2014 06:44:42 -0500
Received: from alukardd.org ([172.17.0.101]:56513 helo=mail.alukardd.org)
	by alukardd.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84) (envelope-from <alukardd@alukardd.org>)
	id 1Y31Pk-0002Z3-Om
	for linux-lvm@redhat.com; Mon, 22 Dec 2014 14:44:40 +0300
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon, 22 Dec 2014 14:44:40 +0300
From: Alexey <alukardd@alukardd.org>
Message-ID: <5f5b06b173a5fc2bcceadafc579e9a30@alukardd.org>
Subject: [linux-lvm] unremovable lv
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
To: Linux lvm <linux-lvm@redhat.com>

I have a lv in thin pool which I can't delete or activate. It has 
inactive table.

# lvs | grep 15259
   15259      vg0  Vwi---tz-- 160.00g tp0


# lvchange -ay vg0/15259
   15259      vg0  Vwi-i-tz-- 160.00g tp0


# dmsetup table | grep 15259
vg0-15259:


# lvremove --force vg0/15259
   Device vg0-tp0-tpool (254:22) is used by another device.
   Unable to deactivate logical volume "15259"


# dmsetup wipe_table vg0-15259
device-mapper: reload ioctl on vg0-15259 failed: Invalid argument
Command failed


# dmsetup remove vg0-15259
device-mapper: remove ioctl on vg0-15259 failed: No such device or 
address
Command failed

After 'dmsetup remove' I get lv in inactive state as at start.
