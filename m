Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nAHMdIpi032015
	for <linux-lvm@redhat.com>; Tue, 17 Nov 2009 17:39:49 -0500
Received: from moutng.kundenserver.de (moutng.kundenserver.de [212.227.17.9])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nAHMc9Bv012186
	for <linux-lvm@redhat.com>; Tue, 17 Nov 2009 17:38:52 -0500
Received: from localhost ([127.0.0.1])
	by bogon.housecafe.de with esmtp (Exim 4.69)
	(envelope-from <lists@nerdbynature.de>) id 1NAWga-0000W5-GU
	for linux-lvm@redhat.com; Tue, 17 Nov 2009 23:38:08 +0100
Date: Tue, 17 Nov 2009 14:38:08 -0800 (PST)
From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: [linux-lvm] deduplication, at LVM level or FS level?
In-Reply-To: <951302003.8081441258409372728.JavaMail.root@crono>
Message-ID: <alpine.DEB.2.01.0911171434290.27639@bogon.housecafe.de>
References: <951302003.8081441258409372728.JavaMail.root@crono>
MIME-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 16 Nov 2009 at 17:09, Anthony Clark wrote:
> Should dedup happen at the filesystem level or the LVM level?

Along with the recent announcement of ZFS dedup, Jeff Bonwick listed a few 
pros/cons of different dedup approaches: 
http://blogs.sun.com/bonwick/entry/zfs_dedup
("What to dedup: Files, blocks, or bytes?")

HTH,
C.
-- 
BOFH excuse #441:

Hash table has woodworm
