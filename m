Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p4N6xG2w027392
	for <linux-lvm@redhat.com>; Mon, 23 May 2011 02:59:16 -0400
Received: from smtp1.pacifier.net (smtp1.pacifier.net [64.255.237.171])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p4N6xGY4007579
	for <linux-lvm@redhat.com>; Mon, 23 May 2011 02:59:16 -0400
Received: from laptop.localnet (ip136.133.dsl-acs2.pdx.iinet.com
	[209.20.133.136])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: benscott@nwlink.com)
	by smtp1.pacifier.net (Postfix) with ESMTP id C7B516EF13
	for <linux-lvm@redhat.com>; Sun, 22 May 2011 23:59:15 -0700 (PDT)
From: ben <benscott@nwlink.com>
Date: Sun, 22 May 2011 23:59:08 -0700
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <201105222359.09075.benscott@nwlink.com>
Subject: [linux-lvm] lvm2app feature request
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

What I am looking for is a way to get a pointer to the parent mirror if I have 
a pointer to a mirror leg or a mirror log. Right now I am getting it by 
breaking down the mirror leg's name to get the parent's name but that doesn't 
always work when the volume has been renamed.

Thank you.
