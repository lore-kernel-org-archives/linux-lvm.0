Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4I9qV016794
	for <linux-lvm@redhat.com>; Tue, 18 May 2004 05:52:31 -0400
Received: from pegasus.siol.net (pegasus.siol.net [193.189.160.40])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i4I9qUGG006968
	for <linux-lvm@redhat.com>; Tue, 18 May 2004 05:52:30 -0400
Received: from kudu.siol.net ([10.10.10.22]) by pegasus.siol.net
	(InterMail vK.4.03.05.03 201-232-132-103 license
	1cbf71897a39210db31154c99f0b4628)
	with ESMTP id <20040518095229.QWOO20077.pegasus@kudu.siol.net>
	for <linux-lvm@redhat.com>; Tue, 18 May 2004 11:52:29 +0200
Received: from vector ([193.77.156.30]) by kudu.siol.net
	(InterMail vK.4.03.05.03 201-232-132-103 license
	1cbf71897a39210db31154c99f0b4628)
	with SMTP id <20040518095228.VIZF24754.kudu@vector>
	for <linux-lvm@redhat.com>; Tue, 18 May 2004 11:52:28 +0200
Message-ID: <001601c43cbd$d4ad4ff0$0400a8c0@vector>
From: "Perplexer" <perplexer@thz.net>
Date: Tue, 18 May 2004 11:52:27 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] VG LV reduce
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi.

Here's a pretty basic question again since I think I have never been
able to get the proper answer to it.

I got several drives (partitions) in VG with one LV extending through it.
Now one HD died. How can I remove the bad HD from the VG and
resize (shrink) the LV so I will be able to continue using the VG/LV.
Saving data is not necessary. I just need to remove the bad drive and
carry one normally with the remaining ones in this VG. I have NO extra
drive I can use pvmove with or anything. The basic question is: is there a solution ?

Thanks.

---------
Perplexer
