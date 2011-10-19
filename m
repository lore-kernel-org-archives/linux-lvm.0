Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p9JCmPot006420
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2011 08:48:25 -0400
Received: from mx-out.ocsa-data.net (mx-out.ocsa-data.net [194.36.166.37])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9JCmOXl000654
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2011 08:48:24 -0400
Received: from [127.0.0.1] (helo=localhost)
	by mx-out.ocsa-data.net with esmtp (Exim - FreeBSD Rulez)
	id 1RGVZs-0002zi-CZ
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2011 14:49:01 +0200
Received: from mx-out.ocsa-data.net ([127.0.0.1])
	by localhost (node2-3.ouvaton.local [127.0.0.1]) (amavisd-new,
	port 10028) with ESMTP id VTLvZkEX6tAX for <linux-lvm@redhat.com>;
	Wed, 19 Oct 2011 14:49:00 +0200 (CEST)
Received: from [88.183.94.176] (helo=[192.168.2.34])
	by mx-out.ocsa-data.net with esmtpsa (Exim - FreeBSD Rulez)
	id 1RGVZs-0002zY-Aw
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2011 14:49:00 +0200
From: Yann Droneaud <yann@droneaud.fr>
Date: Wed, 19 Oct 2011 14:48:20 +0200
Content-Transfer-Encoding: 7bit
Message-ID: <1319028502.1827.24.camel@deela.quest-ce.net>
Mime-Version: 1.0
Subject: [linux-lvm] lvmtrim
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi,

Is there any tool for LVM like fstrim(8) (which would likely be called
"lvmtrim") ?

http://thread.gmane.org/gmane.linux.utilities.util-linux-ng/3695

This tool would discard currently unused PE of an active VG like
fstrim(8) is doing on ext4,btrfs,xfs blocks (depending on filesystem
support).

Regards.

-- 
Yann Droneaud
