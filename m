From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] PV-Move fails, now at 127 Pe's...
Message-Id: <20020306123534.A22533@sistina.com>
References: <20020306105407.A21935@sistina.com>
    <Pine.LNX.4.33.0203061156070.5102-100000@blok14b.gimmie.tudelft.nl>
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.33.0203061156070.5102-100000@blok14b.gimmie.tudelft.nl>;
    from denie@pink.nl on Wed, Mar 06, 2002 at 12:02:29PM +0100
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
Date: Wed Mar  6 05:37:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Denie,

got service unavailable for denie@blok14b.gimmie.tudelft.nl :-(

Regards,
Heinz    -- The LVM Guy --


On Wed, Mar 06, 2002 at 12:02:29PM +0100, Denie Andriessen wrote:
> Hi,
> 
> So now the volume is inactive, I can't change it, although it notices 
> there is an inactive volume on the disks...
> 
> hdb1 and hdc1 both have 127 blocks on there now, and hdg1 has 2*127 block 
> removed. I can't access the data anymore now... Any suggestions on how to 
> get the volume back online, so the data can be accessed ???
> 
> -------------
> vgscan -- only found 20391 of 20518 LEs for LV /dev/volume/data (0)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't 
> get data of volume group "volume" from physical volume(s)
> -------------
> 
> Denie
> 
> 
> On Wed, 6 Mar 2002, Heinz J . Mauelshagen wrote:
> 
> > 
> > Well, you hit the cast problem I reported a fix for on linux-lvm shortly
> > after the LVM 1.0.3 release.
> > 
> > Sorry for the inconvenience!
> > 
> > Here's the patch again.
> > 
> > Regards,
> > Heinz    -- The LVM Guy --
> > 
> > On Wed, Mar 06, 2002 at 01:05:53AM +0100, Denie Andriessen wrote:
> > > Hi,
> > > 
> > > So, I've updated my lvm tools from 0.9.1-beta2 to 1.0.3., and now I seem to
> > > have ran into quite some problems..
> > > 
> > > Ran all test of the move again, and after a few faultless flows I started
> > > off again..
> > > We have a volume with 4 * 60, 2 * 80 disk, and another volume (new one, new
> > > disk) with 120Gb.
> > > 
> > > I'd like to move one 60Gb disk to the volume with the 120 Gb disk.
> > > 
> > > E2fsran nicely, then I started with a PV move, to get /dev/hdc1 out (after
> > > failing the first time I tries also to move /dev/hdb1 out) both failing at
> > > the same point, that is with 127 PE's moved...
> > > 
> > > Any takers ?
> > > 
> > > Regards,
> > > ------- info-----------
> > > pvmove -- writing physical extent part of VGDA on destination "/dev/hdg1"
> > > lv: /dev/volume/data[1]  old_dev: 22:01  new_dev: 34:01  old_pe_sector:
> > > 4176642  new_pe_sector: 47036865
> > > pvmove -- opening output physical volume "/dev/hdg1"
> > > pvmove -- llseeking input physical volume "/dev/hdc1"
> > > pvmove -- llseeking output physical volume "/dev/hdg1"
> > > pvmove -- /dev/hdc1 [PE 127 [data [LE 7328]] -> /dev/hdg1 [PE 1435]
> > > [128/3577]
> > > pvmove -- locking physical extent 127 of "/dev/hdc1" in kernel
> > > pvmove -- about to read input physical volume "/dev/hdc1" and to write
> > > output physical volume "/dev/hdg1"
> > > pvmove -- ERROR reading input physical volume "/dev/hdc1" (still 7733248
> > > bytes to read)
> > > pvmove -- ERROR "pv_move_pe(): read input PV" moving physical extents
> > > 
> > > [root@localhost /]# lvscan
> > > lvscan -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please run
> > > vgscan
> > > 
> > > [root@localhost /]# vgscan
> > > vgscan -- reading all physical volumes (this may take a while...)
> > > vgscan -- found active volume group "volume"
> > > vgscan -- only found 20391 of 20518 LEs for LV /dev/volume/data (0)
> > > vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get
> > > data of volume group "volume" from physical volume(s)
> > > vgscan -- found active volume group "mp3volume"
> > > vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> > > vgscan -- WARNING: This program does not do a VGDA backup of your volume
> > > groups
> > > 
> > > [root@localhost /]# lvscan
> > > lvscan -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please run
> > > vgscan
> > > 
> > > [root@localhost /]# vgdisplay
> > > vgdisplay -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please run
> > > vgscan
> > > 
> > > [root@localhost /]# vgdisplay -v volume
> > > vgdisplay -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please run
> > > vgscan
> > > 
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
> > =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> > 
> > Heinz Mauelshagen                                 Sistina Software Inc.
> > Senior Consultant/Developer                       Am Sonnenhang 11
> >                                                   56242 Marienrachdorf
> >                                                   Germany
> > Mauelshagen@Sistina.com                           +49 2626 141200
> >                                                        FAX 924446
> > =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> > 
> 
> -- 
> 
> 
> 
> 
> ----- geekcode sig file -----
> GCM/GCS/GS d- s: a C++$ U+++$ P+++$ L++$ E- W+++$ N++ u K w++ O M
> V PS PE++ Y+ PGP t+ 5 X++ R tv- b++ DI++ D+ G e+++ h-- r+>++ y++
> -----------------------------
> 
> 
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
