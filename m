Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n1R1EJFX015588
	for <linux-lvm@redhat.com>; Thu, 26 Feb 2009 20:14:19 -0500
Received: from mail-fx0-f174.google.com (mail-fx0-f174.google.com
	[209.85.220.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n1R1E3sv005033
	for <linux-lvm@redhat.com>; Thu, 26 Feb 2009 20:14:03 -0500
Received: by fxm22 with SMTP id 22so842120fxm.3
	for <linux-lvm@redhat.com>; Thu, 26 Feb 2009 17:14:03 -0800 (PST)
Date: Fri, 27 Feb 2009 03:13:59 +0200
From: Daniel Iliev <daniel.iliev@gmail.com>
Message-ID: <20090227031359.63e57341@dhcp-143.ilievnet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] ext3 on lvm2 on raid10
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com


Hi, guys


How is the raid10 chunk size related to LVM2 layout and how do ext3's
"stride" and "stripe-width" parameters depend on LVM2?

In more detail:
I've 4 equal HDDs. My intention is to make a raid10, put LVM2 on top
of it and format the LVM volumes with ext3.

stride and stripe-width values are described in MKE2FS(8), but the
case with LVM is not covered there.

Please, point me to some documentation on the subject or advise me how
to proceed.


-- 
Best regards,
Daniel
