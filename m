Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i84Ck5325600
	for <linux-lvm@redhat.com>; Sat, 4 Sep 2004 08:46:05 -0400
Received: from ml1.melster-langhoff.de (rev.63-77-246-83.vpsadmin.de
	[83.246.77.63] (may be forged))
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i84Cjxw0017151
	for <linux-lvm@redhat.com>; Sat, 4 Sep 2004 08:46:00 -0400
From: ron@melster.de
Content-Transfer-Encoding: 8bit
Message-Id: <20040904124557.4592E3568033@ml1.melster-langhoff.de>
Date: Sat,  4 Sep 2004 14:45:57 +0200 (CEST)
Subject: [linux-lvm] How to restore a logical volume
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hello,
I have a volume group called "vg0" which had a logical volume "lv".

I _accidently_ removed the logical volume and would like to know the
command. I considered using lvextend but didn't know if this would
delete my data which were in lv.

Thanks very much in advance,
Ron
