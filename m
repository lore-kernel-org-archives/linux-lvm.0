From: "=?iso-8859-1?Q?Ronan=2DYann?= Lorin" <ronan@les-lorin.homeip.net>
Subject: RE: [linux-lvm] half my space lost
Message-ID: <20031205.iuZ.33981400@gw.les-lorin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
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
Date: Fri Dec  5 08:26:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Thank you for this explanation which sounds very clear.

One more question please. I do not understand why I can not extend my VG with the
second RAID partition:
[root@fw root]# pvdisplay /dev/md/8
pvdisplay -- "/dev/md/8" is a new physical volume of 125.38 MB

[root@fw root]# vgextend secured /dev/md/8
vgextend -- INFO: maximum logical volume size is 2 Terabyte
vgextend -- ERROR: physical volume "/dev/md/8" too small for physical extent siz
e of volume group "secured"

Thanks in advance.

Koch, Steffen (steffen.koch@sphinx-electronics.de) wrote*:
>
>Hello,
>
>> [root@fw root]# vgcreate secured /dev/md/7
>> vgcreate -- INFO: using default physical extent size 32 MB
>> vgcreate -- INFO: maximum logical volume size is 2 Terabyte
>> vgcreate -- doing automatic backup of volume group "secured"
>> vgcreate -- volume group "secured" successfully created and activated
>As it is stated here an extent is 32 MB, and one extent is always lost at
>the beginning of the md (partition, disk, etc.) for metadata information.
>This should leave you with 125 MB - 32 MB = 93 MB.
>LVM volumes have to be a multiple of the extent size. So 32MB, 64 MB, 96 MB.
>As you can see your remaining space is 3 MB too little for a 3 extent
>volume, leaving you with a 2 extent volume with 2 * 32 MB = 64 MB
>
>> The size of the partition get shrink by half:
>>
>> [root@fw root]# pvscan
>> pvscan -- reading all physical volumes (this may take a while...)
>> pvscan -- ACTIVE   PV "/dev/md/7"
>>   of VG "secured"
>> [64 MB / 64 MB free]
>> pvscan -- inactive PV "/dev/md/8"
>>   is in no VG
>> [125.38 MB]
>> pvscan -- ACTIVE   PV
>> "/dev/ide/host0/bus1/target0/lun0/part13" of VG "lvm1"
>> [17 GB / 16.97 GB fr
>> pvscan -- total: 3 [17.28 GB] / in use: 2 [17.16 GB] / in no
>> VG: 1 [125.38 MB]
>>
>> Is this a known/solved problem?
>> Did I made a mistake?
>>
>> Thanks in advance for your help.
>> Regards.
>
>Hope the explanation helped.
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>

--
R.Y. Lorin
mailto:ryl@free.fr
http://les-lorin.webhop.net/
