Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id lACN0QPL000379
	for <linux-lvm@redhat.com>; Mon, 12 Nov 2007 18:00:26 -0500
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1IriGY-000837-Dm
	for linux-lvm@redhat.com; Mon, 12 Nov 2007 23:00:26 +0000
Date: Mon, 12 Nov 2007 23:00:26 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Beginner Questions
Message-ID: <20071112230026.GW22843@agk.fab.redhat.com>
References: <1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88A@an-ex.ActiveNetwerx.int>
	<20071112215854.GU22843@agk.fab.redhat.com>
	<1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88C@an-ex.ActiveNetwerx.int>
	<20071112223338.GV22843@agk.fab.redhat.com>
	<1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88D@an-ex.ActiveNetwerx.int>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1C8CF1EA1A5B5940B81B0710B2A4C93823D19EC88D@an-ex.ActiveNetwerx.int>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Nov 12, 2007 at 03:48:27PM -0700, Joseph L. Casale wrote:
>   /dev/sdb1  iSCSI_dvr  lvm2 a-   744.99G 744.99G 745.00G yQyVCe-tiS4-Ma1E-hilJ-niuG-KXL9-jkKVIk
>   /dev/sdc1  iSCSI_dvr  lvm2 a-     1.36T   1.36T   1.36T PURHhY-Lo1T-5bif-HjGP-dP3o-NVTs-71ZKUm
> Disk /dev/sdc: 1499.9 GB, 1499998453760 bytes

This is what I see for a similar volume:

# pvs -v --units H
1.50T

# pvs -v --units h
1.36T

# pvs -v --units G
1500.00G

man page:

       --units hsbkmgtHKMGT
              All   sizes   are   output  in  these  units:  (h)uman-readable,
              (s)ectors,  (b)ytes,  (k)ilobytes,   (m)egabytes,   (g)igabytes,
              (t)erabytes.  Capitalise to use multiples of 1000 (S.I.) instead
              of 1024.  Can also specify custom (u)nits e.g.  --units 3M

Alasdair
-- 
agk@redhat.com
