Message-ID: <3F164A80.6060301@free.fr>
From: Emmanuel Varagnat <emmanuel.varagnat@free.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM recovery
References: <BDEMIPDEGABMNEFIHCPDMEHAFCAA.bill--f.juq41dsj@tao-group.com> <1058402110.1257.21.camel@neko>
In-Reply-To: <1058402110.1257.21.camel@neko>
Content-Transfer-Encoding: 7bit
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
Date: Thu Jul 17 02:05:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Melinda Taylor wrote:

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

I would say that it can depend on what is the block allocation policy of 
the LVM system...

> So I presume this means each LV resided on a separate drive and probably
> lv01 and lv02 were the 2 on the 2 dead disk drives.
> 
>     * PVs on four SCSI devices
>     * A VG called "vg01" comprised of said PVs
> 
> If I reinstall lvm on my newly installed system can I recover lv03 and
> lv04?

You should try LVM2 that can deal with partial/truncated volumes.

-=( manu )=-
