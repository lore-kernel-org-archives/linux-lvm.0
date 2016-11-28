Date: Mon, 28 Nov 2016 16:24:03 -0600
From: David Teigland <teigland@redhat.com>
Message-ID: <20161128222403.GC7073@redhat.com>
References: <kcim.5838018e.2209.36b950052698aabe@ucs.cubewerk.intern>
	<729f6285-1b10-c8cc-1a07-2441414da7ba@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <729f6285-1b10-c8cc-1a07-2441414da7ba@gmail.com>
Subject: Re: [linux-lvm] auto_activation_volume_list in lvm.conf not honored
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
To: Stefan Bauer <sb@plzk.de>
Cc: linux-lvm@redhat.com

On Fri, Nov 25, 2016 at 10:30:39AM +0100, Zdenek Kabelac wrote:
> Dne 25.11.2016 v 10:17 Stefan Bauer napsal(a):
> > Hi Peter,
> > 
> > as i said, we have master/slave setup _without_ concurrent write/read. So i do not see a reason why i should take care of locking as only one node is activating the volume group at the same time.
> > 
> > That should be fine - right?
> 
> Nope it's not.
> 
> Every i.e. activation  DOES validation of all resources and takes ACTION
> when something is wrong.
> 
> Sorry, but there is NO way to do this properly without locking manager.
> 
> Although many lvm2 users always do try to be 'innovative' and try to use in
> lock-less way - this seems to work most of the time - till the moment some
> disaster happens - then just lvm2 is blamed about data loss..
> 
> Interestingly they never tried to think why we invested so much time into
> locking manager when there is such 'easy-fix' in their eyes...
> 
> IMHO lvmlockd is relatively 'low-resource/overhead' solution worth to be
> explored if you don't like clvmd...

Stefan, as Zdenek points out, even reading VGs on shared storage is not
entirely safe, because lvm may attempt to fix/repair things on disk while
it is reading (this becomes more likely if one machine reads while another
is making changes).  Using some kind of locking or clustering (lvmlockd or
clvm) is a solution.

Another fairly new option is to use "system ID", which assigns one host as
the owner of the VG.  This avoids the problems mentioned above with
reading->fixing.  But, system ID on its own cannot be used dynamically.
If you want to fail-over the VG between hosts, the system ID needs to be
changed, and this needs to be done carefully (e.g. by a resource manager
or something that takes fencing into account,
https://bugzilla.redhat.com/show_bug.cgi?id=1336346#c2)

Also https://www.redhat.com/archives/linux-lvm/2016-November/msg00022.html

Dave
