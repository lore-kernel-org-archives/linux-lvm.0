From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Unusable VG after a failed pvmove
Message-ID: <20030129151842.A23215@sistina.com>
References: <4343.193.189.186.50.1043846076.squirrel@webmail.literal.si>
Mime-Version: 1.0
In-Reply-To: <4343.193.189.186.50.1043846076.squirrel@webmail.literal.si>; from jure.simsic@literal.si on Wed, Jan 29, 2003 at 02:14:36PM +0100
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
Date: Wed Jan 29 08:21:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Jure,

based on the freeze you reported it sounds like your drive is dying under you :(

Please make sure that you've got backups of /etc/lvmconf/* and /etc/lvmtab*
before you proceed.

You can try to vgcfgrestore(8) the LVM metadata to all PVs contained in the VG
with the failing drive (you need to "pvcreate -ff" them before you can run
vgcfgrestore). Take the backup in /etc/lvmconf to do that which reflects
the situation before pvmove started.

If that doesn't work because pvcreate/vgcfgrestore fail writing to
the bad drive, you can install LVM2/device-mapper from our CVS and
try "vgscan ; vgreduce --removemissing" in order to get rid of the failed
drive.
In case this is the solution for you, you can continue using LVM1 afterwards.

Regards,
Heinz    -- The LVM Guy --

On Wed, Jan 29, 2003 at 02:14:36PM +0100, Jure Simsic wrote:
> Hi all,
> 
> Last time I had some warnings about  IDE error which indicated that one of
> my disks is starting to fail.  So i bought a new one and tried to *pvmove*
> the stuff from that disk to a new one.After  pvmoving for a while, I got:
> 
> pvmove -- ERROR reading input physical volume "/dev/hda2" (still 786432
> bytes to readpvmove -- ERROR "pv_move_pe(): read input PV" pv_move_pe
> pvmove -- ERROR "pv_move_pe(): read input PV" moving physical extends
> 
> and the thing stopped. After a couple of minutes, my computer froze
> completely (no kbd, no network) - something one knows more from M$ world -
> so there was nothing else to do than to power off/on..
> When it started, all went ok, untill the LVM part. Then I got this:
> 
> vgscan -- found inactive volume group "vg0"
> vgscan -- only found 1033 of 1070 LEs for LV /dev/vg0/usr (0)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get
> data of volume group "vg0" from physical volume(s)vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating
> "/etc/lvmtab" and "/etc/lvmtab.d"
> vgchange -- no volume groups found
> 
> 
> So I'm stuck with / only, my /usr and /home are gone.
> If it maters at all, I used to run reiserfs on /usr and /home...
> 
> Is there any way I can try to recover from this?
> 
> Thanks for any help
> 
> Jure
> vgscan --
> 
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
