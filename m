Received: from mx2.redhat.com (ext-mx01.rdu.redhat.com [10.11.45.6])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o66GJS1e024451
	for <linux-lvm@redhat.com>; Tue, 6 Jul 2010 12:19:28 -0400
Received: from e2.ny.us.ibm.com (e2.ny.us.ibm.com [32.97.182.142])
	by mx2.redhat.com (8.13.8/8.13.8) with ESMTP id o66GJJJN003576
	for <linux-lvm@redhat.com>; Tue, 6 Jul 2010 12:19:19 -0400
Received: from d01relay01.pok.ibm.com (d01relay01.pok.ibm.com [9.56.227.233])
	by e2.ny.us.ibm.com (8.14.4/8.13.1) with ESMTP id o66G68qq013262
	for <linux-lvm@redhat.com>; Tue, 6 Jul 2010 12:06:08 -0400
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay01.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	o66GJIqA113110
	for <linux-lvm@redhat.com>; Tue, 6 Jul 2010 12:19:18 -0400
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	o66GJHDW031349
	for <linux-lvm@redhat.com>; Tue, 6 Jul 2010 13:19:17 -0300
Received: from malahal (malahal.beaverton.ibm.com [9.47.17.130])
	by d01av03.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	o66GJHit031307
	for <linux-lvm@redhat.com>; Tue, 6 Jul 2010 13:19:17 -0300
Date: Tue, 6 Jul 2010 09:17:45 -0700
From: Malahal Naineni <malahal@us.ibm.com>
Message-ID: <20100706161745.GB31734@us.ibm.com>
References: <AANLkTinHO7upxegO7jMqa4OtWQ8i-4EOB7rb25G_tmuc@mail.gmail.com>
	<AANLkTikCxnSq4nyGf8V_uC5AqejaFwr7DgJuCcA4wY62@mail.gmail.com>
	<AANLkTilASQnpv7d0oB5NELpMQ7yzfWYIFjeooVtX8WPv@mail.gmail.com>
	<Pine.LNX.4.64.1007051420360.11654@bmsred.bmsi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.1007051420360.11654@bmsred.bmsi.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Stuart D. Gathman [stuart@bmsi.com] wrote:
> On Mon, 5 Jul 2010, Ken Bass wrote:
> 
> > But what bothers me is this message I get when I run e2fsck (which runs
> > fsck.ext4):
> > "e2fsck: Invalid argument while trying to open
> > /dev/mapper/VolGroupX-LogVolX"
> > 
> > Why am I getting that?
> 
> Not an expert, just a user, but I suspect that the ioerr is because
> the metadata for that LV is still pointing to the missing PV.  (I know
> you replaced it, but that doesn't update the LV.)

If everything went right, he should have the new PV in the LV, but looks
like something failed while activating the LV. Run 'dmsetup table' to
find out if the LV currently has new PV or old PV. You need
device-mapper knowledge for this.

> I suspect recovering the remaining data will require skipping the (huge)
> chuck of LV that was on the missing PV.  Or maybe the experts here
> will recommend editing the metadata to move the extent from the missing
> PV to the new PV.  The huge chunk will now have random data from the 
> new drive.  I would have initialized the new drive to zero (using the
> security erase) before using (maybe you did).

The best course of action would have been 'reading what ever data
available' from old disk to new disk. If the disk is absolutely
thrashed, then zero'ing the new PV may be better.
