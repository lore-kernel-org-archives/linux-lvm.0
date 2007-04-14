Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l3EEqptw024496
	for <linux-lvm@redhat.com>; Sat, 14 Apr 2007 15:52:51 +0100
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1HcjcR-0006T3-4E
	for linux-lvm@redhat.com; Sat, 14 Apr 2007 15:52:51 +0100
Date: Sat, 14 Apr 2007 15:52:51 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Limitation: Snapshots does not work in cluster
	enviroment ?
Message-ID: <20070414145250.GI26983@agk.fab.redhat.com>
References: <4620D7E3.9090609@dtnet.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4620D7E3.9090609@dtnet.de>
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

On Sat, Apr 14, 2007 at 03:32:19PM +0200, Daniel Schwager wrote:
> So, is it not possible to create a LVM2 snapshot on one server and use
> it in another server ?
 
Not simultaneously.  Origin+Snapshot(s) can only be used on one machine
at once.

> QUESTION: Is this limitation also valid for my verion:
 
These are limitiations of the kernel implementation, not userspace.

Alasdair
-- 
agk@redhat.com
