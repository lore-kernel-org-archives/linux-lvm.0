Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r3LJc0cD015510
	for <linux-lvm@redhat.com>; Sun, 21 Apr 2013 15:38:00 -0400
Received: from smtp1.pacifier.net (smtp1.pacifier.net [64.255.237.171])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r3LJbxHo024039
	for <linux-lvm@redhat.com>; Sun, 21 Apr 2013 15:37:59 -0400
Received: from notebook.localnet (ip136.133.dsl-acs2.pdx.iinet.com
	[209.20.133.136])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: benscott@nwlink.com)
	by smtp1.pacifier.net (Postfix) with ESMTPSA id 008A12CA17
	for <linux-lvm@redhat.com>; Sun, 21 Apr 2013 12:37:58 -0700 (PDT)
From: Ben <benscott@nwlink.com>
Date: Sun, 21 Apr 2013 12:37:12 -0700
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <201304211237.12973.benscott@nwlink.com>
Subject: [linux-lvm] How big can an LVM mirror log get?
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

In my testing of LVM2 I have seen a mirror log up to 512KiB. Does anyone know, 
outside of pathlogical use cases, what the largest mirror log that would be 
created using the default region size? 

Thank you.
