From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Error after moving volume group to another machi
Message-ID: <20020904145914.A27187@sistina.com>
References: <XFMail.20020903224718.f.hinzmann@hamburg.de> <XFMail.20020904130102.f.hinzmann@hamburg.de>
Mime-Version: 1.0
In-Reply-To: <XFMail.20020904130102.f.hinzmann@hamburg.de>; from f.hinzmann@hamburg.de on Wed, Sep 04, 2002 at 01:01:02PM +0200
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
Date: Wed Sep  4 08:17:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Florian,

is it really 3 HDDs you want to move, not 4?
It says "Cur PV		4" in the pvdata output below.
Maybe that still makes sense, because you have 2 PVs in 2 partitions on
the very same physical disk.

That pvdata reports an empty VG name is just a minor flaw but doesn't show
an error.

Regards,
Heinz    -- The LVM Guy --


On Wed, Sep 04, 2002 at 01:01:02PM +0200, Florian Hinzmann wrote:
> Uh, oh, replying to myself:
> 
> On 03-Sep-2002 Florian Hinzmann wrote:
> 
> > But the moved VG isn't detected properly. This is what I get:
> > vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of volume group "vg01" from physical volume(s)
> > vgscan -- reading all physical volumes (this may take a while...)
> > vgscan -- found inactive volume group "vgpum01"
> > vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> > vgscan -- WARNING: This program does not do a VGDA backup of your volume groups
> 
> The disks are back in their original machine currently. 
> 
> 
> pvdata gives me:
> 
> --- Physical volume ---
> PV Name               /dev/hdb1
> VG Name               vg01
> PV Size               76.34 GB [160086526 secs] / NOT usable 8.19 MB [LVM: 166 KB]
> PV#                   4
> PV Status             available
> Allocatable           yes (but full)
> Cur LV                5
> PE Size (KByte)       8192
> Total PE              9769
> Free PE               0
> Allocated PE          9769
> PV UUID               jRyOAJ-1KHk-564T-jrQS-BHWC-OKhu-JiL9d4
> 
> --- Volume group ---
> VG Name               
> VG Access             read/write
> VG Status             NOT available/resizable
> VG #                  0
> MAX LV                256
> Cur LV                9
> Open LV               0
> MAX LV Size           511.98 GB
> Max PV                256
> Cur PV                4
> Act PV                4
> VG Size               212.07 GB
> PE Size               8 MB
> Total PE              27145
> Alloc PE / Size       27145 / 212.07 GB
> Free  PE / Size       0 / 0
> VG UUID               BVZr37-mltv-69XE-pnBS-5ryg-NcKL-k6Fcfy
> 
> --- List of logical volumes ---
> 
> pvdata -- logical volume "/dev/vg01/home" at offset   0
> pvdata -- logical volume "/dev/vg01/usr" at offset   1
> [...]
> 
> 
> "VG Name" in "--- Volume group ---" is empty. Is this normal? In case
> this or some other errors within the data structures within one or
> more partitions is the cause of my problems: 
> My setup is currently working obviosly. Is there a way to write this
> working configuration into every LVM partition's metadata overwriting 
> some possible errors there?
> 
> 
>  Regards
>     Florian
> 
> 
> --
>   Florian Hinzmann                         private: f.hinzmann@hamburg.de
>                                             Debian: fh@debian.org
> PGP Key / ID: 1024D/B4071A65
> Fingerprint : F9AB 00C1 3E3A 8125 DD3F  DF1C DF79 A374 B407 1A65
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
