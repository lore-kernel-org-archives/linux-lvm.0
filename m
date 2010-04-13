Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3DJ8c8I012114
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2010 15:08:38 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3DJ8QID028739
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2010 15:08:26 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o3DJ8P4G006753
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2010 15:08:25 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o3DJ8PoD004588
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2010 15:08:25 -0400
Date: Tue, 13 Apr 2010 15:08:24 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <OF6877E65C.1B864A37-ON48257704.0036E072-48257704.003741D9@db.com>
Message-ID: <Pine.LNX.4.64.1004131507430.4562@bmsred.bmsi.com>
References: <OF6877E65C.1B864A37-ON48257704.0036E072-48257704.003741D9@db.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How do I properly backup and restore / on LVM2
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

On Tue, 13 Apr 2010, Alan Pek wrote:

> Read through the doc and tried to create a snapshot lv for rootlv by 
> doing, but failed. 
> 
> singmrecfp1001:~ # lvcreate -L 2.5g -s -n rsnap rootvg
>   Path required for Logical Volume "rootvg"
>   The origin name should include the volume group.

You forgot the LV name.  E.g.

singmrecfp1001:~ # lvcreate -L 2.5g -s -n rsnap rootvg/myroot

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
