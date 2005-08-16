Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j7GHVT0l016683
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2005 18:31:29 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1E55Hd-0006eP-DM
	for linux-lvm@redhat.com; Tue, 16 Aug 2005 18:31:29 +0100
Date: Tue, 16 Aug 2005 18:31:29 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] 2.00 TB of PV "not usable"?
Message-ID: <20050816173129.GI29587@agk.surrey.redhat.com>
References: <20050816172537.GA17428@pe.Belkin>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050816172537.GA17428@pe.Belkin>
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

On Tue, Aug 16, 2005 at 01:25:37PM -0400, Chris Shoemaker wrote:
> My question is: should I be concerned about the "not usable 2.00 TB" part?

Yes.
It's probably an indication you're using an old version of the lvm tools
that doesn't support large devices properly: upgrade!
IIRC unpatched 2.6.9 also has data corruption issues with large devices.

Alasdair
-- 
agk@redhat.com
