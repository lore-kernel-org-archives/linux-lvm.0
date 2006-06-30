Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5UCXsIt010542
	for <linux-lvm@redhat.com>; Fri, 30 Jun 2006 08:33:54 -0400
Received: from vwclub.ro (lcx.at [213.239.193.148])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5UCXrUS009685
	for <linux-lvm@redhat.com>; Fri, 30 Jun 2006 08:33:53 -0400
Date: Fri, 30 Jun 2006 14:33:51 +0200
From: Cristian Livadaru <drac3@vwclub.ro>
Subject: Re: [linux-lvm] LV's have "disapeared"
Message-ID: <20060630123351.GV20554@vwclub.ro>
References: <20060630083916.GO20554@vwclub.ro> <44A502B0.7090708@conterra.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <44A502B0.7090708@conterra.de>
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
To: linux-lvm@redhat.com

On Fri, Jun 30, 2006 at 12:53:36PM +0200, Dieter St?ken wrote:
> Cristian Livadaru wrote:
> > I have created some new lv's for some tests.
> > What I did was based on this howto:
> > 
> > http://www.tldp.org/HOWTO/LVM-HOWTO/recipethreescsi.html
> > 
> > pvcreate /dev/hdk 
> > pvcreate /dev/hdi
> > 
> > vgcreate vhostvg /dev/hdk /dev/hdi
> > 
> > lvcreate -L1G -nvm01lv vhostvg 
> > ok and here I thinkg I made a big mistake!
> > since I had no partitions on my disks and I assumed that I needed one so
> > that it matches the LVM that was created by debian automaticaly I
> > created on both disks a partition and changed the type to 8e  Linux LVM.
> > I actualy worked with the lv's and everything is ok ( except my speed
> > problem but this is a other topic )
> > now after a rebbot, I only see the lv created by debian, not the one
> > that I kind of screwed up with my partitioning.
> > 
> > Is there a simple way to recover it? It's not that important that I
> > would wast to much time with it, it was just for testing anyway and I
> > could recreate them.
> 
> You created the partitions, but as long as you did not write any data
> to the created partition, nothing bad happened so far. Just delete
> the partition again. The partition table resides in the first sector
> of the disk, which is fortunately unused by LVM.


I already did a lot on the partition.
thanks anyway but the data on that lvm wasn't that important. I just
reinstalled everything.

Cris
