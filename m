Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o65IS26H024048
	for <linux-lvm@redhat.com>; Mon, 5 Jul 2010 14:28:02 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o65IRqFA010649
	for <linux-lvm@redhat.com>; Mon, 5 Jul 2010 14:27:52 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o65IRp6D018352
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 5 Jul 2010 14:27:51 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o65IRp8D011721
	for <linux-lvm@redhat.com>; Mon, 5 Jul 2010 14:27:51 -0400
Date: Mon, 5 Jul 2010 14:27:51 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <AANLkTilASQnpv7d0oB5NELpMQ7yzfWYIFjeooVtX8WPv@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1007051420360.11654@bmsred.bmsi.com>
References: <AANLkTinHO7upxegO7jMqa4OtWQ8i-4EOB7rb25G_tmuc@mail.gmail.com>
	<AANLkTikCxnSq4nyGf8V_uC5AqejaFwr7DgJuCcA4wY62@mail.gmail.com>
	<AANLkTilASQnpv7d0oB5NELpMQ7yzfWYIFjeooVtX8WPv@mail.gmail.com>
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

On Mon, 5 Jul 2010, Ken Bass wrote:

> But what bothers me is this message I get when I run e2fsck (which runs
> fsck.ext4):
> "e2fsck: Invalid argument while trying to open
> /dev/mapper/VolGroupX-LogVolX"
> 
> Why am I getting that?

Not an expert, just a user, but I suspect that the ioerr is because the
metadata for that LV is still pointing to the missing PV.  (I know you replaced
it, but that doesn't update the LV.)  I also noticed that the lvdisplay
you posted says LogVolX belongs to VolGroupW, not VolGroupX.  Perhaps you
sanitized the names and that is a typo - otherwise, there is something screwy.

I suspect recovering the remaining data will require skipping the (huge)
chuck of LV that was on the missing PV.  Or maybe the experts here
will recommend editing the metadata to move the extent from the missing
PV to the new PV.  The huge chunk will now have random data from the 
new drive.  I would have initialized the new drive to zero (using the
security erase) before using (maybe you did).

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
