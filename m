Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6NGZCvj018773
	for <linux-lvm@redhat.com>; Fri, 23 Jul 2010 12:35:12 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o6NGZ2tk021676
	for <linux-lvm@redhat.com>; Fri, 23 Jul 2010 12:35:02 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o6NGZ1Mt011578
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 23 Jul 2010 12:35:01 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o6NGZ1IH013067
	for <linux-lvm@redhat.com>; Fri, 23 Jul 2010 12:35:01 -0400
Date: Fri, 23 Jul 2010 12:35:01 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <AANLkTikPSlCYVydL4oA4tA9bt_bqfuU6l-VyXxp7kQfT@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1007231229440.13013@bmsred.bmsi.com>
References: <AANLkTikwNhMWtusJHicMya9k5IS9geQ17ss4aHurjm4z@mail.gmail.com>
	<20100721185404.GA14889@bdmcc-us.com>
	<AANLkTiks7RESsKs1Qjs-P67suhY3tP8lc6ERFfUfjKwZ@mail.gmail.com>
	<Pine.LNX.4.64.1007222159180.7363@bmsred.bmsi.com>
	<AANLkTikPSlCYVydL4oA4tA9bt_bqfuU6l-VyXxp7kQfT@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] [SOLVED?] rebuilding LV ext4 filesystem
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

On Thu, 22 Jul 2010, Ken Bass wrote:

> Again, thank you SO much. There were a few files that I really wanted/needed
> to recover. Plus, I also needed the storage space back on the LAN server.

I always use mirrored disks with the md driver.  Simpler to use 
than Raid-5, flexible (remove a disk and take it else where for an instant
clone), performance boost for reads (but not writes), disks are
cheap, protects against simple disk failure - i.e. what you just suffered,
2 disk minimum requirement (vs. 3 or more for other RAID schemes).

Just add the md* devices as PVs to your volume group.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
