Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id iBCHRYH6023815
	for <linux-lvm@redhat.com>; Sun, 12 Dec 2004 17:27:34 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CdXVO-0002E1-FR
	for linux-lvm@redhat.com; Sun, 12 Dec 2004 17:27:34 +0000
Date: Sun, 12 Dec 2004 17:27:34 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] shrink pv without pvresize (FC3 LVM)
Message-ID: <20041212172734.GN11338@agk.surrey.redhat.com>
References: <41BA294D.5090605@pitt.edu>
	<20041212172429.GM11338@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20041212172429.GM11338@agk.surrey.redhat.com>
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

On Sun, Dec 12, 2004 at 05:24:29PM +0000, Alasdair G Kergon wrote:
> Only change pe_count for the PV you're resizing and nothing else!
 
And I forgot to say the obvious: if you're shrinking a PV, be sure
to pvmove any data off the part you're removing first:-)

If you've only one PV, you might need 'pvmove --alloc anywhere' to
do this.

Alasdair
-- 
agk@redhat.com
