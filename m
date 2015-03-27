Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2RDSt1v013876
	for <linux-lvm@redhat.com>; Fri, 27 Mar 2015 09:28:57 -0400
Received: from mx3.lixium.fr (mx2.lixium.fr [79.98.96.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2RDSohm023812
	for <linux-lvm@redhat.com>; Fri, 27 Mar 2015 09:28:52 -0400
Message-ID: <55155B5A.8060003@lixium.fr>
Date: Fri, 27 Mar 2015 14:30:02 +0100
From: Christophe <c.baegert-listes@lixium.fr>
MIME-Version: 1.0
References: <55153867.80501@lixium.fr>	<zarafa.551542c1.3c12.285b727e66d54380@zarafa.deriva.de>
	<55154ECD.1070707@lixium.fr>
In-Reply-To: <55154ECD.1070707@lixium.fr>
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
To: linux-lvm@redhat.com, cs@deriva.de

Hi again,

i still now have a last LV saying "can't read superblock"
lvs says :
  "nfspostgres     miroir2    -wi-d--- 500,00g"

which means 'device present without tables'

and lvdisplay :
   --- Logical volume ---
   LV Path                /dev/miroir2/nfspostgres
   LV Name                nfspostgres
   VG Name                miroir2
   LV UUID                wPB72R-ZGLS-x1ww-0lgT-D6bz-ZA6S-h6PrOe
   LV Write Access        read/write
   LV Creation host, time host6filer2, 2014-06-02 00:40:01 +0200
   LV Status              available
   # open                 0
   LV Size                500,00 GiB
   Current LE             128000
   Segments               1
   Allocation             inherit
   Read ahead sectors     auto
   - currently set to     256
   Block device           253:35


I restored the LVM table of yesterday which included already this LV, 
and all the other LVs came back without problem.

With ext4, I could search for another superblock, I didn't find the 
command for xfs, maybe it exists ?

Any idea ?

Regards,

-- 
Christophe
