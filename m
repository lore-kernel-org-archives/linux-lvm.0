Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p27DCWC6008411
	for <linux-lvm@redhat.com>; Mon, 7 Mar 2011 08:12:33 -0500
Received: from smtpo05.poczta.onet.pl (smtpo05.poczta.onet.pl
	[213.180.142.136])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p27DCLZT015339
	for <linux-lvm@redhat.com>; Mon, 7 Mar 2011 08:12:22 -0500
Received: from localhost.localdomain (unknown [83.238.22.2])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: sdrb@onet.eu)
	by smtp.poczta.onet.pl (Onet) with ESMTPSA id 4F4AA200781EF
	for <linux-lvm@redhat.com>; Mon,  7 Mar 2011 14:12:20 +0100 (CET)
Message-ID: <4D74D9AC.4060800@onet.eu>
Date: Mon, 07 Mar 2011 14:12:12 +0100
From: sdrb <sdrb@onet.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Question about setting of UUID
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
To: linux-lvm@redhat.com


Hello,

I have got question regarding setting of UUID for PV, VG and LV.

I'd like to ask if there are any plans to add possibility of manual 
setting and changing UUIDs?
I mean if it could be possible to change UUID of PV just by typing:

   # pvchange -s aaaaaaaabbbbbbbbccccccccdddddddd /dev/sdb

and analogous changes in lvchange and vgchange?

There are some situations when it could be very helpful.
