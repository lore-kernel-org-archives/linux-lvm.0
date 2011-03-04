Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p24Dp3jE028486
	for <linux-lvm@redhat.com>; Fri, 4 Mar 2011 08:51:03 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p24DorDQ002524
	for <linux-lvm@redhat.com>; Fri, 4 Mar 2011 08:50:53 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p24DoqhR021840
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 4 Mar 2011 08:50:52 -0500
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p24DonGE020840
	for <linux-lvm@redhat.com>; Fri, 4 Mar 2011 08:50:50 -0500
Date: Fri, 4 Mar 2011 08:50:49 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <1299228115.13997.37.camel@localhost>
Message-ID: <Pine.LNX.4.64.1103040846340.20704@bmsred.bmsi.com>
References: <AANLkTimg-wAqrWxGaj-HSFYazPV-GT7kWKfdYGst9tM3@mail.gmail.com>
	<Pine.LNX.4.64.1103031516340.14941@bmsred.bmsi.com>
	<1299228115.13997.37.camel@localhost>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Resizing underlying LVM partition after cloning to
 bigger disk
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

On Fri, 4 Mar 2011, Radu Rendec wrote:

> > > Or is it risky to resize the underlying LVM partition?
> 
> I wouldn't do that. Instead, I would create a new logical partition,
> "format" it as lvm physical volume and then extend the volume group to
> use this partition as well.
> 
> I think this can be safely done like this:
> 
> * turn off lvm;
> * note down the exact starting and ending *sector* of partition 5 (using
> fdisk -lu)
> * use fdisk and delete partition 5 and 2, then re-create partition 2 up
> to the full disk size
> * re-create partition 5 making sure it's on exactly the same starting
> and ending sector as it was before
> * create new partition 6

If you are going to do all that risky "remember the sector" stuff anyway, then
just resize the partition.  "pvresize" works perfectly well for the PV.

You should always use pvresize when convenient.  LVM is not smart enough
to know when PVs are actually on the same spindle.  (Could be done
with enhancements to the metadata.)  So it will happily stripe,
put mirror legs, etc, between the apparently separate PVs.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
