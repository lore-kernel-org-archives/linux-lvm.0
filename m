From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] same PV detected twice -> VGs mix up
Message-ID: <20030820125339.C8426@sistina.com>
References: <3F32710D.6040206@web.de>
Mime-Version: 1.0
In-Reply-To: <3F32710D.6040206@web.de>; from eckhard.neber@web.de on Thu, Aug 07, 2003 at 05:32:29PM +0200
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
Date: Wed Aug 20 06:00:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Eckhard,

looks like /dev entries got messed up.
Please try "vgscan -f" to fix them.

Regards,
Heinz    -- The LVM Guy --


On Thu, Aug 07, 2003 at 05:32:29PM +0200, Eckhard Neber wrote:
> Hello,
> 
> I have a strange problem here.
> During installation we misconfigured our external raid somehow to 
> provide the same lodical drive as lun0 as well as lun1. Linux detects 
> both and maps them as sdb and sdc.
> Lvm activates one of them and everything works well, so we decided to 
> leave it that way as the server was already in use when we discovered 
> this problem.
> Now we wanted to add two more ATA discs to the server that were used in 
> a different computer as one logical volume (data120).
> Here is the output of some of the tools:
> 
> 5#e:~ pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/sdb" of VG "raid"    [1.01 TB / 173.03 GB free]
> pvscan -- ACTIVE   PV "/dev/sdc" of VG "raid"    [1.01 TB / 173.03 GB free]
> pvscan -- inactive PV "/dev/hdc" of VG "data120" [57.26 GB / 0 free]
> pvscan -- inactive PV "/dev/hdd" of VG "data120" [57.26 GB / 0 free]
> pvscan -- total: 4 [2.13 TB] / in use: 4 [2.13 TB] / in no VG: 0 [0]
> 
> 
> 5#e:~ vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found active volume group "raid"
> vgscan -- found active volume group "data120"
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume 
> groups
> 
> 
> 5#e:~ lvscan
> lvscan -- ACTIVE            "/dev/raid/soft" [200 GB]
> lvscan -- ACTIVE            "/dev/raid/mail" [10 GB]
> lvscan -- ACTIVE            "/dev/raid/backup" [600 GB]
> lvscan -- ACTIVE            "/dev/raid/users" [50 GB]
> lvscan -- ACTIVE            "/dev/raid/soft" [200 GB]
> lvscan -- ACTIVE            "/dev/raid/mail" [10 GB]
> lvscan -- ACTIVE            "/dev/raid/backup" [600 GB]
> lvscan -- ACTIVE            "/dev/raid/users" [50 GB]
> lvscan -- 8 logical volumes with 1.68 TB total in 2 volume groups
> lvscan -- 8 active logical volumes
> 
> 
> It is remarkable that the LVs of raid show up twice. What is really 
> strange is that if I mount /dev/data120/backup, which is the LV of the 
> ATA disks, it works, but I get the contents of /dev/raid/soft.
> How can it be that these two VGs get mixed up? Is it because there are 
> identical names?
> A quick solution could probably be to restrict the kernel to probe only 
> for lun0. I'd like to avoid to change the configuration of the raid 
> because it would require to fully back it up (in case that something 
> goes wrong).
> We are using a kernel that was build from SuSE's sorces 
> linux-2.4.20.SuSE-86.
> 
> I don't dare to mount and modify anything with data120 as I fear that it 
> could damage the other LVs.
> 
> Any help would be appreciated.
> Thanks in advance
> 
> Eckhard Neber
> -- 
> -----------------------------------------------------------------
> Eckhard Neber                           Tel: ++49-(0)731-50-26354
> Abt. Mikrowellentechnik                 Fax: ++49-(0)731-50-26359
> Universitaet Ulm                     e-mail: eckhard.neber@web.de
> 89069 Ulm
> -----------------------------------------------------------------
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
