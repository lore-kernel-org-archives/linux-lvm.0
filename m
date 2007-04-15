Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l3F4Bc6B005127
	for <linux-lvm@redhat.com>; Sun, 15 Apr 2007 05:11:38 +0100
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1Hcw5S-0005Au-OI
	for linux-lvm@redhat.com; Sun, 15 Apr 2007 05:11:38 +0100
Date: Sun, 15 Apr 2007 05:11:38 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Limitation: Snapshots does not work
	in	cluster	enviroment ?
Message-ID: <20070415041138.GL26983@agk.fab.redhat.com>
References: <4620D7E3.9090609@dtnet.de>
	<20070414145250.GI26983@agk.fab.redhat.com>
	<4620E73F.50100@dtnet.de>
	<20070414152407.GK26983@agk.fab.redhat.com>
	<4620F6F1.8020906@dtnet.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4620F6F1.8020906@dtnet.de>
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

On Sat, Apr 14, 2007 at 05:44:49PM +0200, Daniel Schwager wrote:
> So, thank you very much for your detailed explanation. Would
> an implementaion change on "dmsetup" also solve the "Limitation of 32 
> snapshots" ?

Yes - that is a in-use per-machine limitation, and you'd only
be using one snapshot on each machine.

Alasdair
-- 
agk@redhat.com
