From: Denie Andriessen <denie@blok14b.gimmie.tudelft.nl>
Subject: Re: [linux-lvm] PV-Move fails, now at 127 Pe's...
In-Reply-To: <20020306105407.A21935@sistina.com>
Message-Id: <Pine.LNX.4.33.0203061559240.5666-100000@blok14b.gimmie.tudelft.nl>
MIME-Version: 1.0
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
Date: Wed Mar  6 09:01:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

Applied the patch, but 1 problem still remains..

It claims that the VG "volume" is an unknown volume, and therefor it also
does not want to start to do a pvmove... :(

Is all data lost now ?

Denie

On Wed, 6 Mar 2002, Heinz J . Mauelshagen wrote:

> 
> Well, you hit the cast problem I reported a fix for on linux-lvm shortly
> after the LVM 1.0.3 release.
> 
> Sorry for the inconvenience!
> 
> Here's the patch again.
> 
> Regards,
> Heinz    -- The LVM Guy --
> > ------- info-----------
> > pvmove -- writing physical extent part of VGDA on destination "/dev/hdg1"
> > lv: /dev/volume/data[1]  old_dev: 22:01  new_dev: 34:01  old_pe_sector:
> > 4176642  new_pe_sector: 47036865
> > pvmove -- opening output physical volume "/dev/hdg1"
> > pvmove -- llseeking input physical volume "/dev/hdc1"
> > pvmove -- llseeking output physical volume "/dev/hdg1"
> > pvmove -- /dev/hdc1 [PE 127 [data [LE 7328]] -> /dev/hdg1 [PE 1435]
> > [128/3577]
> > pvmove -- locking physical extent 127 of "/dev/hdc1" in kernel
> > pvmove -- about to read input physical volume "/dev/hdc1" and to write
> > output physical volume "/dev/hdg1"
> > pvmove -- ERROR reading input physical volume "/dev/hdc1" (still 7733248
> > bytes to read)
> > pvmove -- ERROR "pv_move_pe(): read input PV" moving physical extents
> > 
> > [root@localhost /]# lvscan
> > lvscan -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please run
> > vgscan
> > 
> > [root@localhost /]# vgscan
> > vgscan -- reading all physical volumes (this may take a while...)
> > vgscan -- found active volume group "volume"
> > vgscan -- only found 20391 of 20518 LEs for LV /dev/volume/data (0)
> > vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get
> > data of volume group "volume" from physical volume(s)
> > vgscan -- found active volume group "mp3volume"
> > vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> > vgscan -- WARNING: This program does not do a VGDA backup of your volume
> > groups
> > 
> > [root@localhost /]# lvscan
> > lvscan -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please run
> > vgscan
> > 
> > [root@localhost /]# vgdisplay
> > vgdisplay -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please run
> > vgscan
> > 
> > [root@localhost /]# vgdisplay -v volume
> > vgdisplay -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please run
> > vgscan
