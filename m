Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j7GJgA0l023858
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2005 20:42:10 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1E57K6-0006lK-2m
	for linux-lvm@redhat.com; Tue, 16 Aug 2005 20:42:10 +0100
Date: Tue, 16 Aug 2005 20:42:10 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] vg works fine under FC3, but not FC4
Message-ID: <20050816194210.GO29587@agk.surrey.redhat.com>
References: <20050816190423.GN29587@agk.surrey.redhat.com>
	<20050816194027.34305.qmail@web52201.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050816194027.34305.qmail@web52201.mail.yahoo.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

No - I'm suggesting you need to check if any *whole device* PVs like hdd 
actually have partition tables on them, and if so, remove them.

Alasdair
