Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o2KN3ABZ021833
	for <linux-lvm@redhat.com>; Sat, 20 Mar 2010 19:03:10 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o2KN2vcx001725
	for <linux-lvm@redhat.com>; Sat, 20 Mar 2010 19:02:58 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o2KN2vYS001144
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sat, 20 Mar 2010 19:02:57 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o2KN2uBZ024927
	for <linux-lvm@redhat.com>; Sat, 20 Mar 2010 19:02:57 -0400
Date: Sat, 20 Mar 2010 19:02:56 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4BA3BEBE.2010204@cfl.rr.com>
Message-ID: <Pine.LNX.4.64.1003201838080.24834@bmsred.bmsi.com>
References: <4BA3BEBE.2010204@cfl.rr.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Data alignment
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, 19 Mar 2010, Phillip Susi wrote:

> I have been trying to get my logical volume to be aligned to a 512 KB
> boundary on my SSD so it lines up with the flash erase block.  I thought
> I could do this with pvcreate --dataalign 1024, but this caused the data
> to be aligned to a 1024 sector boundary within the partition, which
> itself starts on sector 63.  I then thought the --dataalignoffsest
> switch would help, but specifying 63 there caused the data to be moved
> to sector 1087.  I tried giving it -63, but was told that a negative
> number is not allowed.  Why not?  How can I get the data to start on
> sector 1024-63 of the partition so it ends up on pysical sector 1024 of
> the disk?

You can have "negative" offsets.  Just subtract from the modulus.  In your
case that would be 1024-63.  I.e. --dataalignoffset 961

If the PV is not removeable, you can skip the partition table and use the
entire device for the PV - leaving 63 more sectors for metadata.

If the PV is removeable, remember you need vgchange -ay vgname after 
attaching, and vgchange -an vgname before removing.  (I would suggest
leaving the partition table if removeable so that other systems will
recognize the partition label.)

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
