Subject: Re: [linux-lvm] Corrupted LVM, need help
From: Austin Gonyou <austin@coremetrics.com>
In-Reply-To: <20020930205951.QYHW19870.imf15bis.bellsouth.net@TAZ2>
References: <20020930205951.QYHW19870.imf15bis.bellsouth.net@TAZ2>
Content-Transfer-Encoding: 7bit
Message-Id: <1033421550.27828.49.camel@UberGeek.coremetrics.com>
Mime-Version: 1.0
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
Date: Mon Sep 30 16:33:13 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

have you tried doing vgcfgrestore /dev/sdxx?



On Mon, 2002-09-30 at 15:56, Greg Freemyer wrote:
> All,
> 
> I have a LVM based data disk with 3 LVs.  My OS disks are _not_ LVM
> based.
> 
> We had a lightning storm over the weekend, and an old kernel (2.4.18)
> got 
> booted when the machine was powered back on.  I have 2.4.19 running
> again now.
> 
> Now I get the following:
> 
> SuSEbox:~ # pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/sda1"  is associated to unknown VG
> "TruStore-Data" 
> (run vgscan)
> pvscan -- total: 1 [55.91 GB] / in use: 1 [55.91 GB] / in no VG: 0 [0]
> 
> SuSEbox:~ # vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- ERROR "lv_read_all_lv(): number of LV" can't get data of
> volume group 
> "TruStore-Data" from physical volume(s)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your
> volume group
> 
> SuSEbox:~ # 
> 
> Any ideas on how to restore my LVM config tables (VGDAs ??).  I think
> LVM keeps 
> backups somewhere.
> 
> 
> Greg Freemyer
> Internet Engineer
> Deployment and Integration Specialist
> Compaq ASE - Tru64 v4, v5
> Compaq Master ASE - SAN Architect
> The Norcross Group
> www.NorcrossGroup.com
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
-- 
Austin Gonyou <austin@coremetrics.com>
Coremetrics, Inc.
