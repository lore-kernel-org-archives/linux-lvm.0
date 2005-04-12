Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3CEpTO22985
	for <linux-lvm@redhat.com>; Tue, 12 Apr 2005 10:51:29 -0400
Received: from vscan4.vignette.com (vscan4.vignette.com [12.161.72.105])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j3CEpS71030629
	for <linux-lvm@redhat.com>; Tue, 12 Apr 2005 10:51:29 -0400
Received: from [10.18.201.1] (digdug.vignette.com [10.18.201.1])
	by omail1.vignette.com (8.12.9/8.11.2) with ESMTP id j3CEpK8u024731
	for <linux-lvm@redhat.com>; Tue, 12 Apr 2005 09:51:20 -0500 (CDT)
Message-ID: <425BE068.6050106@cjs226.com>
Date: Tue, 12 Apr 2005 09:51:20 -0500
From: Clif Smith <redhat@cjs226.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] invalid physical volume
References: <425B37D8.7060801@cjs226.com> <20050412082844.M43465@pk25.com>
In-Reply-To: <20050412082844.M43465@pk25.com>
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

Responses in line.

Thanks, Clif

Diaz Rodriguez, Eduardo wrote:

>Clif try to make a partition type linux lvm.. (8e) and after try pvcreate =
over it
> =20
>
# fdisk -l /dev/emcpowera
Disk /dev/emcpowera: 10.7 GB, 10737418240 bytes
255 heads, 63 sectors/track, 1305 cylinders
Units =3D cylinders of 16065 * 512 =3D 8225280 bytes
         Device Boot    Start       End    Blocks   Id  System
/dev/emcpowera1             1      1305  10482381   8e  Linux LVM

# pvcreate /dev/emcpowera
pvcreate -- invalid physical volume "/dev/emcpowera"

>send a output of pvcreate -v /dev/emcpowera
> =20
>
# pvcreate -v /dev/emcpowera
pvcreate -- locking logical volume manager
pvcreate -- checking physical volume name "/dev/emcpowera"
pvcreate -- getting physical volume size
pvcreate -- checking maximum physical volume size
pvcreate -- checking partition type
pvcreate -- invalid physical volume "/dev/emcpowera"

>if you complile with debug use pvcreate -dv /dev/emcpowera
>
> =20
>
# pvcreate -dv /dev/emcpowera
<1> lvm_get_iop_version -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_get_iop_version -- AFTER ioctl ret: 0
<1> lvm_get_iop_version -- LEAVING with ret: 10
pvcreate -- locking logical volume manager
<1> lvm_lock -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_lock -- LEAVING with ret: 0
pvcreate -- checking physical volume name "/dev/emcpowera"
<1> pv_check_name -- CALLED with "/dev/emcpowera"
<22> lvm_check_chars -- CALLED with name: "/dev/emcpowera"
<22> lvm_check_chars -- LEAVING with ret: 0
<1> pv_check_name -- LEAVING with ret: 0
pvcreate -- getting physical volume size
<1> _pv_get_dev_size -- CALLED with /dev/emcpowera and 0xbfffa650
<1> _pv_get_dev_size -- LEAVING with ret: 20971520
pvcreate -- checking maximum physical volume size
<1> pv_create_kdev_t -- CALLED with "/dev/emcpowera"
<22> pv_check_name -- CALLED with "/dev/emcpowera"
<333> lvm_check_chars -- CALLED with name: "/dev/emcpowera"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> pv_check_name -- LEAVING with ret: 0
<1> pv_create_kdev_t -- LEAVING with ret: E800
<1> lvm_check_partitioned_dev -- CALLED
<22> lvm_get_device_type called
<22> lvm_get_device_type leaving with -1
<1> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
pvcreate -- checking partition type
<1> pv_read -- CALLED with /dev/emcpowera
<22> pv_check_name -- CALLED with "/dev/emcpowera"
<333> lvm_check_chars -- CALLED with name: "/dev/emcpowera"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> pv_check_name -- LEAVING with ret: 0
<1> pv_read -- going to read /dev/emcpowera
<22> lvm_check_dev -- CALLED
<333> lvm_check_partitioned_dev -- CALLED
<4444> lvm_get_device_type called
<4444> lvm_get_device_type leaving with -1
<333> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<22> lvm_check_dev -- LEAVING with ret: 0
<1> pv_read -- LEAVING with ret: -270
pvcreate -- invalid physical volume "/dev/emcpowera"

<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: 0

>send the error leve returns echo $?
>
>regards!
>
>
>
>On Mon, 11 Apr 2005 21:52:08 -0500, Clif Smith wrote
> =20
>
>>I'm running lvm-1.0.8-9 on RHES3 and am receiving the following when=20
>>I try to utilize a volume from an EMC array:
>># pvcreate /dev/emcpowera
>>pvcreate -- invalid physical volume "/dev/emcpowera"
>>
>>The OS sees the volume fine:
>># fdisk -l /dev/emcpowera
>>Disk /dev/emcpowera: 10.7 GB, 10737418240 bytes
>>255 heads, 63 sectors/track, 1305 cylinders
>>Units =3D cylinders of 16065 * 512 =3D 8225280 bytes
>>
>>I can create a partition and then a filesystem without issue, but I=20
>>really need to use it within LVM.
>>
>>Any ideas?
>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@redhat.com
>>https://www.redhat.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>   =20
>>
>
>
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>La teta que la mano no cubre, no es teta sino ubre.
>		-- An=EF=BF=BDnim.=20
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> =20
>
