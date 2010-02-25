Received: from localhost (dhcp-100-19-150.bos.redhat.com [10.16.19.150])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o1P09v0Z025410
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 24 Feb 2010 19:09:58 -0500
Date: Wed, 24 Feb 2010 19:09:57 -0500
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20100225000957.GA23142@redhat.com>
References: <4ABA8D56.8060803@brunson.com>
	<20090923214034.GE3866@agk-dp.fab.redhat.com>
	<4B85AC31.8010508@brunson.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4B85AC31.8010508@brunson.com>
Subject: Re: [linux-lvm] Snapshot rollback
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Feb 24 2010 at  5:46pm -0500,
Eric Brunson <brunson@brunson.com> wrote:

> On 09/23/2009 03:40 PM, Alasdair G Kergon wrote:
> >On Wed, Sep 23, 2009 at 03:04:22PM -0600, Eric Brunson wrote:
> >>I remember seeing somewhere discussion of adding the ability to roll
> >>back to a snapshot.  I think of how cool this would be about ever six
> >>months, usually coinciding with an impending Fedora release.  ;-)
> >The developers are just starting to submit their patch sequence to the
> >development mailing lists (dm-devel and lvm-devel) for review.  So
> >that's targetting linux-next in the next few weeks ready for the 2.6.33
> >kernel.
> >
> 
> From the newly released 2.6.33 kernel changelog, does this mean what
> I think it means?
> 
>    commit 53365383c4667aba55385cd1858582c19a7a8a36
>    Merge: 51b736b d2fdb77
>    Author: Linus Torvalds<torvalds@linux-foundation.org>
>    Date:   Tue Dec 15 09:12:01 2009 -0800
> 
>         Merge git://git.kernel.org/pub/scm/linux/kernel/git/agk/linux-2.6-dm
> 
>         * git://git.kernel.org/pub/scm/linux/kernel/git/agk/linux-2.6-dm: (80 commits)
>           dm snapshot: use merge origin if snapshot invalid
>           dm snapshot: report merge failure in status
>           dm snapshot: merge consecutive chunks together
>           dm snapshot: trigger exceptions in remaining snapshots during merge
>           dm snapshot: delay merging a chunk until writes to it complete
>           dm snapshot: queue writes to chunks being merged
>           dm snapshot: add merging
>           dm snapshot: permit only one merge at once
>           dm snapshot: support barriers in snapshot merge target
>           dm snapshot: avoid allocating exceptions in merge
>           dm snapshot: rework writing to origin
>           dm snapshot: add merge target
>           dm exception store: add merge specific methods
>           dm snapshot: create function for chunk_is_tracked wait
>           dm snapshot: make bio optional in __origin_write
>           ...
> 
> 
> If it does, then I'm very excited.  :-)

Ha, yes the 2.6.33 kernel includes DM's new snapshot-merge target.

LVM2 >= 2.02.59 provides userspace support for snapshot-merge (via
lvconvert --merge).  Though 2.02.61 adds the ability to tag N snapshots
with a common tag and then merge them all back to their respective
origin using: lvconvert --merge @tag

Mike
