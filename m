From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Repairing LVM installations
Message-ID: <20021028164912.A18086@sistina.com>
References: <20021026045558.GA7158@sonsofthunder.yi.org> <20021028100812.C16452@sistina.com> <1035810145.11532.117.camel@defiant>
Mime-Version: 1.0
In-Reply-To: <1035810145.11532.117.camel@defiant>; from storm@tux.org on Mon, Oct 28, 2002 at 08:02:24AM -0500
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
Date: Mon Oct 28 09:52:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Oct 28, 2002 at 08:02:24AM -0500, Bradley Alexander wrote:
> On Mon, 2002-10-28 at 04:08, Heinz J . Mauelshagen wrote:
> > 
> > Bradley,
> > 
> > looks like Norton defrag toasted your physical volume :(
> 
> Yep.
>  
> > There might be a slight chance to get it back, if you have an LVM
> > metadata backup at hand (/etc/lvmconf/vg00.conf) and use vgcfgrestore
> > to restore it to the physical volume.
> 
> I tried this and when I tried listing the file, I got the same
> consistency error message:
> 
> [defiant /etc/lvmconf]# vgcfgrestore -f /etc/lvmconf/vg00.conf.2.old -l
> -n vg00
> vgcfgrestore -- ERROR "vg_cfgrestore(): pv_check_consistency" restoring
> volume group "vg00"

"pvcreate -ff ..." on the PV first.

> 
> vg00.conf.2.old should be the one immediately prior to the "incident".
> 
> When I tried an actual restore, it groused about changing an active
> volume group, so I guess I'll go single-user and try it again.
> 
> > But I guess Norton damaged more than just the LVM metadata area which sits
> > at the beginning of the drive.
> > You should try restoring the metadata though.
> 
> Not knowing what Norton has cabbaged, I would be happy if I could just
> move the active extents from the damaged volume to another one long
> enough to remobe, rebuild and reactivate it.

Well, if the vgcfgrestore brings your VG back it is still questionable what
data is toasted. If any the move won't help either and you want to
go for your backup media :(


> 
> > Hopefully you've got an actual backup of your logical volumes!
> 
> I'm using the one prior to the drive getting nortoned. :)
> 
> -- 
> --Brad
> ============================================================================
> Bradley M. Alexander                |   storm [at] debian.org
> Debian Developer, Security Engineer |   storm [at] tux.org
> Debian/GNU Linux Developer          | Visit the 99th VFS website at:
> 99th VFS 'Tuskegee Airmen'          |   http://99thvfs-ta.org
> ============================================================================
> Key fingerprints:
> DSA 0x54434E65: 37F6 BCA6 621D 920C E02E  E3C8 73B2 C019 5443 4E65
> RSA 0xC3BCBA91: 3F 0E 26 C1 90 14 AD 0A  C8 9C F0 93 75 A0 01 34
> ============================================================================
> If guns are outlawed, can we use swords?
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

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
