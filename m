Subject: Re: [linux-lvm] problem
From: Daniel Wittenberg <daniel-wittenberg@uiowa.edu>
In-Reply-To: <33170000.1042057292@[192.168.200.4]>
References: <1042049056.1433.29.camel@tux.its.uiowa.edu>
	 <33170000.1042057292@[192.168.200.4]>
Message-Id: <1042057991.12153.0.camel@tux.its.uiowa.edu>
Mime-Version: 1.0
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
Date: Wed Jan  8 14:32:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Ugh...

# vgexport -av
vgexport -- locking logical volume manager
vgexport -- checking volume group name
vgexport -- checking volume group activity
vgexport -- reading data of volume group "rootvg" from disk(s)
vgexport -- only found 0 of 39 LEs for LV /dev/rootvg/tmp (0)
vgexport -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" reading
data of volume group "rootvg"

vgexport -- unlocking logical volume manager

Other ideas?

Thanks,
Dan

On Wed, 2003-01-08 at 14:21, Steven Lembark wrote:
> -- Daniel Wittenberg <daniel-wittenberg@uiowa.edu>
> 
> > I had 2 drives in my machine, with a VG across both of them.  The only
> > thing on the second drive was part of /tmp, so when the second drive
> > died I didn't really lose anything.  But I have problems now because I
> > can't activate the VG because part of it is missing, but I can't remove
> > tmp, so it's a catch-22.  Is there anyway to remove an LV without
> > activating the VG?  Or another way I can tell it to ignore missing LV's?
> 
> vgexport + vgimport should do it for you if none of the
> other LV's stretched onto the dead drive.
> 
> If you don't want to spread data across drives that are
> not maintained with some sort of RAID then you are
> probably better off putting the drives in separate VG's
> so that data doesn't accidentally spill across the disks.
> 
> 
> --
> Steven Lembark                               2930 W. Palmer
> Workhorse Computing                       Chicago, IL 60647
>                                             +1 773 252 1080
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
-- 
===========================
Daniel Wittenberg
Senior Unix Admin
University of Iowa - ITS
