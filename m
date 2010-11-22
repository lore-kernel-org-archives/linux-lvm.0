Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oAM6YeCn021999
	for <linux-lvm@redhat.com>; Mon, 22 Nov 2010 01:34:40 -0500
Received: from smtp1.pacifier.net (smtp1.pacifier.net [64.255.237.171])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAM6YPmm032425
	for <linux-lvm@redhat.com>; Mon, 22 Nov 2010 01:34:26 -0500
Received: from laptop.localnet (ip136.133.dsl-acs2.pdx.iinet.com
	[209.20.133.136])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: benscott@nwlink.com)
	by smtp1.pacifier.net (Postfix) with ESMTP id 7C0AE6EF3D
	for <linux-lvm@redhat.com>; Sun, 21 Nov 2010 22:34:25 -0800 (PST)
From: ben <benscott@nwlink.com>
Date: Sun, 21 Nov 2010 22:34:20 -0800
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <201011212234.20129.benscott@nwlink.com>
Subject: [linux-lvm] bug in lvm2app get_property value
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

For some reason the following functions return different numbers for single 
segment volumes:

    value = lvm_lv_get_property(lvm_lv, "lv_size");
    value = lvm_lvseg_get_property(lvm_lvseg, "seg_size");

The first function seems to be correct while the second one returns the same 
value divided by 512?

Thank you.
