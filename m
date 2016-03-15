Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2FMVsGE019147
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 15 Mar 2016 18:31:54 -0400
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
	by mx1.redhat.com (Postfix) with ESMTPS id BF04D1E2A
	for <linux-lvm@redhat.com>; Tue, 15 Mar 2016 22:31:50 +0000 (UTC)
Received: from XCH-RCD-010.cisco.com (xch-rcd-010.cisco.com [173.37.102.20])
	by alln-core-10.cisco.com (8.14.5/8.14.5) with ESMTP id u2FMVnD3006313
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <linux-lvm@redhat.com>; Tue, 15 Mar 2016 22:31:49 GMT
From: "Serguei Bezverkhi (sbezverk)" <sbezverk@cisco.com>
Date: Tue, 15 Mar 2016 22:31:48 +0000
Message-ID: <fd77879855874fabb6174e3c2d5b54e0@XCH-ALN-006.cisco.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] disabling udev_sync and udev_rules
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

Hello folks,

While trying to make lvm work within a docker container I came across an issue when all lvcreate/lvremove got stuck indefinetly or until control-c. When I checked process I noticed lvm was waiting on one semaphore, I found that other folks hit similar issue and they fixed it by setting  udev_sync and udev_rules to 0. It also helped my case too.

I would greatly appreciate if you could share your thought if this change in future can potentially have any negative impact.

Thank you

Serguei
