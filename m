From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] one PV crashed
Message-Id: <20020206205702.A6967@sistina.com>
References: <878zad8qrx.fsf@papadoc.bayour.com>
    <20020201111151.B15491@sistina.com> <87wuxx1duy.fsf@papadoc.bayour.com>
    <87r8nyan7a.fsf@papadoc.bayour.com>
MIME-Version: 1.0
In-Reply-To: <87r8nyan7a.fsf@papadoc.bayour.com>; from turbo@bayour.com on
    Wed, Feb 06, 2002 at 12:01:29PM +0100
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
Date: Wed Feb  6 13:58:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Feb 06, 2002 at 12:01:29PM +0100, Turbo Fredriksson wrote:
> Quoting Turbo Fredriksson <turbo@bayour.com>:
> 
> > [papadoc.root]# vgcfgrestore -f /etc/lvmconf/vg1.conf -n vg1 /dev/loop0
> > vgcfgrestore -- physical volume "/dev/loop0" doesn't belong to volume group "vg1"
> > 
> > [papadoc.root]# vgcfgrestore -f /etc/lvmconf/vg1.conf -n vg1 -o /dev/sdg1 /dev/loop0
> > vgcfgrestore -- ERROR "pv_read(): pv_create_name_from_kdev_t" reading physical volume "/dev/loop0"
> >
> > [papadoc.root]# pvdisplay -v /dev/loop0 
> > pvdisplay -- getting physical volume size
> > pvdisplay -- ERROR "pv_read(): pv_create_name_from_kdev_t" no VALID physical volume "/dev/loop0"
> 
> 
> Does anyone have a solution to this? What am I doing wrong?

Turbo,

you seem to be using an older LVM version with broken loop support :-(
Found a bug in vgcfgrestore(8) which will likely cause problems with this too.
More to follow...


> 
> 
> SEAL Team 6 Iran killed KGB Kennedy Treasury cracking Semtex quiche
> strategic radar Honduras Legion of Doom nitrate PLO
> [See http://www.aclu.org/echelonwatch/index.html for more about this]
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
