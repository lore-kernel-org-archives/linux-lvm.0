From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] ERROR vg_read
Message-ID: <20031222145410.F18654@sistina.com>
References: <E1AXXUt-0004RA-ES@adult.hosthr.net>
Mime-Version: 1.0
In-Reply-To: <E1AXXUt-0004RA-ES@adult.hosthr.net>; from zex@zex.biz on Sat, Dec 20, 2003 at 04:08:49AM +0100
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
Date: Mon Dec 22 08:00:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Could you send me the the metadata on /dev/hd[b-d]1 for further
anylysis, please ? (dd the 1st 4MB off each of those, tar the 4 files
up, bzip2 the tar-archive and send it to mge@sistina.com)

Regards,
Heinz    -- The LVM Guy --


On Sat, Dec 20, 2003 at 04:08:49AM +0100, Dzevad Hadzic wrote:
>  
> 
>  
> 
> Hello I have this problem, after the main disk in server wich was not part
> of LVM crashed I put new disk
> 
> and reinstall Debian 3.0 r2. I got error ERROR "vg_read_with_pv_and_lv():
> current PV" can't get data of volume group "ata" from physical volume(s)
> 
> vgscan and pvscan  say's this:
> 
>  
> 
> vgscan
> 
> vgscan -- reading all physical volumes (this may take a while...)
> 
> vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of
> volume group "ata" from physical volume(s)
> 
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> 
> vgscan -- WARNING: This program does not do a VGDA backup of your volume
> group
> 
>  
> 
> pvscan
> 
> pvscan -- reading all physical volumes (this may take a while...)
> 
> pvscan -- inactive PV "/dev/hde1"  is associated to unknown VG "ata" (run
> vgscan)
> 
> pvscan -- inactive PV "/dev/hdc1"  is associated to unknown VG "ata" (run
> vgscan)
> 
> pvscan -- inactive PV "/dev/hdd1"  is associated to unknown VG "ata" (run
> vgscan)
> 
> pvscan -- inactive PV "/dev/hdb1"  is associated to unknown VG "ata" (run
> vgscan)
> 
> pvscan -- total: 4 [414.41 GB] / in use: 4 [414.41 GB] / in no VG: 0 [0]
> 
>  
> 
> pvscan -d and vgscan -d are avaliable on request.
> 
>  
> 
> I'm very grateful for any help on this issue.
> 
>  
> 

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
