Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j68Ee63N002101
	for <linux-lvm@redhat.com>; Fri, 8 Jul 2005 15:40:06 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1Dqu1O-0000VB-AD
	for linux-lvm@redhat.com; Fri, 08 Jul 2005 15:40:06 +0100
Date: Fri, 8 Jul 2005 15:40:06 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Moving PEs within a PV for defragmentation
Message-ID: <20050708144006.GR12337@agk.surrey.redhat.com>
References: <20050708143331.GA15561@wavehammer.waldi.eu.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050708143331.GA15561@wavehammer.waldi.eu.org>
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
To: linux-lvm@redhat.com

On Fri, Jul 08, 2005 at 04:33:31PM +0200, Bastian Blank wrote:
> Is their a reason why pvmove refuses to move PEs within one PV?

Does --alloc anywhere help?
(see an old Debian bug report)

Alasdair
-- 
agk@redhat.com
