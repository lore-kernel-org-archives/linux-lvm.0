Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id rA6F4dti029874
	for <linux-lvm@redhat.com>; Wed, 6 Nov 2013 10:04:39 -0500
Received: from SMTP02.CITRIX.COM (smtp02.citrix.com [66.165.176.63])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rA6F4bQH002552
	for <linux-lvm@redhat.com>; Wed, 6 Nov 2013 10:04:37 -0500
From: Thanos Makatos <thanos.makatos@citrix.com>
Date: Wed, 6 Nov 2013 15:04:34 +0000
Message-ID: <2368A3FCF9F7214298E53C823B0A48EC0B012F@AMSPEX01CL02.citrite.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] maximum length of logical volume name
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

It seems that the maximum name length of a logical volume is 127 bytes (discovered by trial and error). Just to make sure we're using the correct value, is this value documented somewhere? Is it possible to retrieve it at run-time?

--
Thanos Makatos
Software Engineer (XenServer Storage)
Citrix Systems Ltd.
Cambridge, UK
