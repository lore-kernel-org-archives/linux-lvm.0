Return-Path: <root@srv.sistina.com>
Date: Wed, 30 May 2001 15:43:47 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] ERROR pv_move_pe()
Message-ID: <20010530154347.A32114@sistina.com>
References: <Pine.GSO.4.33.0105301150450.9306-100000@zuse>
Mime-Version: 1.0
In-Reply-To: <Pine.GSO.4.33.0105301150450.9306-100000@zuse>; from tv@rz-zw.fh-kl.de on Wed, May 30, 2001 at 02:33:40PM +0200
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, May 30, 2001 at 02:33:40PM +0200, Timo Veith wrote:
> Hi all!
> 
> We have a Red Hat Linux system with kernel 2.4.3 using LVM 0.9.1 beta7.
> There is one VG defined with 6 PVs. We added another hard disk to the
> VG, trying to replace a smaller PV by using pvmove. The pvmove command
> failed after a long run with the following error message:
> 
> root@host[~] pvmove /dev/hdd1
> pvmove -- moving physical extents in active volume group "vg00"
> pvmove -- WARNING: if you lose power during the move you may need to
> restore your LVM metadata from backup!
> pvmove -- do you want to continue? [y/n] y
> pvmove -- ERROR reading input physical volume "/dev/hdd1" (still 65536 bytes to read)
> 
> pvmove -- ERROR "pv_move_pe(): read input PV" pv_move_pe
> 
> pvmove -- ERROR "pv_move_pe(): read input PV" moving physical extents
> 
> TH output of pvdisplay /dev/hdd1 shows that there is only one PE left
> to move away from /dev/hdd1. We've tried to change the state of the
> VG from active to inactive and from the LV also. Even with the
> filesystem (reiserfs) mounted or unmounted the same error message
> appears.

Do I get right that you deactivated the VG, activated it again and
were not able to pvmove that last PE away from /dev/hdd1.

If so, it sounds like a bug in pv_move_pes() in the library or something.

Could you please send "pvmove -d" output to me in direct mail to sort
this one out.

> 
> Where is this error message coming from, how can we solve this
> problem?
> 
> What happens if we just reduce the VG by /dev/hdd1 although there is
> still one PE of the VG on it?

You can't do that. A PV must have *no* PEs allocated to LVs.

> 
> 
> Thanks in advance for any help.
> 
> Regards,
> 
> 
>      Timo
> 
> 
> 
> 
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
