From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] one PV crashed
Message-Id: <20020215145552.B18145@sistina.com>
References: <878zad8qrx.fsf@papadoc.bayour.com>
    <20020201111151.B15491@sistina.com> <87bsf1eg6b.fsf@papadoc.bayour.com>
    <87wuxf6k3a.fsf@papadoc.bayour.com> <87sn836jjt.fsf@papadoc.bayour.com>
MIME-Version: 1.0
In-Reply-To: <87sn836jjt.fsf@papadoc.bayour.com>; from turbo@bayour.com on
    Fri, Feb 15, 2002 at 01:01:10PM +0100
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
Date: Fri Feb 15 07:57:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Turbo,

did you run "vgscan" *before* the "vgchange -ay"?
Not running it could explain the inactive PV on /dev/sdh1.


On Fri, Feb 15, 2002 at 01:01:10PM +0100, Turbo Fredriksson wrote:
> >>>>> "Turbo" == Turbo Fredriksson <turbo@bayour.com> writes:
> 
>     Turbo> This went ok, but 'pvscan -u' is behaving (?) strangly...
> 
> Shutting down (vgchange -a n), doing the vgcfgrestore, and then starting
> it again (vgchange -a y) gave me this:
> 
> ----- s n i p -----
> [papadoc.root]# /etc/init.d/lvm stop
> Shutting down LVM Volume Groups...
> vgchange -- no volume groups found
> 
> [papadoc.root]# vgcfgrestore -f /etc/lvmconf/vg1.conf -n vg1 -o /dev/sdg1 /dev/sdh1
> vgcfgrestore -- VGDA for "vg1" successfully restored to physical volume "/dev/sdh1"
> vgcfgrestore -- you may not have an actual backup of restored volume group "vg1"
> 
> [papadoc.root]# /etc/init.d/lvm start
> Setting up LVM Volume Groups...
> vgchange -- volume group "vg1" successfully activated
> 
> [papadoc.root]# pvscan -u
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- ACTIVE   PV "/dev/sdb1 " with UUID "ofZCeT-O16H-Df0h-4KoB-xQhm-lc24-67dZvk" of VG "vg1" [5.87 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/sdc1 " with UUID "xN0MF7-xKU0-Uk3L-g8Pw-0YfH-fS3V-zgFA66" of VG "vg1" [1004.00 MB / 0 free]
> pvscan -- ACTIVE   PV "/dev/sdd10" with UUID "5V0XNB-gA87-OU66-1iza-cvsz-xQ2q-6DEbyH" of VG "vg1" [2.37 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/sde1 " with UUID "Bdm7PX-50Dq-hC6R-yXmv-DDq1-n6Nx-4ohaKK" of VG "vg1" [8.50 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/sdf1 " with UUID "QnqfyA-fOTB-J1Pp-4be5-t6QU-bGjS-i2BKf2" of VG "vg1" [17.09 GB / 0 free]
> pvscan -- inactive PV "/dev/sdh1 " with UUID "ZNODti-EFFz-rGID-HYyh-kg7Z-yDCe-LLbXBv" is in no VG  [15.55 GB]
> pvscan -- total: 6 [50.39 GB] / in use: 5 [34.84 GB] / in no VG: 1 [15.55 GB]
> ----- s n i p -----
> 
> 
> I'm getting so close, I can SMELL the coffey! :)
> 
> Why is sdh1 inactive?
> 
> Qaddafi NSA Treasury NORAD FBI smuggle Saddam Hussein Kennedy Soviet
> jihad bomb genetic Khaddafi pits quiche
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
