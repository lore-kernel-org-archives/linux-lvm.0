Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o81HEkAh010353
	for <linux-lvm@redhat.com>; Wed, 1 Sep 2010 13:14:46 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o81HEai9004920
	for <linux-lvm@redhat.com>; Wed, 1 Sep 2010 13:14:36 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o81HEao1027999
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 1 Sep 2010 13:14:36 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o81HEZog003909
	for <linux-lvm@redhat.com>; Wed, 1 Sep 2010 13:14:35 -0400
Date: Wed, 1 Sep 2010 13:14:35 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <2E9263050F8EE046972BE0510E7A71DA062D2F52@SH-EXCHBE2.master.lsuhsc.edu>
Message-ID: <Pine.LNX.4.64.1009011303260.3640@bmsred.bmsi.com>
References: <2E9263050F8EE046972BE0510E7A71DA062D2F52@SH-EXCHBE2.master.lsuhsc.edu>
MIME-Version: 1.0
Subject: Re: [linux-lvm] HDD failure - please help!
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

On Wed, 1 Sep 2010, Patterson, James wrote:

> I have a system running FC11 with five HDDs, ~2 TB of space, all in a
> logical volume. It was my presumption that the LVM system functioned
> sort of like a raid system (I know you can run striped, for instance).

The only RAID like redundancy that LVM supports is mirroring (like RAID1), but
only if you create the LVs as mirrored.  Striping (like RAID0) actually
makes your data *more* vulnerable (but faster).

If you wanted RAID5, your best bet on linux is the md driver.  Or else
a hardware RAID controller.

> I am at a loss as to what to do - I'm thinking that there must be a way
> to recover the data on the remaining four drives. Surely this LVM system
> is not going to cause me to lose the data on all five drives because one
> of them failed?

If the LVs were striped, then yep, that is the nature of striping.  And 
even if you had properly configured RAID 5 or mirroring and where immune
to hard drive failure, there is always the fat finger failure ("rm -rf /"
and its more subtle ilk).

Since you don't have any details on exactly what kind of LVs you
created, your first step is getting a copy of the metadata.  There 
should be a copy at the beginning of each drive.

If you had a single logical volume, and you were configured as jbod (Just
a Bunch of Disks), then you should look back a month or so in the archives
where another user made the same mistake, but got a significant portion
of his data back from the good drives.  I won't repeat the steps here.
(You'll need an external USB adapter, freezer, new drive to replace failed,
etc).

Hopefully, you've learned your lesson and won't presume (or assume) next time.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
