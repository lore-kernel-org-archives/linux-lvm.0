Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8BESS5v018040
	for <linux-lvm@redhat.com>; Thu, 11 Sep 2008 10:28:28 -0400
Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m8BESSQW026606
	for <linux-lvm@redhat.com>; Thu, 11 Sep 2008 10:28:28 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1Kdn9o-0006SF-9H
	for linux-lvm@redhat.com; Thu, 11 Sep 2008 15:28:28 +0100
Date: Thu, 11 Sep 2008 15:28:28 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] pvmove abort
Message-ID: <20080911142828.GC24064@agk.fab.redhat.com>
References: <48C92937.9090506@fu-berlin.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <48C92937.9090506@fu-berlin.de>
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

pvmove --abort is the correct way to stop a pvmove.
Then see how much got moved and decide if you want to pvmove it back.

The man page explains how it works, but the data moving happens in
the kernel - in the background if you like - and after the move begins,
the 'pvmove' process just monitors progress and tidies up when the
kernel has finished what it's been asked to do.

Alasdair
-- 
agk@redhat.com
