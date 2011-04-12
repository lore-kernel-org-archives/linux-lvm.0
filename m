Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p3CGFpZh018407
	for <linux-lvm@redhat.com>; Tue, 12 Apr 2011 12:15:51 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p3CGFmji012662
	for <linux-lvm@redhat.com>; Tue, 12 Apr 2011 12:15:48 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p3CGFjqm008767
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 12 Apr 2011 12:15:45 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p3CGFj5V019775
	for <linux-lvm@redhat.com>; Tue, 12 Apr 2011 12:15:45 -0400
Date: Tue, 12 Apr 2011 12:15:45 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <alpine.DEB.2.00.1104121207130.11425@orwell.homelinux.org>
Message-ID: <alpine.LRH.2.00.1104121214120.19728@bmsred.bmsi.com>
References: <alpine.DEB.2.00.1104121207130.11425@orwell.homelinux.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm devices under /dev/mapper missing
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 12 Apr 2011, Faheem Mitha wrote:

> The symbolic links under /dev/mapper have gone missing. I don't know why. I'm 
> looking for advice on how to diagnose and fix this (if necessary). I believe 
> udev dynamically generates these links, so in the best case scenario nothing 
> needs to be done. But I don't know if there might be other problems I'm not 
> aware of.

You might need "vgchange -ay myvg".

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
