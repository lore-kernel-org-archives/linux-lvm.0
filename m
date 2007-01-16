Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l0GMnXhg022650
	for <linux-lvm@redhat.com>; Tue, 16 Jan 2007 17:49:33 -0500
Received: from itspmx2.state.ms.us (itspmx2.state.ms.us [205.144.224.112])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l0GMnXfN026166
	for <linux-lvm@redhat.com>; Tue, 16 Jan 2007 17:49:33 -0500
Received: from rray.drdc.mstc.ms.gov ([10.3.192.2])
	by itspmx2.state.ms.us (8.13.4/8.13.4) with ESMTP id l0GMnRqd021058
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 16 Jan 2007 16:49:32 -0600 (CST)
Received: from rray.drdc.mstc.ms.gov (localhost.localdomain [127.0.0.1])
	by rray.drdc.mstc.ms.gov (8.13.8/8.13.6) with ESMTP id l0GMnQIS002297
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 16 Jan 2007 16:49:26 -0600
Received: from localhost (rray@localhost)
	by rray.drdc.mstc.ms.gov (8.13.8/8.13.8/Submit) with ESMTP id
	l0GMnQVX002294
	for <linux-lvm@redhat.com>; Tue, 16 Jan 2007 16:49:26 -0600
Date: Tue, 16 Jan 2007 16:49:26 -0600 (CST)
From: Richard Ray <rray@mstc.state.ms.us>
Message-ID: <Pine.LNX.4.64.0701161644370.22063@rray.drdc.mstc.ms.gov>
MIME-Version: 1.0
Subject: [linux-lvm] MAX LV
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I'm not having a problem just not able to find documentation.
Using vgdisplay shows MAX LV 0 on volume groups.
I understand that this is the maximum number of logical volumes for this 
volume group.
Does 0 mean unlimited?
I haven't been able to find documentation for the details.

Thanks
Richard
