Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sAQDLIgU019081
	for <linux-lvm@redhat.com>; Wed, 26 Nov 2014 08:21:18 -0500
Received: from p02c12o149.mxlogic.net (p02c12o149.mxlogic.net [208.65.145.82])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sAQDLCVB010681
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 26 Nov 2014 08:21:13 -0500
Date: Wed, 26 Nov 2014 08:20:55 -0500
From: Joe Lawrence <joe.lawrence@stratus.com>
Message-ID: <20141126082055.72680602@jlaw-desktop.mno.stratus.com>
In-Reply-To: <CAJCQCtQauJQkKjYL6-hxYkquCHL2yXSo4034jfiJxUPO7Nw2dQ@mail.gmail.com>
References: <alpine.DEB.2.02.1411242255300.12886@jlaw-desktop.mno.stratus.com>
	<CAJCQCtQauJQkKjYL6-hxYkquCHL2yXSo4034jfiJxUPO7Nw2dQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] LVM RAID1 syncing component
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Chris Murphy <lists@colorremedies.com>
Cc: linux-raid@vger.kernel.org, linux-lvm@redhat.com

On Tue, 25 Nov 2014 22:42:38 -0700
Chris Murphy <lists@colorremedies.com> wrote:

> On Mon, Nov 24, 2014 at 9:07 PM, Joe Lawrence <joe.lawrence@stratus.com> wrote:
> > Does anyone know how its possible to determine which side of an LVM RAID 1
> > is the stale partner during RAID resync?
> >
> > In ordinary MD RAID, I believe you can check
> > /sys/block/md0/md/dev-XXX/state, but LVM RAID seems to hide those files
> > when leveraging the MD code.  I've looked though pvs/vgs/lvs manpages, but
> > can't figure anything out there either.
> 
> Rather indirectly: iotop which will show you which devices are mostly
> being read from and written to.
> 
> # lvs -a -o copy_percent
> Anything less than 100% is syncing. I think.
> 

From the manpages I see the following attribute bits:

* lvs, lv_attr bit Volume Health: (p)artial
* vgs, vg_attr bit (p)artial: one or more physical volumes belonging
       to the volume group are missing from the system
* pvs, pv_attr bit (m)issing

along with the lvs copy_percent (is this similar to sync_percent) that
you mentioned.  That's about it.

Since there seems to be no real underlying MD device, I'm assuming that
ioctls are out of the question as well.

-- Joe
