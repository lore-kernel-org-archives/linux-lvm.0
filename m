Message-ID: <3560BA143F45D5118E670000E82459214C23AD@ssk.schneiderkenzingen.de>
From: "Koch, Steffen" <steffen.koch@sphinx-electronics.de>
Subject: RE: [linux-lvm] half my space lost
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
Date: Fri Dec  5 08:10:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Hello,

> [root@fw root]# vgcreate secured /dev/md/7
> vgcreate -- INFO: using default physical extent size 32 MB 
> vgcreate -- INFO: maximum logical volume size is 2 Terabyte 
> vgcreate -- doing automatic backup of volume group "secured" 
> vgcreate -- volume group "secured" successfully created and activated
As it is stated here an extent is 32 MB, and one extent is always lost at
the beginning of the md (partition, disk, etc.) for metadata information.
This should leave you with 125 MB - 32 MB = 93 MB.
LVM volumes have to be a multiple of the extent size. So 32MB, 64 MB, 96 MB.
As you can see your remaining space is 3 MB too little for a 3 extent
volume, leaving you with a 2 extent volume with 2 * 32 MB = 64 MB

> The size of the partition get shrink by half:
> 
> [root@fw root]# pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- ACTIVE   PV "/dev/md/7"                             
>   of VG "secured"
> [64 MB / 64 MB free]
> pvscan -- inactive PV "/dev/md/8"                             
>   is in no VG
> [125.38 MB]
> pvscan -- ACTIVE   PV 
> "/dev/ide/host0/bus1/target0/lun0/part13" of VG "lvm1"
> [17 GB / 16.97 GB fr
> pvscan -- total: 3 [17.28 GB] / in use: 2 [17.16 GB] / in no 
> VG: 1 [125.38 MB]
> 
> Is this a known/solved problem?
> Did I made a mistake?
> 
> Thanks in advance for your help.
> Regards.

Hope the explanation helped.
