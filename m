From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgscan / vgimport problems
Message-ID: <20011105125510.B25559@sistina.com>
References: <C9B993D4214AD511BC010002A537DFE30A8B96@acsexchweb.corp.acsalaska.com>
Mime-Version: 1.0
In-Reply-To: <C9B993D4214AD511BC010002A537DFE30A8B96@acsexchweb.corp.acsalaska.com>; from snay@acsalaska.com on Tue, Oct 30, 2001 at 09:38:43AM -0900
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
Date: Mon Nov  5 05:58:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Shawn,

you need to get the actual LVM version running in order to solve your
problem.
If there's no constraints to stay with the Redhat patched kernel, you should
follow the patch instructions in the LVMs distro contained files INSTALL
and PATHCE/README (guess that you probably know those already from the
things you say below ;-), build+install the kernel and the LVM lib and tools.

vgscan should find your VG then (crossing fingers ;-)

Regards,
Heinz    -- The LVM Guy --


On Tue, Oct 30, 2001 at 09:38:43AM -0900, Nay, Shawn wrote:
> I am an LVM newbie but did manage to get it up and running on a non-system
> disk.
> I rebuild my system with the same version of Linux (Redhat 7.2), the same
> kernel (2.4.9-7, which I recompiled for LVM), and the same version of LVM
> (0.9.1_beta7).  By the way...I am using an old release of LVM due to my
> inability to patch this kernel with 1.0.1-rc4.  The problem is that I am
> unable to import my old vg.  This disk has remained untouched since my
> previous install.
> 
> pvscan output:
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/hdd"  is associated to an unknown VG (run
> vgscan)
> pvscan -- total: 1 [31.08 MB] / in use: 1 [31.08 MB] / in no VG: 0 [0]
> 
> vgscan output:
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found inactive volume group "sundogvg"
> vgscan -- only found 0 of 5120 LEs for LV /dev/sundogvg/datalv (0)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get
> data of volume group "sundogvg" from physical volume(s)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating
> "/etc/lvmtab" and "/etc/lvmtab.d"
> 
> vgimport output:
> vgimport -- ERROR: physical volume "/dev/hdd" doesn't belong to an exported
> volume group
> 
> Any help would be greatly appreciated.
> 
> Shawn
> 
> 
> 
> 
> This transmittal may contain confidential information intended solely for
> the addressee. If you are not the intended recipient, you are hereby
> notified that you have received this transmittal in error; any review,
> dissemination, distribution or copying of this transmittal is strictly
> prohibited. If you have received this communication in error, please notify
> us immediately by reply or by telephone (collect at 907-564-1000) and ask to
> speak with the message sender. In addition, please immediately delete this
> message and all attachments. Thank you.
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
