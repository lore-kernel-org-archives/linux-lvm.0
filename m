From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Unable to mount snapshot
Message-ID: <20031219110429.D18654@sistina.com>
References: <9BBB7C9EFEF1874BAC4DC204E867EFAF02560DD0@s99mail06>
Mime-Version: 1.0
In-Reply-To: <9BBB7C9EFEF1874BAC4DC204E867EFAF02560DD0@s99mail06>; from Chris.Little@okdhs.org on Thu, Dec 18, 2003 at 12:06:11PM -0600
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
Date: Fri Dec 19 04:10:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Dec 18, 2003 at 12:06:11PM -0600, Little, Chris wrote:
> don't use snapshot.  it sucks and the owners won't answer questions about
> it.

Chris,
what in particular problems do you have with snapshots ?

Regards,
Heinz    -- The LVM Guy --


> 
> > -----Original Message-----
> > From: John Craig [mailto:johncraig01@netscape.net]
> > Sent: Thursday, December 18, 2003 11:34 AM
> > To: linux-lvm@sistina.com
> > Subject: [linux-lvm] Unable to mount snapshot
> > 
> > 
> > Hi,
> > 
> > I successfully created a snapshot of an active LV with XFS 
> > filesystem, 
> > and ldisplay shows it to be operating correctly. However, 
> > when I try to 
> > mount the snapshot, it says "wrong fs type, bad option, bad 
> > superblock 
> > on /dev/system/snap or too many mounted file systems"
> > 
> > Can anyone help, or shed some light on why this is happening? 
> > Is there a 
> > workaround?
> > 
> > The mount command was "mount -t xfs -o ro /dev/system/snap /mnt/snap"
> > 
> > I am running SuSE 9.0 on x86-64, with kernel 2.4.21-149, lvm version 
> > 1.0.7(mp-v6). I have a volume group running on 3 raid arrays, 
> > each 0.9 
> > TB, for a total of 2.7 TB. It has 2 active LVs, one of them 2 TB, and 
> > the other 500GB, leaving about 249GB unallocated. I created 
> > the snapshot 
> > with:
> > 
> > lvcreate -L 200G -s -n snap /dev/system/adsdata
> > 
> > As I said, the snapshot seems to be working correctly, but 
> > when I bring 
> > up the LVM tool in YAST, it shows the original LV, with 
> > capacity 1.9 TB, 
> > mounted, and the snapshot  with a capacity of 1.9TB, 
> > unmounted. When I 
> > try to set the mount point for the snapshot, it says the capacity is 
> > wrong, it needs to be <= 249GB. In other words, it seems to 
> > be treating 
> > it as if it were a regular LV, not a snapshot..
> > 
> > The listing of lvdisplay is:
> > --- Logical volume ---
> > LV Name                /dev/system/snap
> > VG Name                system
> > LV Write Access        read only
> > LV snapshot status     active destination for /dev/system/adsdata
> > LV Status              available
> > LV #                   3
> > # open                 0
> > LV Size                2 TB
> > Current LE             16383
> > Allocated LE           16383
> > snapshot chunk size    64 KB
> > Allocated to snapshot  16.66% [33.29 GB/199.90 GB]
> > Allocated to COW-table 100 MB
> > Allocation             next free
> > Read ahead sectors     1024
> > Block device           58:2
> > 
> > 
> > 
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> > 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
