Return-Path: <ex8k-hbn@asahi-net.or.jp>
Date: Fri, 15 Dec 2000 02:43:13 +0900
Message-ID: <87hf46kifi.wl@pear.hibi-local.net>
From: HIBINO Kei <ex8k-hbn@asahi-net.or.jp>
Subject: Re: [linux-lvm] Debian packaging
In-Reply-To: <Pine.LNX.4.30.0012141645040.17005-100000@falka.mfa.kfki.hu>
References: <0012132115222N.00826@lyta>
	<Pine.LNX.4.30.0012141645040.17005-100000@falka.mfa.kfki.hu>
MIME-Version: 1.0
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

At Thu, 14 Dec 2000 16:50:41 +0100 (CET),
Tamas Gergely wrote:

> As I noticed the LVM utilities are placed under /usr in this LVM.DEB .
> 
> Wouldn't it be better to use '/' as root not '/usr'?
> I mean, it would be better to place the utilities into /sbin instead of
> /usr/sbin.
> 
> (on many systems /usr is located on an LV. But activiting/disactivating
> using vgchange is impossible after unmounting /usr)

I fixed the above and some problems of pacakges placed under
'ftp://ftp.sistina.com/pub/LVM/0.9/binaries/debian/'.

I put this fixed pacakge under
'http://www.asahi-net.or.jp/~ex8k-hbn/deb/lvm/'.

-- lvm_0.9-2.1 --
  * Fix pv_get_size.		(for md device.)
  * Fix vg_read_from_pv.	(for md device.)
  * Fix pv_read_uuidlist.	(for md device.)
  * Fix install directories.	(from /usr/sbin to /sbin)
  * Set soname to liblvm.so.
  * Add 'liblvm-dev' package.
  * Add some default configuration files.
--             --

This package is working well at my mirroring device.


pear:~# pvdisplay /dev/md1
--- Physical volume ---
PV Name               /dev/md1
VG Name               dev1_vg
PV Size               36.45 GB / NOT usable 2.81 MB [LVM: 157 KB]
PV#                   1
PV Status             available
Allocatable           yes
Cur LV                5
PE Size (KByte)       4096
Total PE              9330
Free PE               3186
Allocated PE          6144
PV UUID               0lnZ0l-ZmHh-jY0S-lT4t-1Ig9-fuGw-BviVvq


pear:~# cat /proc/mdstat 
Personalities : [raid0] [raid1] 
read_ahead 1024 sectors
md1 : active raid1 hdg4[1] hde4[0] 38218560 blocks [2/2] [UU]
md0 : active raid0 hdg3[1] hde3[0] 1027968 blocks 32k chunks
unused devices: <none>
pear:~# mount
/dev/hde1 on / type ext2 (rw,errors=remount-ro,errors=remount-ro)
proc on /proc type proc (rw)
devpts on /dev/pts type devpts (rw,gid=5,mode=620)
/dev/md0 on /tmp type ext2 (rw)
/dev/dev1_vg/var_lv on /var type ext2 (rw)
/dev/dev1_vg/usr_lv on /usr type ext2 (rw)
/dev/dev1_vg/export_lv on /export type ext2 (rw)
/dev/dev1_vg/home_lv on /home type ext2 (rw)
/dev/dev1_vg/local_lv on /usr/local type ext2 (rw)
            .
            .
            .
