From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Removing PV with disk errors from VG
Message-Id: <20020313120449.C23051@sistina.com>
References: <20020311163211.D13418@sistina.com>
    <Pine.LNX.4.44.0203121806380.14816-100000@clapper.digitalpulp.com>
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.44.0203121806380.14816-100000@clapper.digitalpulp.com>;
    from charwell@digitalpulp.com on Tue, Mar 12, 2002 at 06:16:10PM -0500
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
Date: Wed Mar 13 05:06:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Chris,

have you applied the cast patch for the llseek function, which fixes
this problem mentioned several times here on the list?

You should definitely *not* use CVS right now because it is a moving pre-release
target which still has bugs!

Regards,
Heinz    -- The LVM Guy --

On Tue, Mar 12, 2002 at 06:16:10PM -0500, Chris Harwell wrote:
> hi,
> 
> i've also run into errors when trying to use pvmove.
> 
> after offline shrinking with e2fsadm i was able to pvmove the PE's from
> several partitions succesfully - all small ~256MB. then the last one, a 
> large one ~3GB ran into troubles:
> 
> [root@totally80s init.d]# pvmove /dev/hda14
> pvmove -- moving physical extents in active volume group "vg0"
> pvmove -- WARNING: if you lose power during the move you may need
>         to restore your LVM metadata from backup!
> pvmove -- do you want to continue? [y/n] y
> pvmove -- ERROR reading input physical volume "/dev/hda14" (still 458752 
> bytes to read)
> pvmove -- ERROR "pv_move_pe(): read input PV" moving physical extents
> 
> and then this (same without the -i and --force options, which i tried 
> first). btw. a --test completed w/o errors. 
> 
> [root@totally80s init.d]# pvmove -i --force --verbose /dev/hda14 
> pvmove -- checking name of source physical volume "/dev/hda14"
> pvmove -- locking logical volume manager
> pvmove -- reading data of source physical volume from "/dev/hda14"
> pvmove -- checking volume group existence
> pvmove -- reading data of volume group "vg0" from lvmtab
> pvmove -- checking volume group consistency of "vg0"
> pvmove -- searching for source physical volume "/dev/hda14" in volume 
> group "vg0"
> pvmove -- building list of possible destination physical volumes
> pvmove -- checking volume group activity
> pvmove -- moving physical extents in active volume group "vg0"
> pvmove -- starting to move extents away from physical volume "/dev/hda14"
> pvmove -- checking for enough free physical extents in "vg0"
> pvmove -- /dev/hda14 [PE 0 [lvol1 [LE 310]] -> /dev/hdd9 [PE 16182] 
> [1/1202]
> pvmove -- ERROR "Invalid argument" remapping
> pvmove -- ERROR "pv_move(): LE of LV remap" moving physical extents
> 
> 
> before:
> [root@totally80s /root]# pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- ACTIVE   PV "/dev/hdc1"  of VG "vg0" [19.53 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hdc2"  of VG "vg0" [19.53 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hdc3"  of VG "vg0" [19.53 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hdc4"  of VG "vg0" [13 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hdd9"  of VG "vg0" [72 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hda9"  of VG "vg0" [248 MB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hda10" of VG "vg0" [248 MB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hda11" of VG "vg0" [248 MB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hda12" of VG "vg0" [248 MB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hda13" of VG "vg0" [248 MB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hda14" of VG "vg0" [4.70 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hdb1"  of VG "vg0" [19.53 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hdb2"  of VG "vg0" [19.53 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hdb3"  of VG "vg0" [19.53 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hdb4"  of VG "vg0" [17.72 GB / 0 free]
> pvscan -- total: 15 [225.84 GB] / in use: 15 [225.84 GB] / in no VG: 0 [0]
> 
> after the successful
> pvmove, vgreduce.. cycle for hda9,10,11,12,13 and pvmove hda14 failure:
> 
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- ACTIVE   PV "/dev/hdc1"  of VG "vg0" [19.53 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hdc2"  of VG "vg0" [19.53 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hdc3"  of VG "vg0" [19.53 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hdc4"  of VG "vg0" [13 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hdd9"  of VG "vg0" [72 GB / 6.79 GB free]
> pvscan -- inactive PV "/dev/hda9"  is in no VG  [250.98 MB]
> pvscan -- inactive PV "/dev/hda10" is in no VG  [250.98 MB]
> pvscan -- inactive PV "/dev/hda11" is in no VG  [250.98 MB]
> pvscan -- inactive PV "/dev/hda12" is in no VG  [250.98 MB]
> pvscan -- inactive PV "/dev/hda13" is in no VG  [250.98 MB]
> pvscan -- ACTIVE   PV "/dev/hda14" of VG "vg0" [4.70 GB / 2 GB free]
> pvscan -- ACTIVE   PV "/dev/hdb1"  of VG "vg0" [19.53 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hdb2"  of VG "vg0" [19.53 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hdb3"  of VG "vg0" [19.53 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hdb4"  of VG "vg0" [17.72 GB / 0 free]
> pvscan -- total: 15 [225.84 GB] / in use: 10 [224.62 GB] / in no VG: 5 
> [1.23 GB]
> 
> RedHat 7.0 + Linux 2.4.18 + lvm-1.0.3
> 
> any advise? should i also try that cvs version? 
> 
> On Mon, 11 Mar 2002, Heinz J . Mauelshagen wrote:
> 
> > 
> > Kalle,
> > 
> > well that's a bug in 1.0.3 which will be fixed in 1.0.4.
> > If you wnat to try it at your own risk, check out LVM1 CVS and
> > try "pvmove -i" again.
> > 
> > 1.0.4 will hopefully be released this week :)
> > 
> > Regards,
> > Heinz    -- The LVM Guy --
> > 
> > 
> > On Fri, Mar 08, 2002 at 04:40:19PM +0100, kalle@idlar.nu wrote:
> > > Hello
> > > 
> > > I have built a VG from a couple of disks and have now discovered that one 
> > > disk is not working right. Im getting a lot of theese kinds of errors:
> > > 
> > > end_request: I/O error, dev 03:03 (hdd), sector 2321462
> > > hdd: read_intr: status=0x59 { DriveReady SeekComplete DataRequest Error }
> > > hdd: read_intr: error=0x40 { UncorrectableError }, LBAsect=12571028, 
> > > sector=2321558
> > > 
> > > So I would like to move the data that still can be accessed from the bad 
> > > disk and remove the disk from the VG.
> > > When I run pvmove /dev/hdd1 I get theese errors:
> > > pvmove -- ERROR "Input/output error" reading sector 130688 from "/dev/hdd1"
> > > pvmove -- ERROR "Input/output error" reading sector 130689 from "/dev/hdd1"
> > > pvmove -- ERROR "Input/output error" reading sector 130690 from "/dev/hdd1"
> > > pvmove -- ERROR "Input/output error" reading sector 130691 from "/dev/hdd1"
> > > pvmove -- ERROR "Input/output error" reading sector 130692 from "/dev/hdd1"
> > > pvmove -- ERROR "Input/output error" reading sector 130693 from "/dev/hdd1"
> > > pvmove -- ERROR "Input/output error" reading sector 130694 from "/dev/hdd1"
> > > pvmove -- ERROR "Input/output error" reading sector 130695 from "/dev/hdd1"
> > > pvmove -- ERROR reading input physical volume "/dev/hdd1" (still 393216 
> > > bytes to read)
> > > pvmove -- ERROR "pv_move_pe(): read input PV" moving physical extents
> > > 
> > > I have tried to upgrade to the 1.0.3 tools and doing "pvmove -i /dev/hdd1" 
> > > but I still get the same errors.
> > > Im using lvm-mod version 1.0.1-rc4 with kernel 2.4.17.
> > > 
> > > Im willing to accept data loss, so is it possible to force the removal of 
> > > the  PV, even if its not empty?
> > > 
> > > Can I somehow display the files that occupies a PV? so that I know which 
> > > files will be lost.
> > > 
> > > What if I just remove the /dev/hdd1 partition with fdisk? will that mess up 
> > > the whole VG?
> > > 
> > > any help appreciateed!
> > > 
> > > 
> > > /Regards kalle...
> > > 
> > > 
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@sistina.com
> > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> > 
> > *** Software bugs are stupid.
> >     Nevertheless it needs not so stupid people to solve them ***
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> > 
> 
> -- 
> chris
> charwell@digitalpulp.com
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
