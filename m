From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] pvmove problem
Message-ID: <20030605123501.A21457@sistina.com>
References: <200306041157.45859.tcr@pacific.mps.ohio-state.edu>
Mime-Version: 1.0
In-Reply-To: <200306041157.45859.tcr@pacific.mps.ohio-state.edu>; from tcr@pacific.mps.ohio-state.edu on Wed, Jun 04, 2003 at 11:57:45AM -0400
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
Date: Thu Jun  5 05:45:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Tim,

have you tried 'pvmove -i ...' yet ?
That tries to work arround read errors on flaky devices and read as much
data as possible.


Regards,
Heinz    -- The LVM Guy --


On Wed, Jun 04, 2003 at 11:57:45AM -0400, Tim Randles wrote:
> Hello,
> 
> I'm trying to pvmove from a dying disk to a new disk.  I'm using version 1.0.7 
> of the LVM tools.  I know that the source disk has bad sectors on it.  I 
> figured one of two things would happen with the pvmove:
> 1)  pvmove would work fine up to the bad sectors, where it would error with 
> I/O read errors.  I would then restart the pvmove with PEs that are past the 
> bad sectors on the source disk and things would finish.
> 2)  pvmove would work fine up to the bad sectors, where it would encounter I/O 
> read errors.  pvmove would report the errors and say the data is 
> lost/corrupt, but continue reading valid/skipping bad sectors until it 
> finished.
> I fear that I'm being naive about how pvmove will handle bad sectors...  At 
> any rate, the error I'm getting is:
> 
> [root@mills tools]# ./pvmove -vv /dev/sdb1
> pvmove -- checking name of source physical volume "/dev/sdb1"
> pvmove -- locking logical volume manager
> pvmove -- reading data of source physical volume from "/dev/sdb1"
> pvmove -- checking volume group existence
> pvmove -- reading data of volume group "vg1" from lvmtab
> pvmove -- checking volume group consistency of "vg1"
> pvmove -- searching for source physical volume "/dev/sdb1" in volume group 
> "vg1"
> pvmove -- building list of possible destination physical volumes
> pvmove -- checking volume group activity
> pvmove -- moving physical extents in active volume group "vg1"
> pvmove -- WARNING: if you lose power during the move you may need
>         to restore your LVM metadata from backup!
> pvmove -- do you want to continue? [y/n] y
> pvmove -- starting to move extents away from physical volume "/dev/sdb1"
> pvmove -- checking for enough free physical extents in "vg1"
> lv: /dev/vg1/lv7[7]  old_dev: 08:17  new_dev: 08:33  old_pe_sector: 4186488  
> new_pe_sector: 4186488
> pvmove -- opening output physical volume "/dev/sdc1"
> pvmove -- llseeking input physical volume "/dev/sdb1"
> pvmove -- llseeking output physical volume "/dev/sdc1"
> pvmove -- /dev/sdb1 [PE 510 [lv7 [LE 5650]] -> /dev/sdc1 [PE 510] [1/4590]
> pvmove -- locking physical extent 510 of "/dev/sdb1" in kernel
> pvmove -- about to read input physical volume "/dev/sdb1" and to write output 
> physical volume "/dev/sdc1"
> pvmove -- ERROR reading input physical volume "/dev/sdb1" (still 131072 bytes 
> to read)
> pvmove -- ERROR "pv_move_pe(): read input PV" moving physical extents
> 
> 
> When I try to specify any random PE > 510 I get:
> 
> 
> [root@mills tools]# ./pvmove -vv /dev/sdb1:530 /dev/sdc1
> pvmove -- checking name of source physical volume "/dev/sdb1"
> pvmove -- locking logical volume manager
> pvmove -- reading data of source physical volume from "/dev/sdb1"
> pvmove -- checking volume group existence
> pvmove -- reading data of volume group "vg1" from lvmtab
> pvmove -- checking volume group consistency of "vg1"
> pvmove -- searching for source physical volume "/dev/sdb1" in volume group 
> "vg1"
> pvmove -- building list of possible destination physical volumes
> pvmove -- checking destination physical volume names in command line
> pvmove -- checking volume group activity
> pvmove -- moving physical extents in active volume group "vg1"
> pvmove -- WARNING: if you lose power during the move you may need
>         to restore your LVM metadata from backup!
> pvmove -- do you want to continue? [y/n] y
> pvmove -- starting to move extents away from physical volume "/dev/sdb1"
> pvmove -- checking for enough free physical extents in "vg1"
> lv: /dev/vg1/lv7[7]  old_dev: 08:17  new_dev: 08:33  old_pe_sector: 4350328  
> new_pe_sector: 4186488
> pvmove -- opening output physical volume "/dev/sdc1"
> pvmove -- llseeking input physical volume "/dev/sdb1"
> pvmove -- llseeking output physical volume "/dev/sdc1"
> pvmove -- /dev/sdb1 [PE 530 [lv7 [LE 5670]] -> /dev/sdc1 [PE 510] [1/1]
> pvmove -- locking physical extent 530 of "/dev/sdb1" in kernel
> pvmove -- about to read input physical volume "/dev/sdb1" and to write output 
> physical volume "/dev/sdc1"
> pvmove -- ERROR reading input physical volume "/dev/sdb1" (still 4194304 bytes 
> to read)
> pvmove -- ERROR "pv_move_pe(): read input PV" moving physical extents
> 
> 
> Is there anything I can do to get the pvmove to finish?
> 
> Thanks,
> Tim
> 
> -- 
> Tim Randles
> Unix Administrator and Webmaster
> The Ohio State University
> Department of Physics Computing Facility
> Phone: 292-2630
> Email: tcr@pacific.mps.ohio-state.edu
> PGP key: http://www.physics.ohio-state.edu/~tcr/pgp.txt
> 
> 
> 
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
