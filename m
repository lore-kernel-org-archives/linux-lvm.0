Message-ID: <534BBAD7.1090601@redhat.com>
Date: Mon, 14 Apr 2014 12:39:19 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <1226124282.727919626.1397469094153.JavaMail.root@zimbra39-e7.priv.proxad.net>
In-Reply-To: <1226124282.727919626.1397469094153.JavaMail.root@zimbra39-e7.priv.proxad.net>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm]
 =?utf-8?q?Re=C2=A0=3A_Re=3A__GRUB_boot_problem_with_l?=
 =?utf-8?q?vm_mirror_type_raid1?=
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: georges.giralt@free.fr
Cc: phcoder@gmail.com, LVM general discussion and development <linux-lvm@redhat.com>

On 04/14/2014 11:51 AM, georges.giralt@free.fr wrote:
> -- 
> Peter
> Hello !
> May I chime in on this ? 
> If the raid1 is made OUTSIDE lvm (ie soft raid1 giving /dev/md0 as a PV for LVM) will the Grub be apt to find it and boot ? 
> Or is it the same case as above ? 
> Thanks.

Grub should support MD RAID 0/1/4/5/6 and 10.

Though there's the same question about its limitations and
whether it's not similar to LVM support where we know that
an update in metadata format (e.g. adding new items or changing
the order of metadata items) can cause grub to not recognize
the volume anymore (since grub expects the metadata to be in
predefined and static form that doesn't change its layout in
future). There may be missing sanity checks too, like CRC checking
in case of LVM etc.

I'm not sure about LVM on MD at the moment. It depends on whether
grub supports device stacking. If grub supports iterative device/metadata
recognition, then yes, it's possible. (CC-ing phcoder to confirm)

-- 
Peter
