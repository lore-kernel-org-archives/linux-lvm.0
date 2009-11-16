Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nAGM9nJs020288
	for <linux-lvm@redhat.com>; Mon, 16 Nov 2009 17:09:49 -0500
Received: from magus.merit.edu (magus.merit.edu [198.108.1.13])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nAGM9Xoh011093
	for <linux-lvm@redhat.com>; Mon, 16 Nov 2009 17:09:33 -0500
Received: from localhost (localhost [127.0.0.1])
	by magus.merit.edu (Postfix) with ESMTP id F2F11225CBD
	for <linux-lvm@redhat.com>; Mon, 16 Nov 2009 17:09:32 -0500 (EST)
Received: from magus.merit.edu ([127.0.0.1])
	by localhost (magus.merit.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xGgjGir8HCuL for <linux-lvm@redhat.com>;
	Mon, 16 Nov 2009 17:09:32 -0500 (EST)
Received: from crono.merit.edu (crono.merit.edu [198.108.1.12])
	by magus.merit.edu (Postfix) with ESMTP id C5E1C2255FD
	for <linux-lvm@redhat.com>; Mon, 16 Nov 2009 17:09:32 -0500 (EST)
Date: Mon, 16 Nov 2009 17:09:32 -0500 (EST)
From: Anthony Clark <anthony@merit.edu>
Message-ID: <951302003.8081441258409372728.JavaMail.root@crono>
In-Reply-To: <2112453070.8081291258409320087.JavaMail.root@crono>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] deduplication, at LVM level or FS level?
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi All,

I'm dealing with ever-larger HSM and backups, as I'm sure many of us are.  I was wondering where the "best" place to perform data deduplication was? (compression, ha!)

Should dedup happen at the filesystem level or the LVM level?  I'm somewhat motivated to try to shoehorn lessfs' code into something that doesn't require FUSE, but I'm still at the early stages of examining this.

Anyone doing anything similar?

Thanks

Anthony
