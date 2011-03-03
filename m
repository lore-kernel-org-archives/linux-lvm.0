Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p23KICQH030519
	for <linux-lvm@redhat.com>; Thu, 3 Mar 2011 15:18:12 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p23KI2QE017086
	for <linux-lvm@redhat.com>; Thu, 3 Mar 2011 15:18:02 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p23KI1qB004406
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 3 Mar 2011 15:18:01 -0500
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p23KI1TK014980
	for <linux-lvm@redhat.com>; Thu, 3 Mar 2011 15:18:01 -0500
Date: Thu, 3 Mar 2011 15:18:01 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <AANLkTimg-wAqrWxGaj-HSFYazPV-GT7kWKfdYGst9tM3@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1103031516340.14941@bmsred.bmsi.com>
References: <AANLkTimg-wAqrWxGaj-HSFYazPV-GT7kWKfdYGst9tM3@mail.gmail.com>
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

On Thu, 3 Mar 2011, Scott Arthur wrote:

> Partition Table: msdos
> 
> Number  Start   End     Size    Type      File system  Flags
>  1      32.3kB  296MB   296MB   primary   ext4         boot
>  2      296MB   1000GB  1000GB  extended
>  5      296MB   1000GB  1000GB  logical                lvm
> 
> I'm obviously wanting to expand the LVM partition to fill the remaining 1TB
> of space.
> 
> Am I able to simply use parted to resize the partition before doing a
> pvresize etc?
> 
> Or is it risky to resize the underlying LVM partition?

You are getting to a size where msdos partition tables are risky.
Don't they crap out at 2TB?

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
