From: Stonki <stonki@gmx.de>
Message-ID: <7632207772.20011021193259@gmx.de>
Subject: Re[2]: [linux-lvm] pvmove with Bad bocks
In-Reply-To: <20011021155622.A9367@btconnect.com>
References: <55159047260.20011020155124@gmx.de>
 <20011021140746.B15468@vestdata.no> <20011021155622.A9367@btconnect.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Sun Oct 21 12:34:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Joe Thornber <linux-lvm@sistina.com>

Hello Joe,

Sunday, October 21, 2001, 4:56:22 PM, schriebst Du:

JT> The first thing I would try is shrinking the filesystem and pv by one
JT> extent.  If this works the pv move should now work ok.

ok, I reduced the reiserfs from 150 GB down to 140 GB. I also reduced
the LVM to 145 GB. This worked fine without any errors...

Than I started pvmove again (linux:~ # pvmove -v /dev/hdf1 /dev/hdc1),
where hdf1 is the faulty drive and hdc1 is the new one...

linux:~ # pvmove -v /dev/hdf1 /dev/hdc1
pvmove -- checking name of source physical volume "/dev/hdf1"
pvmove -- locking logical volume manager
pvmove -- reading data of source physical volume from "/dev/hdf1"
pvmove -- checking volume group existence
pvmove -- reading data of volume group "Stonki2" from lvmtab
pvmove -- checking volume group consistency of "Stonki2"
pvmove -- searching for source physical volume "/dev/hdf1" in volume group "Stonki2"
pvmove -- building list of possible destination physical volumes
pvmove -- checking destination physical volume names in command line
pvmove -- checking volume group activity
pvmove -- moving physical extents in active volume group "Stonki2"
pvmove -- WARNING: if you lose power during the move you may need to restore your LVM metadata from backup!
pvmove -- do you want to continue? [y/n] y
pvmove -- starting to move extents away from physical volume "/dev/hdf1"
pvmove -- checking for enough free physical extents in "Stonki2"
pvmove -- /dev/hdf1 [PE 3319 [LV_Stonki2 [LE 27209]] -> /dev/hdc1 [PE 3319] [1/9911]
pvmove -- ERROR reading input physical volume "/dev/hdf1" (still 393216 bytes to read)

pvmove -- ERROR "pv_move_pe(): read input PV" pv_move_pe

pvmove -- ERROR "pv_move_pe(): read input PV" moving physical extents


so, same error.. Also also looked trough the archive of this
mailinglist. I didn't find any patch.. Only for version > 1.00. Mine
is:

linux:~ # pvmove -V
Logical Volume Manager 0.9.1_beta7
Heinz Mauelshagen, Sistina Software  10/04/2001  (IOP 10)


cu
 Stonki
