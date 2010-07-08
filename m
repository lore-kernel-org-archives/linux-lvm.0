Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o68J6GW8012332
	for <linux-lvm@redhat.com>; Thu, 8 Jul 2010 15:06:16 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o68J64Yp015546
	for <linux-lvm@redhat.com>; Thu, 8 Jul 2010 15:06:05 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o68J64Sm018881
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 8 Jul 2010 15:06:04 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o68J63fw010157
	for <linux-lvm@redhat.com>; Thu, 8 Jul 2010 15:06:03 -0400
Date: Thu, 8 Jul 2010 15:06:03 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <AANLkTinATF8nv02K4F0SQiR1OGg0rZ3P5lpsITcB-RYb@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1007081459130.10077@bmsred.bmsi.com>
References: <AANLkTinHO7upxegO7jMqa4OtWQ8i-4EOB7rb25G_tmuc@mail.gmail.com>
	<AANLkTikCxnSq4nyGf8V_uC5AqejaFwr7DgJuCcA4wY62@mail.gmail.com>
	<AANLkTilASQnpv7d0oB5NELpMQ7yzfWYIFjeooVtX8WPv@mail.gmail.com>
	<Pine.LNX.4.64.1007051420360.11654@bmsred.bmsi.com>
	<20100706161745.GB31734@us.ibm.com>
	<AANLkTinATF8nv02K4F0SQiR1OGg0rZ3P5lpsITcB-RYb@mail.gmail.com>
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

On Wed, 7 Jul 2010, Ken Bass wrote:

> > The best course of action would have been 'reading what ever data
> > available' from old disk to new disk. If the disk is absolutely
> > thrashed, then zero'ing the new PV may be better.
> >
> >
> I did try to read anything I could out of the old disk. I do believe there
> is still some data on it that wasn't trashed. The problem is how to find it
> and reconstruct it without any of the LVM or ext4 filesystem  information
> (as I said, I couldn't find any superblocks). Are there any utilities to do
> something like that?

Method 1:
If you can, have *all* the drives connected, the failed drive, and the new
drive.  Restore LVM metadata to include the failed drive again.  Now add the
new drive and use pvmove to migrate data that can be read to the new
drive.  (I've never used pvmove for this purpose - does it handle IO
errors and continue?)

Method 2:
With both new and failed drive connected, use dd_rescue or equivalent to
copy (most/some of) the failed drive to the new drive.  Remove failed
drive and bring up VG.  If UUID was not readable on failed drive, use
pvcreate to restore it on new drive.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
