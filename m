Subject: Re: [linux-lvm] LVM recovery
From: Melinda Taylor <melinda@phys.unsw.edu.au>
In-Reply-To: <1058402110.1257.21.camel@neko>
References: <BDEMIPDEGABMNEFIHCPDMEHAFCAA.bill--f.juq41dsj@tao-group.com> 
	<1058402110.1257.21.camel@neko>
Content-Transfer-Encoding: 7bit
Message-Id: <1058415647.1257.107.camel@neko>
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
Date: Wed Jul 16 23:25:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Ok I am now getting somewhere with this:


I reinstalled LVM (but I am not sure what version I was running I think
it was 1.0.5 - will this make a difference?)

"pvscan" told me remaining LV and the VG they belong to:

pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/sdc1" of VG "vg02" [9.85 GB / 0 free]
pvscan -- inactive PV "/dev/sdc2"  is associated to unknown VG "vg01"
(run vgscan)
pvscan -- inactive PV "/dev/sdd1" of VG "vg02" [19.54 GB / 0 free]
pvscan -- inactive PV "/dev/sdd2"  is associated to unknown VG "vg01"
(run vgscan)
pvscan -- total: 4 [64.35 GB] / in use: 4 [64.35 GB] / in no VG: 0 [0]

vg02 was comprised of /dev/sdc1 and /dev/sdd1 which was /sw and /tmp so
it can be rebuilt as sdc and sdd both still exist

I tried to rebuild it: vgimport vg02 /dev/sdc1 /dev/sdd1

and recieved the error:

vgimport -- error: physical volume "dev/sdc1" doesn't belong to exported
volume group

So I tried: 

vgimport -f vg02 /dev/sdc1 /dev/sdd1
vgimport -- physical volumes "/dev/sdd1" and "/dev/sdc1" are in
different volume groups

Run vgscan:

[root@astro melinda]# /sbin/vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found inactive volume group "vg02"
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of
volume group "vg01" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
groups

Obviously vg01 is going to be the biggest problem but as both lv's from
vg02 still exist - how do I make it active?

I then tried to mount it but it creates an error: /dev/vg02/lv02 is not
a valid block device but it is there. So I am getting somewhere now at
least but I presume I need to make everything active.

Thanks,

melinda



On Thu, 2003-07-17 at 10:35, Melinda Taylor wrote:
> Hi All,
> 
> I haven't yet recieved any advice on how to recover any of the data on
> my remaining 2 of 4 disks but i think I know what to do.....think.....
> 
> I originally setup the system with the following steps:
> 
> - vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume
> group
> - pvcreate /dev/sda2 ; pvcreate /dev/sdb1; pvcreate /dev/sdc2; pvcreate
> /dev/sdd2
> - vgcreate vg01 /dev/sda2 /dev/sdb1 /dev/sdc2 /dev/sdd2
> - check no of LE pvdata -E /dev/sdc2 (5710 LE)
>  lvcreate -l 5711 -n lv03 vg01 /dev/sdc2
> - Make ext3 fs on each LV
>  mkfs.ext3 /dev/vg01/lv01
> 
> /dev/sda2 and /dev/sdb1 are kaput (both drives died within days of
> eachother).
> 
> I believe I had 4 logical volumes.
> 
> /dev/vg01/lv01
> /dev/vg01/lv02
> /dev/vg01/lv03
> /dev/vg01/lv04
> 
> in my volume group.
> 
> So I presume this means each LV resided on a separate drive and probably
> lv01 and lv02 were the 2 on the 2 dead disk drives.
> 
>     * PVs on four SCSI devices
>     * A VG called "vg01" comprised of said PVs
> 
> If I reinstall lvm on my newly installed system can I recover lv03 and
> lv04?
> 
> I have had a search and see something called importvg which I think may
> be what I need.
> 
> Had anyone ever had any experience recovering a volume group with
> missing disks?
> 
> I have backups of my lvm config but it seems like lvmtab etc are all
> binary files, are they of any use to me?
> 
> Many Thanks,
> 
> melinda
> 
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
