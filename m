Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j2NLrfBW016988
	for <linux-lvm@redhat.com>; Wed, 23 Mar 2005 21:53:41 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1DEDnI-00088j-QC
	for linux-lvm@redhat.com; Wed, 23 Mar 2005 21:53:40 +0000
Date: Wed, 23 Mar 2005 21:53:40 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Re: Raid1 only with LVM
Message-ID: <20050323215340.GV19749@agk.surrey.redhat.com>
References: <200502281138.00112.stuebiger-lvm@cip.ifi.lmu.de>
	<20050301191923.GA13742@redhat.com> <87br9adodr.fsf@coraid.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87br9adodr.fsf@coraid.com>
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

On Wed, Mar 23, 2005 at 04:49:04PM -0500, Ed L Cashin wrote:
> Do you expect that when mirroring is working in LVM2 it will be
> working in CLVM?  That is, will a cluster be able to share block
> storage with using distributed RAID 1 later this year because of CLVM?
 
Two different sorts of mirroring, single-node and clustered.
Work is underway for clustered LVM2 to support both.

Alasdair
-- 
agk@redhat.com
