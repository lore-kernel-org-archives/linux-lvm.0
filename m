Received: from [10.15.80.209] (dhcp80-209.msp.redhat.com [10.15.80.209])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id j72DpF2Y012008
	for <linux-lvm@redhat.com>; Tue, 2 Aug 2005 09:51:16 -0400
Mime-Version: 1.0 (Apple Message framework v622)
In-Reply-To: <42EF3574.2020301@me.chalmers.se>
References: <42EF3574.2020301@me.chalmers.se>
Message-Id: <b376ff5acad45b22ef5642c3a406a190@redhat.com>
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] Broken disk, any chances ?
Date: Tue, 2 Aug 2005 08:52:14 -0500
Content-Transfer-Encoding: quoted-printable
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

You could write a for loop and use dm to try mounting the disk.

i=3D0; while true; do
   i=3D$(($i + 1))
   size=3D$((<disk_size> - $i))
   echo "0 $size linear /dev/<disk> $i" | dmsetup create recover
   mount -t ext3 /dev/mapper/recover /mnt
   if [ $? -eq 0 ] ; then echo "FS found at offset $i"; break; fi
done

Remember to record the offset once found and start from there plus 1=20
next time... hopefully finding the next FS on the disk.  I'm not sure=20
if this setup would get confused by the multiple super blocks that ext=20
writes out or not.  Couldn't hurt to try.

  brassow

On Aug 2, 2005, at 3:57 AM, Thomas Svedberg wrote:

> So I have a broken disk (with root on LVM) and lost the block(s)=20
> containing the LVM partition info. I have moved the entire disk to a=20
> backup (dd_rescue) but can not find the LVM partition with any tools I=20
> tried (gpart, testdisk). Am I f.cked or can I still get some data of=20
> these lost partitions (3 ext2/3 partitions on that LVM VG) ?
>
> --=20
> / Thomas
> .......................................................................
>  Thomas Svedberg
>  Department of Applied Mechanics
>  Chalmers University of Technology
>
>  Address: SE-412 96 G=EF=BF=BDteborg, SWEDEN
>  E-mail : Thomas.Svedberg@me.chalmers.se
> .......................................................................
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
