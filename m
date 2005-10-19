Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9JH7OV20982
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2005 13:07:24 -0400
Received: from lennier.cc.vt.edu (lennier.cc.vt.edu [198.82.162.213])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j9JH7I5B032710
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2005 13:07:18 -0400
Received: from dagger.cc.vt.edu (IDENT:mirapoint@evil-dagger.cc.vt.edu
	[10.1.1.11])
	by lennier.cc.vt.edu (8.12.11/8.12.11) with ESMTP id j9JH7Da5017131
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2005 13:07:13 -0400
Subject: Re: [linux-lvm] creating a snapshot
From: Bill Ranck <ranck@vt.edu>
In-Reply-To: <20051019165652.GJ30611@agk.surrey.redhat.com>
References: <1129740801.29185.90.camel@joesgrill.cc.vt.edu>
	<20051019165652.GJ30611@agk.surrey.redhat.com>
Date: Wed, 19 Oct 2005 13:06:09 -0400
Message-Id: <1129741569.29185.97.camel@joesgrill.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: LVM discussion list <linux-lvm@redhat.com>

On Wed, 2005-10-19 at 17:56 +0100, Alasdair G Kergon wrote:
> On Wed, Oct 19, 2005 at 12:53:21PM -0400, Bill Ranck wrote:
> >   snapshot: Required device-mapper target(s) not detected in your kernel
> 
> modprobe dm-snapshot

Thanks, that worked.  

> There's an untested fix for this in CVS now.

Huh?  Where/what is CVS?  Is this fix something up2date would grab?
Sorry, I'm fairly new to the Redhat way of doing things.


On a related topic, is there any way to create a snapshot outside of the
volume group containing the original target?  I'm short on space in the
original VG and would like the snapshot the use some other space in a
different VG.  If not, I'll have to shuffle some disk space around.

-- 
Bill Ranck
Blacksburg, Va.
540-231-3951
