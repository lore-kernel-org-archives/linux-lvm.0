Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4IHQX000755
	for <linux-lvm@redhat.com>; Tue, 18 May 2004 13:26:33 -0400
Received: from neuralscape.com (synapse.neuralscape.com [198.144.200.82])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i4IHQRHA012877
	for <linux-lvm@redhat.com>; Tue, 18 May 2004 13:26:27 -0400
Received: from shaeffer by neuralscape.com with local (Exim 4.12)
	id 1BQ8KA-0006Ed-00
	for linux-lvm@redhat.com; Tue, 18 May 2004 10:24:18 -0700
Date: Tue, 18 May 2004 10:24:18 -0700
From: Karen Shaeffer <shaeffer@neuralscape.com>
Subject: Re: [linux-lvm] Snapshot support for LVM2?
Message-ID: <20040518172418.GA23849@synapse.neuralscape.com>
References: <8CCBDD5583C50E4196F012E79439B45C04C9A3EF@atl-ms1.megatrends.com>
	<20040517133351.L5945@homer.msp.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040517133351.L5945@homer.msp.redhat.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, May 17, 2004 at 01:33:51PM -0500, Alasdair G Kergon wrote:
> On Mon, May 17, 2004 at 01:36:21PM -0400, Vinesh Christopher wrote:
> > When is the official stable release of 
> > Snapshot support for LVM2?
>   
> Starting from http://sources.redhat.com/dm,
> 
>   Stable 2.4.26 kernel patch is in:
>    ftp://sources.redhat.com/pub/dm/device-mapper.1.00.17.tgz
> 
> For 2.6, there is not a stable snapshot release yet, but it's close.
> The snapshot support in
>   ftp://sources.redhat.com/pub/dm/patches/2.6-unstable/2.6.6-rc2/2.6.6-rc2-udm1.tar.bz2
> is the best available; there's still an issue with SMP.
> 
> Alasdair

Hi Alasdair,

I was hoping you folks would at least rev the 2.6-unstable patchset for the
2.6.6 kernel that was recently released. Most of the 2.6.6-rc2-udm1 patchset
is included in 2.6.6. The 2.6.6-rc3 patchset is not included in the
2.6.6-rc2-udm1 patchset.

Evms has already been updated for the 2.6.6 release of the kernel. Can you
please advise me when the LVM2 snapshot patchset will be updated for this
latest released kernel version?

Will someone explain to me the pros and cons between using LVM2 and evms?

Thanks,
Karen
-- 
 Karen Shaeffer
 Neuralscape, Palo Alto, Ca. 94306
 shaeffer@neuralscape.com  http://www.neuralscape.com
