Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0QMXQen000629
	for <linux-lvm@redhat.com>; Mon, 26 Jan 2009 17:33:26 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n0QMWXPF032403
	for <linux-lvm@redhat.com>; Mon, 26 Jan 2009 17:32:33 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id n0QMWVit019916
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 26 Jan 2009 17:32:33 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.13.8) with ESMTP id n0QMWP3C022510
	for <linux-lvm@redhat.com>; Mon, 26 Jan 2009 17:32:25 -0500
Date: Mon, 26 Jan 2009 17:32:25 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Why is part of a PV not usable?
In-Reply-To: <4905EFD192EEDF4A9A19EEE98C32B7F70EC5207D@DBQV3005.na.corp.mckesson.com>
Message-ID: <Pine.LNX.4.64.0901261730260.22460@bmsred.bmsi.com>
References: <4905EFD192EEDF4A9A19EEE98C32B7F70EC5207D@DBQV3005.na.corp.mckesson.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 26 Jan 2009, Allen, Jack wrote:

>         When I do "vgdisplay -v" or pvdisplay to see the PV, why is part
> of the PV not usable? 
> 
>  --- Physical volume --- 
>   PV Name               /dev/sdd1 
>   VG Name               vg01 
>   PV Size               10.00 GB / not usable 3.98 MB 

Because the PV is divided into Physical Extents (PEs) of a fixed size.
Thus, you may waste up to just short of one PE to gain the flexibility
LVM offers.  Your PV is .02 PE short of 2560 PEs.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
