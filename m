Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j85KF9Bq010778
	for <linux-lvm@redhat.com>; Mon, 5 Sep 2005 21:15:09 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1ECNMz-0004z3-UB
	for linux-lvm@redhat.com; Mon, 05 Sep 2005 21:15:09 +0100
Date: Mon, 5 Sep 2005 21:15:09 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Please help with lvextend problems
Message-ID: <20050905201509.GA15141@agk.surrey.redhat.com>
References: <431C5034.6040604@ngi.it>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <431C5034.6040604@ngi.it>
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

On Mon, Sep 05, 2005 at 04:03:32PM +0200, Bob Alexander wrote:
> Internal error: PV segments corrupted in vg1
 
No - that's an assertion that triggers as the last thing
*before* any metadata changes are made on disk.

First check you're using the latest lvm2 package.
(Run 'lvm version')

Alasdair
-- 
agk@redhat.com
