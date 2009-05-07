Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n473tqFA032338
	for <linux-lvm@redhat.com>; Wed, 6 May 2009 23:55:52 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n473td16028889
	for <linux-lvm@redhat.com>; Wed, 6 May 2009 23:55:39 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id n473tdxd025615
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 6 May 2009 23:55:39 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id n473tcRm027808
	for <linux-lvm@redhat.com>; Wed, 6 May 2009 23:55:39 -0400
Date: Wed, 6 May 2009 23:55:38 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] LVM and Truecrypt
In-Reply-To: <1f04f6fa0905061919l102db155t6965ead9257f9ddd@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0905062349110.27743@bmsred.bmsi.com>
References: <1f04f6fa0905061653k57d9bc8ekc0e55f809e98126a@mail.gmail.com>
	<4A02268F.8010105@whgl.uni-frankfurt.de>
	<1f04f6fa0905061919l102db155t6965ead9257f9ddd@mail.gmail.com>
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

On Wed, 6 May 2009, Gordon Fogus wrote:

> 3. Because of hardware changes and/or operating system changes and/or "disk
> order" changes, no data can be read from the RAID.

Does Windows have that "feature"?  Just kidding.  I think your fear
is based on experience with hardware RAID.  Every sane operating system
keeps headers with labels on filesystems and volumes.  Disk order doesn't
matter with LVM, or software RAID. 

> I'd be curious to know this: if I had a JOBD under LVM and I tried to plug
> the disks into another PC entirely, would I be able to read the files I had
> on those drives?  How does LVM know which drive was where in the order of
> drives in the JOBD?

Every physical volume (PV) in LVM has a header (called metadata) with a
unique PV UUID.  Yes, you can read the disks on another PC.

> I am not actually worried about data loss from a drive failure.  I backup
> regularly (but I have never had a hard drive fail.  I attribute this partly
> to the temperature at which I keep my drives).  I have had several RAID
> controller failures (which is why I no longer consider any RAID level to be
> a backup).

I always use software RAID1.  Negligible overhead on server, no fancy
hardware RAID controllers to fail.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
