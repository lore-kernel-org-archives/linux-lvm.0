Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o68JDnEf005748
	for <linux-lvm@redhat.com>; Thu, 8 Jul 2010 15:13:50 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o68JDdVe003300
	for <linux-lvm@redhat.com>; Thu, 8 Jul 2010 15:13:40 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o68JDd0O019345
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 8 Jul 2010 15:13:39 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o68JDdvr010212
	for <linux-lvm@redhat.com>; Thu, 8 Jul 2010 15:13:39 -0400
Date: Thu, 8 Jul 2010 15:13:39 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <Pine.LNX.4.64.1007081459130.10077@bmsred.bmsi.com>
Message-ID: <Pine.LNX.4.64.1007081510460.10077@bmsred.bmsi.com>
References: <AANLkTinHO7upxegO7jMqa4OtWQ8i-4EOB7rb25G_tmuc@mail.gmail.com>
	<AANLkTikCxnSq4nyGf8V_uC5AqejaFwr7DgJuCcA4wY62@mail.gmail.com>
	<AANLkTilASQnpv7d0oB5NELpMQ7yzfWYIFjeooVtX8WPv@mail.gmail.com>
	<Pine.LNX.4.64.1007051420360.11654@bmsred.bmsi.com>
	<20100706161745.GB31734@us.ibm.com>
	<AANLkTinATF8nv02K4F0SQiR1OGg0rZ3P5lpsITcB-RYb@mail.gmail.com>
	<Pine.LNX.4.64.1007081459130.10077@bmsred.bmsi.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Rebuilding ext4 filesystem on an LV
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

On Thu, 8 Jul 2010, Stuart D. Gathman wrote:

> Method 2:
> With both new and failed drive connected, use dd_rescue or equivalent to
> copy (most/some of) the failed drive to the new drive.  Remove failed
> drive and bring up VG.  If UUID was not readable on failed drive, use
> pvcreate to restore it on new drive.

I should mention that an external case-free USB adapter is the best way
to attempt recovery of failed drives.  You can even run the IDE/SATA/Power
cable to a box in the freezer (and the USB adapter can sit on top of the
freezer and a long USB cable go to your computer) - which often helps recover
data from failing drives.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
