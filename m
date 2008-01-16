Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m0G3MHem017487
	for <linux-lvm@redhat.com>; Tue, 15 Jan 2008 22:22:17 -0500
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1JEyr3-0007Nv-Dh
	for linux-lvm@redhat.com; Wed, 16 Jan 2008 03:22:17 +0000
Date: Wed, 16 Jan 2008 03:22:17 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] --removemissing explanation
Message-ID: <20080116032217.GQ8075@agk.fab.redhat.com>
References: <1C8CF1EA1A5B5940B81B0710B2A4C938373C2BE1B6@an-ex.ActiveNetwerx.int>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1C8CF1EA1A5B5940B81B0710B2A4C938373C2BE1B6@an-ex.ActiveNetwerx.int>
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

On Tue, Jan 15, 2008 at 07:18:54PM -0700, Joseph L. Casale wrote:
> Referring back to a frantic post I made earlier, if a pv providing
> extents used in a vg with *some* of those extents used in an lv
> disappears, why doesn't the removemissing option restore the lv so at
> least I can salvage what may be left? 

--removemissing is to clean up *after* you've salvaged what you can.
Options like --partial exist to help with salvage.

Alasdair
-- 
agk@redhat.com
