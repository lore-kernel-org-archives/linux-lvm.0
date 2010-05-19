Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4JGpa7M022659
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 12:51:36 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4JGpQ7t024277
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 12:51:26 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o4JGpPDL029223
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 12:51:26 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o4JGpPRv028239
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 12:51:25 -0400
Date: Wed, 19 May 2010 12:51:25 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <05c901caf771$a3161920$e9424b60$@com>
Message-ID: <Pine.LNX.4.64.1005191246520.28122@bmsred.bmsi.com>
References: <059801caf769$fc848350$f58d89f0$@com>
	<4BF40A8B.2000201@alteeve.com> <20100519162601.GA18162@us.ibm.com>
	<05c901caf771$a3161920$e9424b60$@com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Adding a disk to expand an existing logical volume
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

On Wed, 19 May 2010, kevin wrote:

> >If I were you, I would not bother with partition(s). I will add the
> >whole disk to LVM.
> 
> I intend for the entire disk to be used -- so I should just skip the fdisk
> step?

Yes, just do the pvcreate directly on /dev/sdc (instead of /dev/sdc1).

I would only recommend this if the drive is permanently attached to your
server.  If there is any possibility of it getting moved to another system,
especially another OS, it is likely to appear "unformatted" and the other
OS will offer to create a partition table, etc, destroying the data.
The partition table, although otherwise useless for LVM (and a pain when
trying to align PPs to some lower lever boundary), does serve the purpose
of telling other PC operating systems that there is something there.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
