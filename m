Received: from homer.msp.redhat.com (homer.msp.redhat.com [172.16.30.9])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4HIXq030369
	for <linux-lvm@redhat.com>; Mon, 17 May 2004 14:33:52 -0400
Received: (from agk@localhost)
	by homer.msp.redhat.com (8.11.6/8.11.6) id i4HIXpd09338
	for linux-lvm@redhat.com; Mon, 17 May 2004 13:33:51 -0500
Date: Mon, 17 May 2004 13:33:51 -0500
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Snapshot support for LVM2?
Message-ID: <20040517133351.L5945@homer.msp.redhat.com>
References: <8CCBDD5583C50E4196F012E79439B45C04C9A3EF@atl-ms1.megatrends.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8CCBDD5583C50E4196F012E79439B45C04C9A3EF@atl-ms1.megatrends.com>;
	from vineshc@ami.com on Mon, May 17, 2004 at 01:36:21PM -0400
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

On Mon, May 17, 2004 at 01:36:21PM -0400, Vinesh Christopher wrote:
> When is the official stable release of 
> Snapshot support for LVM2?
  
Starting from http://sources.redhat.com/dm,

  Stable 2.4.26 kernel patch is in:
   ftp://sources.redhat.com/pub/dm/device-mapper.1.00.17.tgz

For 2.6, there is not a stable snapshot release yet, but it's close.
The snapshot support in
  ftp://sources.redhat.com/pub/dm/patches/2.6-unstable/2.6.6-rc2/2.6.6-rc2-udm1.tar.bz2
is the best available; there's still an issue with SMP.

Alasdair
-- 
agk@redhat.com
