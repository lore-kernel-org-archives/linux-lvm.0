Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAM51Xq2011228
	for <linux-lvm@redhat.com>; Mon, 22 Nov 2010 00:01:33 -0500
Received: from smtp1.pacifier.net (smtp1.pacifier.net [64.255.237.171])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAM51Hxo020743
	for <linux-lvm@redhat.com>; Mon, 22 Nov 2010 00:01:17 -0500
Received: from laptop.localnet (ip136.133.dsl-acs2.pdx.iinet.com
	[209.20.133.136])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: benscott@nwlink.com)
	by smtp1.pacifier.net (Postfix) with ESMTP id E9B516EF28
	for <linux-lvm@redhat.com>; Sun, 21 Nov 2010 21:01:16 -0800 (PST)
From: ben <benscott@nwlink.com>
Date: Sun, 21 Nov 2010 21:01:14 -0800
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <201011212101.14895.benscott@nwlink.com>
Subject: [linux-lvm] Bug in error code for  lvm_vg_open()
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

If a volume group is clustered and the cluster is not running, lvm_vg_open() 
fails and prints a message about skipping the group. However, lvm_errno() and 
lvm_errmsg() are not updated. It would be really useful (to me) if the error 
number was set to something specific to the clustering issue rather than a 
generic error. 

Also, where are the errors defined or are only the standard system ones being 
used?

Thank you and keep up the good work.
