From: jon+lvm@silicide.dk
Subject: Re: [linux-lvm] Long-term snapshots possible?
Message-ID: <20030311204616.GB14278@gw.silicide.dk>
References: <200303112228.39201.jhs@openenterprise.biz>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200303112228.39201.jhs@openenterprise.biz>
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
Date: Tue Mar 11 14:47:06 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Mar 11, 2003 at 10:28:38PM +0700, Jason Smith wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi.  Like many others, I'm interested in using LVM2 as a componet for a 
> Linux-based file server.

i only have experience with the first lvm implementation, not with lvm2.


> When needed, I had hoped to sacrifice disk space for long-term filesystem 
> snapshots, by creating multiple snapshots and rotating them out on 
> perhaps a weekly basis.  The intent is to emulate the convenience and 
> power of similar snapshot features in commercial file servers.

i used to do 4. Every hour, every 8 hour, every day, and every week.
I gave up because it was too unstable. But since that there has been
found a few bugs in lvm1 snapshots.


> My problem is, this does not currently look possible without a severe 
> performance hit.  If a volume has, for example, five active snapshots, 
> then the deltas seem to get written five times, once per snapshot volume.

How would you not do that ? You have to store the snapshots some how.


> Alternatively, I could use meta-snapshots, but they are not currently 
> implemented, and that idea sounds klugy.

meta snapshots ?


> So then do the LVM developers and users recommend against multiple 
> concurrent snapshots of a volume?  Should I keep hope for this great 
> feature, only found in commercial file servers?

well, if you need it you can either implement it yourself, or possibly
find someone who can do it for you.


> Thanks for any input.

Until this get made you can simulate this, though with the exception
that it will take a little time, and use linear to the number of snapshots
extra space.
You take a snapshot. Then you create another LV, mkfs it, and rsync the data
from the snapshot to the new LV. When that is done you have a "snapshot"
that doesnt take cpu time and performance, just space.



JonB
