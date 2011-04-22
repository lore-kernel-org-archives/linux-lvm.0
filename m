Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p3MGcUpY002463
	for <linux-lvm@redhat.com>; Fri, 22 Apr 2011 12:38:30 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p3MGcTYO001028
	for <linux-lvm@redhat.com>; Fri, 22 Apr 2011 12:38:30 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p3MGcRaW027635
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 22 Apr 2011 12:38:27 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p3MGcQpw008389
	for <linux-lvm@redhat.com>; Fri, 22 Apr 2011 12:38:26 -0400
Date: Fri, 22 Apr 2011 12:38:26 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4DB1ACBB.4040508@abpni.co.uk>
Message-ID: <alpine.LRH.2.00.1104221236420.8342@bmsred.bmsi.com>
References: <4DB1ACBB.4040508@abpni.co.uk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] SAN
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

On Fri, 22 Apr 2011, Jonathan Tripathy wrote:

> What is the best way to deploy LVM in such a way that multiple servers could 
> access the LVs? Really what I'm looking for is a "common VG" for all of our 
> servers. Note though that only one server will actually access each LV, 
> however it would be cool if another server could make a snapshot to perform 
> an rsync backup.

This is what cluster LVM is for.  It provides a locking mechanism to
avoid conflicting changes to LVM metadata.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
