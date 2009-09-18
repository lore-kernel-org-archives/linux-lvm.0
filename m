Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8ILVU6S019593
	for <linux-lvm@redhat.com>; Fri, 18 Sep 2009 17:31:30 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8ILVKBf017731
	for <linux-lvm@redhat.com>; Fri, 18 Sep 2009 17:31:20 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id n8ILVJfI019501
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 18 Sep 2009 17:31:19 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id n8ILVJAf016196
	for <linux-lvm@redhat.com>; Fri, 18 Sep 2009 17:31:19 -0400
Date: Fri, 18 Sep 2009 17:31:19 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Disk crash on LVM
In-Reply-To: <1253308756.16684.7@raydesk1.bettercgi.com>
Message-ID: <Pine.LNX.4.64.0909181727570.16138@bmsred.bmsi.com>
References: <1253308756.16684.7@raydesk1.bettercgi.com>
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

On Fri, 18 Sep 2009, Ray Morris wrote:

>    pvmove is very slow and very safe.  You want 
> to get the data off that drive in a hurry, before 
> it heats up, so pvmove is not your friend in this 
> case.  Freeze the drive, then find out which LVs 
> are on it:

I've found that external data/power cables that let you connect
an unmounted drive sitting on your workbench are your friend
in these cases.  You can even keep the drive in the freezer
(just make sure it is dry enough to be non-condensing).  
Stay-Dri hospital ice bags also work well.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
