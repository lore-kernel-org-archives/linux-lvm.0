Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l0BHK4NV002545
	for <linux-lvm@redhat.com>; Thu, 11 Jan 2007 17:20:04 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1H53au-0001yI-Lr
	for linux-lvm@redhat.com; Thu, 11 Jan 2007 17:20:04 +0000
Date: Thu, 11 Jan 2007 17:20:04 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Combination of clvm and non-cluster?
Message-ID: <20070111172004.GF21980@agk.surrey.redhat.com>
References: <Pine.LNX.4.63.0701111112520.28722@tungsten.msp.technicality.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.63.0701111112520.28722@tungsten.msp.technicality.org>
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

On Thu, Jan 11, 2007 at 11:13:33AM -0600, Nate Carlson wrote:
> I'd like to have my local disks (including the root fs) on LVM, along with 
> running CLVM for remote disks.. is it possible to mix both? Once I change 
> the locking system in lvm.conf for clvm, I can no longer 
> pvscan/lvscan/etc.  :(

Clustering is a volume group property.
  vgchange -c 

Can't mix local and clustered volumes in the same VG.

Best to use version 2.02.17 with built-in clustered locking
(locking type 3).

New config parameters
  fallback_to_clustered_locking
  fallback_to_local_locking
(see example.conf, but default settings are normally OK)
 
Alasdair
-- 
agk@redhat.com
