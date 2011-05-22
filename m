Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p4MLc4R1031378
	for <linux-lvm@redhat.com>; Sun, 22 May 2011 17:38:04 -0400
Received: from smtp2.pacifier.net (smtp2.pacifier.net [64.255.237.172])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p4MLc3DE021433
	for <linux-lvm@redhat.com>; Sun, 22 May 2011 17:38:03 -0400
Received: from laptop.localnet (ip136.133.dsl-acs2.pdx.iinet.com
	[209.20.133.136])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: benscott@nwlink.com)
	by smtp2.pacifier.net (Postfix) with ESMTP id C42856A42C
	for <linux-lvm@redhat.com>; Sun, 22 May 2011 14:38:02 -0700 (PDT)
From: ben <benscott@nwlink.com>
Date: Sun, 22 May 2011 14:37:56 -0700
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <201105221437.56554.benscott@nwlink.com>
Subject: [linux-lvm] lvm2app lvm properties properties returns bad values.
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
Content-Type: Text/Plain; charset="us-ascii"
To: linux-lvm@redhat.com

There is a problem with getting "lv_kernel_major",  "lv_major"
and minor. The issue seems to be that the numbers can be negative (-1) while 
the union only holds an unsigned 64 bit integer.

for instance this returns junk if "lv_kernel_major" is -1:

value = lvm_lv_get_property(lvm_lv, "lv_kernel_major");

Thank you.
benscott@nwlink.com
