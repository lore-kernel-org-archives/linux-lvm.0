Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p24Lw67c024719
	for <linux-lvm@redhat.com>; Fri, 4 Mar 2011 16:58:06 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p24LvvQT031152
	for <linux-lvm@redhat.com>; Fri, 4 Mar 2011 16:57:57 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p24Lvv8C001264
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 4 Mar 2011 16:57:57 -0500
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p24Lvuqb026046
	for <linux-lvm@redhat.com>; Fri, 4 Mar 2011 16:57:56 -0500
Date: Fri, 4 Mar 2011 16:57:56 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <E9488659-0B3D-4B06-9AB8-49C0359B272A@scottatron.com>
Message-ID: <Pine.LNX.4.64.1103041651110.25909@bmsred.bmsi.com>
References: <AANLkTimg-wAqrWxGaj-HSFYazPV-GT7kWKfdYGst9tM3@mail.gmail.com>
	<Pine.LNX.4.64.1103031516340.14941@bmsred.bmsi.com>
	<OFA451250E.47639620-ON80257849.0038129E-80257849.0038324B@cardiff.ac.uk>
	<E9488659-0B3D-4B06-9AB8-49C0359B272A@scottatron.com>
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

On Sat, 5 Mar 2011, Scott Arthur wrote:

> I did consider that as an easier option.
> 
> Based on what is said here:
> http://tldp.org/HOWTO/LVM-HOWTO/multpartitions.html if I don't have striped
> logical volumes and there's only one physical drive, can I expect any
> performance issues?

With no striping or mirroring, there is no performance issue.
Even with striping or mirroring, you can manually designate which
PVs to use and maintain optimal performance.  At some point, there
should be some metadata for PVs (if there isn't already) to mark them
as belonging to the same physical drive.  

It would also be useful to mark PVs that reside on "0 seek time" media
like solid state drives.  (Which have limited bandwidth, so you still
don't want to stripe or mirror on the same physical drive.)  There is
less need to defragment a PV with 0 seek time, and it would be more
optimal for snapshot COW LVs to be on zero seek PVs (since the COW
blocks are mapped in essentially random order).

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
