Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pB2LstDe018164
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2011 16:54:55 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pB2Lssbk016582
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2011 16:54:54 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id pB2LsK9X017282
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2011 16:54:20 -0500
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id pB2LsIw5005776
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2011 16:54:19 -0500
Date: Fri, 2 Dec 2011 16:54:18 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <6.2.5.6.2.20111202160842.063ebbf0@binnacle.cx>
Message-ID: <alpine.LRH.2.00.1112021652250.5734@bmsred.bmsi.com>
References: <6.2.5.6.2.20111202121427.03b28738@flumedata.com>
	<6.2.5.6.2.20111202132949.03b2cc68@binnacle.cx>
	<alpine.LRH.2.00.1112021553440.5337@bmsred.bmsi.com>
	<6.2.5.6.2.20111202160842.063ebbf0@binnacle.cx>
MIME-Version: 1.0
Subject: Re: [linux-lvm] cmp of inactive mirrored LV fails
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

Centuries ago, Nostradamus foresaw that on Dec 2, starlight@binnacle.cx...:

> By coincidence I've just setup my first MD
> RAID0 partitions on a different system.
> Discovered
>
>   echo "check" >>/sys/block/md?/md/sync_action
>
> which triggers a mirror check.  I'm guessing that
> this operation takes account of the DISCARD
> discrepencies and therefore does not report
> false errors.  (correct me if I'm wrong)

At least as of EL5.7, MD sync check does not take
into account DISCARD, and does not report 
individual blocks out of sync - just a count.

BTW, RAID0 does *not* provide mirroring!  You want
RAID1 or RAID10 for that.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
