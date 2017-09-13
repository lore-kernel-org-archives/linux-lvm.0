Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0951D5D724
	for <linux-lvm@redhat.com>; Wed, 13 Sep 2017 15:33:11 +0000 (UTC)
Received: from st41p57im-ztfb14250501.me.com (st41p57im-ztfb14250501.me.com
	[17.36.64.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 41FA980F94
	for <linux-lvm@redhat.com>; Wed, 13 Sep 2017 15:33:10 +0000 (UTC)
Received: from process-dkim-sign-daemon.st41p57im-ztfb14250501.me.com by
	st41p57im-ztfb14250501.me.com
	(Oracle Communications Messaging Server 8.0.1.2.20170607 64bit (built
	Jun 7 2017)) id <0OW8002005E56200@st41p57im-ztfb14250501.me.com> for
	linux-lvm@redhat.com; Wed, 13 Sep 2017 15:33:09 +0000 (GMT)
Received: from icloud.com ([127.0.0.1]) by st41p57im-ztfb14250501.me.com
	(Oracle Communications Messaging Server 8.0.1.2.20170607 64bit (built
	Jun 7
	2017)) with ESMTPSA id <0OW800EV35V62H50@st41p57im-ztfb14250501.me.com>
	for linux-lvm@redhat.com; Wed, 13 Sep 2017 15:33:07 +0000 (GMT)
From: Dale Stephenson <dalestephenson@mac.com>
MIME-version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Message-id: <C28D2468-1843-4019-A503-E566A305977D@mac.com>
Date: Wed, 13 Sep 2017 11:33:05 -0400
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Performance penalty for 4k requests on thin provisioned
	volume
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Distribution: centos-release-7-3.1611.el7.centos.x86_64
Kernel: Linux 3.10.0-514.26.2.el7.x86_64
LVM: 2.02.166(2)-RHEL7 (2016-11-16)

Volume group consisted of an 8-drive SSD (500G drives) array, plus an additional SSD of the same size.  The array had 64 k stripes.
Thin pool had -Zn option and 512k chunksize (full stripe), size 3T with metadata volume 16G.  data was entirely on the 8-drive raid, metadata was entirely on the 9th drive.
Virtual volume “thin” was 300 GB.  I also filled it with dd so that it would be fully provisioned before the test.
Volume “thick” was also 300GB, just an ordinary volume also entirely on the 8-drive array.

Four tests were run directlyagainst each volume using fio-2.2.8, random read, random write, sequential read, sequential write.  Single thread, 4k blocksize, 90s run time.

The thin volume should much worse performance in this test:

Thin:
Random read : io=51607MB, bw=587168KB/s, iops=146792, runt= 90001msec
Random write: io=46530MB, bw=529406KB/s, iops=132351, runt= 90001msec
Sequential read : io=176561MB, bw=1961.7MB/s, iops=10462, runt= 90006msec
Sequential write: io=162451MB, bw=1804.1MB/s, iops=9626, runt= 90006msec

Thick:
Random read : io=88350MB, bw=981.68MB/s, iops=251303, runt= 90001msec
Random write: io=77905MB, bw=886372KB/s, iops=221592, runt= 90001msec
Sequential read : io=89095MB, bw=989.96MB/s, iops=253421, runt= 90001msec
Sequential write: io=77742MB, bw=884520KB/s, iops=221130, runt= 90001msec

As you can see, the number of iops for the thin-provisioned volume is dramatically less than for thick volumes.  With the default 64k chunk size this is also true.

Running the same fio test with 512k request size shows similar performance for thick and thin volumes, so the maximum potential throughput of the thin volume seems broadly similar to thin volumes.  But I’d like the maximum number of iops to at least be within shouting distance of thick volumes.  Is there anything that can be done to improve that with either this version of lvm/device-mapper or later versions?  I typically use xfs on top of volumes, and xfs is very fond of 4k requests.

Dale Stephenson
