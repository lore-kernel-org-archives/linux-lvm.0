From: Marc MERLIN <marc_lvm@merlins.org>
Subject: Re: [linux-lvm] vgchange -a y /dev/System fails
Message-Id: <20020211190120.GQ21505@merlins.org>
References: <20020125233533.GK26045@merlins.org>
    <20020128104258.A24830@sistina.com> <20020129215738.GA8651@merlins.org>
    <20020130131205.A3769@sistina.com> <20020131030417.GN8651@merlins.org>
    <20020131121417.A9764@sistina.com> <20020201210928.GO8651@merlins.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020201210928.GO8651@merlins.org>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Mon Feb 11 13:01:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Feb 01, 2002 at 01:09:28PM -0800, Marc MERLIN wrote:

I wanted to thank Heinz publically for going beyond the call of duty, and
helping until the problem was fixed.
I thought I'd give a few lines to explain the resolution for the benefit of
other list members and the archives.

> On Thu, Jan 31, 2002 at 12:14:17PM +0100, Heinz J . Mauelshagen wrote:
> > > -> My BigAssLVMRaid VG is gone :-(
> > > 
> > > Did I just lose my data?
> > 
> > If you really tried all your  metadata backups unsuccessfully, I am afraid
> > so  :-(  
> 
> I tried other ones, but every time, I'm getting:
> vgcfgrestore -- VGDA for "BigAssLVMRaid" successfully restored to physical
> volume "/dev/rd/disc0/part7"
> vgcfgrestore -- you may not have an actual backup of restored volume group
> "BigAssLVMRaid"

The reason why vgchange -a -y didn't pick up  my VG is due to a small bug in
vgcfgrestore, which  only restored the  UUIDs of 8 out  of my 9  PVs (quoted
from memory, sorry if I got this slightly wrong).
Either way, the fix it to upgrade to  a newer version of the lvm tools (from
CVS or the next snapshot)

> This VG was working fine before I restored the other one (active and all)

The reason why I tried to restore it in the first place is that any kind of
partition access on that VG would hang the machine.
The problem turned out to be the crappy VM in 2.4.17, and not LVM.

Actually 2.4.14 also had a few  issues fscking the 800G partition, and froze
when  fsck was  going to  write  the changes  to  the partition  (and its  4
snapshots)
It probably would have completed had I deleted the snapshots, but I ended up
going  back to  2.4.7, and  after an  8H fsck,  the partition  was mountable
again.

Again, thanks to Heinz for his invaluable help.

Marc
-- 
Microsoft is to operating systems & security ....
                                      .... what McDonalds is to gourmet cooking
  
Home page: http://marc.merlins.org/   |   Finger marc_f@merlins.org for PGP key
