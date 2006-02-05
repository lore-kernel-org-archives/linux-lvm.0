Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k15GGC120514
	for <linux-lvm@redhat.com>; Sun, 5 Feb 2006 11:16:12 -0500
Received: from hetzner.email-server.info (new.email-server.info
	[213.133.109.44])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k15GG774021002
	for <linux-lvm@redhat.com>; Sun, 5 Feb 2006 11:16:09 -0500
Received: from hd.bei.digitalprojects.com (e182061167.adsl.alicedsl.de
	[85.182.61.167])
	by hetzner.email-server.info (Postfix) with ESMTP id 48D6B274006
	for <linux-lvm@redhat.com>; Sun,  5 Feb 2006 17:16:09 +0100 (CET)
Received: from [192.168.1.10] (blatt.bei.digitalprojects.com [192.168.1.10])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by hd.bei.digitalprojects.com (Postfix) with ESMTP id B31EBB8C09A
	for <linux-lvm@redhat.com>; Sun,  5 Feb 2006 17:15:59 +0100 (CET)
Message-ID: <43E624B1.30805@mid.email-server.info>
Date: Sun, 05 Feb 2006 17:15:45 +0100
From: Alexander Skwar <listen@alexander.skwar.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Defragmenting a VG
Reply-To: linux-lvm@redhat.com
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

Hello!

Does anyone know of a tool for LVM2 which defragments a VG, so
that the PEs of the LVs are consecutive?

Thanks,

Alexander Skwar
-- 
At some point, bits have to go into packets and routers need to make
decisions on them. Changes at that level is what I want to hear about, not
strategic company relationships.
        -- John Carmack
