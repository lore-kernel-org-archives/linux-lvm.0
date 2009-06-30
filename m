Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n5UJ808N013209
	for <linux-lvm@redhat.com>; Tue, 30 Jun 2009 15:08:00 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n5UJ7hgh032041
	for <linux-lvm@redhat.com>; Tue, 30 Jun 2009 15:07:43 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id n5UJ7g74007416
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 30 Jun 2009 15:07:42 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id n5UJ7gSQ014142
	for <linux-lvm@redhat.com>; Tue, 30 Jun 2009 15:07:42 -0400
Date: Tue, 30 Jun 2009 15:07:42 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Mapping LVs to physical device
In-Reply-To: <4A4A48B8.9040401@stormagic.com>
Message-ID: <Pine.LNX.4.64.0906301438270.13824@bmsred.bmsi.com>
References: <4A4A48B8.9040401@stormagic.com>
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

On Tue, 30 Jun 2009, Chris Farey wrote:

> I have a requirement to be able to work out which areas of a physical device
> assigned to LVM are being used by various logical volumes. I haven't found any
> easy way to do this using an API, so I've resorted to spawning off lvm
> commands and interpretting the output.

It is also useful to go the other way: given a physical sector, figure out
which LV it is in and the offset.  When there is a physical disk error
(and no mirroring or such), it is useful to map it to an offset in a LV,
and then to a file.  Modern disks can "heal" themselves by writing over 
the sector (copying, repairing or replacing, and then overwriting the file).

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
