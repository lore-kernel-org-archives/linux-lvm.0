Received: from o.ww.redhat.com (vpnuser1.stuttgart.redhat.com [172.16.4.1])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id i1KFDHa5017564
	for <linux-lvm@redhat.com>; Fri, 20 Feb 2004 16:13:17 +0100
From: Heinz Mauelshagen <Mauelshagen@redhat.com>
Subject: Re: [linux-lvm] vgcreate -- ERROR 2 writing volume group backup file /etc/lvmtab.d/new.tmp in vg_cfgbackup.c [line 257]
Message-ID: <20040220151318.GA25086@redhat.com>
References: <006e01c3f748$dfd91e00$9700a8c0@iris>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <006e01c3f748$dfd91e00$9700a8c0@iris>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Fri Feb 20 10:12:19 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

On Fri, Feb 20, 2004 at 09:31:16AM +0900, ���̶� wrote:
> I'm lvm beginner ^^
> Now I made a physical volume.(#pvcreate -ff /dev/sdc1)
> but following problem occured..
> 
> I don't know why
> Help me, please..
> 
> 
> #vgcreate new /dev/sdc1 
> vgcreate -- INFO: using default physical extent size 4 MB
> vgcreate -- INFO: maximum logical volume size is 255.99 Gigabyte
> vgcreate -- ERROR 2 writing volume group backup file /etc/lvmtab.d/new.tmp in vg_cfgbackup.c [line 257]
> vgcreate -- ERROR "vg_cfgbackup(): write" writing "/etc/lvmtab"

Filesystem holding /etc is either readonly or full.

> 
> #vgchange -a n new
> vgchange -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please run vgscan
> 
> #vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found active volume group "new"
> vgscan -- ERROR 2 writing volume group backup file /etc/lvmtab.d/new.tmp in vg_cfgbackup.c [line 257]
> vgscan -- ERROR: unable to do a backup of volume group "new"
> vgscan -- ERROR "lvm_tab_vg_remove(): unlink" removing volume group "new" from "/etc/lvmtab"
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume group
> 
> 
> fdisk -l
> 
> Disk /dev/sdc: 64 heads, 32 sectors, 1436208 cylinders
> Units = cylinders of 2048 * 512 bytes
> 
>    Device Boot    Start       End    Blocks   Id  System
> /dev/sdc1             1   1436208 1470676976   8e  Linux LVM
-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
