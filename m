Received: from fentible.pjc.net (vpnuser1.surrey.redhat.com [172.16.9.1])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i5ECnTj2011517
	for <linux-lvm@redhat.com>; Mon, 14 Jun 2004 13:49:30 +0100
Received: from patrick by fentible.pjc.net with local (Exim 4.34)
	id 1BZqu2-0001Lt-Rg
	for linux-lvm@redhat.com; Mon, 14 Jun 2004 13:49:30 +0100
Date: Mon, 14 Jun 2004 13:49:30 +0100
From: Patrick Caulfield <pcaulfie@redhat.com>
Subject: Re: [linux-lvm] cluster questions
Message-ID: <20040614124930.GF30294@tykepenguin.com>
References: <Pine.LNX.4.55.0406111220100.24071@mallet-l.d2.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.55.0406111220100.24071@mallet-l.d2.com>
Sender: Patrick <patrick@tykepenguin.com>
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

On Fri, Jun 11, 2004 at 12:35:43PM -0700, Sebastien Boving wrote:
> 
> 
> I know LVM does not support clusters.  The HOWTO makes a good job in
> explaining how it is not, and how you could use it at your own risk, at:
> 
> http://tldp.org/HOWTO/LVM-HOWTO/sharinglvm1.html
> 
> I realize nothing protects an in-use LV to be mounted by another host,
> which can severely corrupt non-clustered filesystems.
> 
> i still have a few questions in this regard though:
> 
> 
> 1) What are my advantages of running LVM2 instead of LVM?
> 
> LVM does all i need, i think, part from being cluster-enabled.  LVM2 is
> also not clustered enabled, though it is the basis of CLVM (which is on
> its way?).  Any advantages in this regard to already go to LVM2 now, even
> if only cause the upgrade to CLVM will go smoother?  The only reason i
> wouldn't go to LVM2 is cause my RHES3.0 supports LVM out of the box, not
> LVM2, and i rather stick to included software / kernel modules / ...
> unless i have a valid reason not to.

When clustered LVM does become available you will need LVM2. 
Even if you don't use that, lvm2 offers better metadata integrity features than
LVM1 which might make it easier to recover if you do make a mistake in your
"manual" clustering! Plus all the other normal benefits of LVM2...
 
> 
> 
> 2) Can snapshots safely be used by other nodes on the cluster?
> 
> Say a 'master node' owns the LVM config of a particular node.  It mounts
> all (non-snapshot) LV's in there.  Can i have it create a snapshot on one
> of its LV's, mount this on another node to perform a backup (sparing the
> first node's cpu and network resources), then delete the snapshot on the
> master mode, all this while observing the 'Other Nodes' procedure on the
> above mentionned FAQ page?  Is this a 100% safe & supported way of doing
> things?

No. the current snapshot implementation behviour is single-node only. If you try
to back up a snapshot on another node you won't get a valid backup because the
snapshot exceptions are written on the node that has the original LV mounted. 

-- 

patrick
