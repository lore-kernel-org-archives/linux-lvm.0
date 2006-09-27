Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8RDlUjU030827
	for <linux-lvm@redhat.com>; Wed, 27 Sep 2006 09:47:30 -0400
Received: from sv2.telemetry-investments.com (gw1a.telemetry-investments.com
	[64.20.161.180])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8RDlSV1022874
	for <linux-lvm@redhat.com>; Wed, 27 Sep 2006 09:47:28 -0400
Date: Wed, 27 Sep 2006 09:47:22 -0400
From: "Bill Rugolsky Jr." <brugolsky@telemetry-investments.com>
Subject: Re: [linux-lvm] Examining a snapshot
Message-ID: <20060927134722.GC20702@ti64.telemetry-investments.com>
References: <20060927025716.GB10619@highgate.net.nz>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20060927025716.GB10619@highgate.net.nz>
Reply-To: "Bill Rugolsky Jr." <brugolsky@telemetry-investments.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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

On Wed, Sep 27, 2006 at 02:57:16PM +1200, Nick Wright wrote:
> Hi all,
> 
> I have a backup strategy in place where I use snapshots to determine
> the difference between yesterday and today. I then copy those blocks
> that have changed to a target machine and apply the difference to a
> remote copy of the entire block device. 
> 
> Currently this involves doing a complete comparison between a logical
> volume and its snapshot to find the blocks that have changed. I know
> that internally, LVM already has the information about which blocks
> have been altered -- these are what are stored in the snapshot after
> all.
> 
> Is it possible for me to get that information somehow? Some pointers
> getting me started on this would be of great help to me -- especially
> if theres a simple way to do so already in place before I go delving
> into source code etc...
 
Have a look at:

   http://fedoraproject.org/wiki/StatelessLinuxCachedClient

There are patches from Mark McLoughlin, not yet upstream, AFAIK, that
allow a snapshot LV to be merged back into the origin using "lvmerge."

The other piece provided by the Stateless packages copies the snapshot
backing store to another host and sets up the dm mappings so that the
relationship on the remote machine is similar to the relationship on
the local host.

It would be nice to see this all merged upstream some time soon.

A while ago I proposed a lightweight target that wouldn't copy the
data, but would only record the blocks that were changed, which
is precisely what you want:

  http://linux.msede.com/lvm_mlist/archive/2003/08/0036.html

Unfortunately, I've had no time to attempt implementing it, though
it should be straightforward.

Regards,

	Bill Rugolsky
