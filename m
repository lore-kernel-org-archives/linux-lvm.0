Received: from [10.13.215.89] (unused [10.13.215.89] (may be forged))
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2UDXda0001088
	for <linux-lvm@redhat.com>; Mon, 30 Mar 2015 09:33:39 -0400
Message-ID: <551950B3.6040108@redhat.com>
Date: Mon, 30 Mar 2015 09:33:39 -0400
From: Jack Waterworth <jack@redhat.com>
MIME-Version: 1.0
References: <55153867.80501@lixium.fr>	<zarafa.551542c1.3c12.285b727e66d54380@zarafa.deriva.de>	<55154ECD.1070707@lixium.fr>
	<55155B5A.8060003@lixium.fr>
In-Reply-To: <55155B5A.8060003@lixium.fr>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM crashed,
 no superblock on dozens of LVs even after vgcfgrestore
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Does the device actually exist here? I usually see these types of errors 
when there is something wrong with the PV. More information should be 
available via dmesg during activation.

     # lvchange -ay vgname/lvname
     # dmesg

As for the xfs file-system, i'd recommend reaching out to the xfs 
community if you believe your lvm stack is intact.  Even if it's not, 
they may be able to provide some insight.

   Jack Waterworth, Red Hat Certified Architect
   OpenStack Technical Support North America
   Red Hat Global Support Services ( 1.888.467.3342 )

On 03/27/2015 09:30 AM, Christophe wrote:
> Hi again,
>
> i still now have a last LV saying "can't read superblock"
> lvs says :
>  "nfspostgres     miroir2    -wi-d--- 500,00g"
>
> which means 'device present without tables'
>
> and lvdisplay :
>   --- Logical volume ---
>   LV Path                /dev/miroir2/nfspostgres
>   LV Name                nfspostgres
>   VG Name                miroir2
>   LV UUID                wPB72R-ZGLS-x1ww-0lgT-D6bz-ZA6S-h6PrOe
>   LV Write Access        read/write
>   LV Creation host, time host6filer2, 2014-06-02 00:40:01 +0200
>   LV Status              available
>   # open                 0
>   LV Size                500,00 GiB
>   Current LE             128000
>   Segments               1
>   Allocation             inherit
>   Read ahead sectors     auto
>   - currently set to     256
>   Block device           253:35
>
>
> I restored the LVM table of yesterday which included already this LV, 
> and all the other LVs came back without problem.
>
> With ext4, I could search for another superblock, I didn't find the 
> command for xfs, maybe it exists ?
>
> Any idea ?
>
> Regards,
>
