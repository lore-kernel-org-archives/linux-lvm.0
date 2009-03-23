Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2NFctnX016483
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2009 11:38:55 -0400
Received: from mx03.syneticon.net (mx03.syneticon.net [78.111.66.105])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n2NFcJK9018951
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2009 11:38:19 -0400
Received: from localhost (filter1.syneticon.net [192.168.113.83])
	by mx03.syneticon.net (Postfix) with ESMTP id A39F435E1A
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2009 16:38:18 +0100 (CET)
Received: from mx03.syneticon.net ([192.168.113.84])
	by localhost (mx03.syneticon.net [192.168.113.83]) (amavisd-new,
	port 10025) with ESMTP id DWxgGKO8dEUA for <linux-lvm@redhat.com>;
	Mon, 23 Mar 2009 16:38:14 +0100 (CET)
Received: from [192.168.10.145] (koln-4db489a7.pool.einsundeins.de
	[77.180.137.167]) by mx03.syneticon.net (Postfix) with ESMTPSA
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2009 16:38:14 +0100 (CET)
Message-ID: <49C7ACE1.4070000@wpkg.org>
Date: Mon, 23 Mar 2009 16:38:09 +0100
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] why LVM reads when I tell it to write?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Why is LVM reading large amounts of data when I tell it to write only?


For example, this is what iostat shows when writing to a raw partition
(when doing "dd if=/dev/zero of=/dev/sdb5", iostat output every second):

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sdb              80.81         0.00      5171.72          0       5120

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sdb              78.00         0.00      4992.00          0       4992

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sdb              81.82         0.00      5236.36          0       5184

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sdb              77.00         0.00      4928.00          0       4928

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sdb              79.21         0.00      5069.31          0       5120


This is what happens if we go through LVM - look how much is read before 
it actually writes anything:

(when doing "dd if=/dev/zero of=/dev/test/test_volume").

What's interesting, if I add i.e. bs=64k to dd, I don't see these unexpected
reads on LVM any more. Why does it happen?


Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sdb             212.87       851.49         0.00        860          0

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sdb             956.57      3826.26         0.00       3788          0

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sdb            1083.84      4335.35         0.00       4292          0

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sdb            1016.00      4064.00         0.00       4064          0

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sdb            1035.64      4142.57         0.00       4184          0

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sdb            1034.00      4136.00         0.00       4136          0

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sdb             965.66      3862.63         0.00       3824          0

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sdb            1025.00      4100.00         0.00       4100          0

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sdb             991.92      3967.68         0.00       3928          0

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sdb            1032.00      4128.00         0.00       4128          0

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sdb            1009.90      4039.60         0.00       4080          0

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sdb             366.33      1330.61      4040.82       1304       3960

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sdb            1016.16      4060.61        76.77       4020         76

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sdb             383.17      1394.06      4055.45       1408       4096

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sdb             741.00      2904.00      1800.00       2904       1800

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sdb             638.61      2475.25      2273.27       2500       2296

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sdb             421.00      1560.00      3720.00       1560       3720

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sdb             955.56      3802.02       501.01       3764        496

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sdb             275.76       965.66      4016.16        956       3976

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sdb             853.00      3384.00       840.00       3384        840

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sdb             560.40      2130.69      3223.76       2152       3256

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sdb             500.00      1907.07      2787.88       1888       2760

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sdb             133.00       352.00      5296.00        352       5296

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sdb              53.00         0.00      6244.00          0       6244

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sdb             267.00       904.00      4840.00        904       4840

Device:            tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sdb              52.00         0.00      6240.00          0       6240



-- 
Tomasz Chmielewski
http://wpkg.org
