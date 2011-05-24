Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p4O3xBOh032703
	for <linux-lvm@redhat.com>; Mon, 23 May 2011 23:59:11 -0400
Received: from new-smtp01.pacifier.net (new-smtp01.pacifier.net
	[64.255.237.177])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p4O3x9eO011417
	for <linux-lvm@redhat.com>; Mon, 23 May 2011 23:59:09 -0400
Received: from laptop.localnet (ip136.133.dsl-acs2.pdx.iinet.com
	[209.20.133.136])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: benscott@nwlink.com)
	by new-smtp01.pacifier.net (Postfix) with ESMTPSA id 14DDF2CA00
	for <linux-lvm@redhat.com>; Mon, 23 May 2011 20:59:09 -0700 (PDT)
From: ben <benscott@nwlink.com>
Date: Mon, 23 May 2011 20:59:03 -0700
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <201105232059.03351.benscott@nwlink.com>
Subject: [linux-lvm] lvm2app: another bad value returned
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

Using the following function call only works when a 
snapshot is active:

value = lvm_lv_get_property(lvm_lv, "snap_percent");

That much seems resonable but "value.is_valid" returns 
true even thought the number is bad.

Thank you.
