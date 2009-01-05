Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n05Io0hT010268
	for <linux-lvm@redhat.com>; Mon, 5 Jan 2009 13:50:00 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n05InkNp013418
	for <linux-lvm@redhat.com>; Mon, 5 Jan 2009 13:49:46 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id n05InoIh003359
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 5 Jan 2009 13:49:50 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.13.8) with ESMTP id n05Injbd000568
	for <linux-lvm@redhat.com>; Mon, 5 Jan 2009 13:49:45 -0500
Date: Mon, 5 Jan 2009 13:49:45 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] LVM2 on-disk layout
In-Reply-To: <ffa0f8300901050222y2083fbb1pbbc4bdb5c10aeb5a@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0901051346580.508@bmsred.bmsi.com>
References: <ffa0f8300901050222y2083fbb1pbbc4bdb5c10aeb5a@mail.gmail.com>
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

On Mon, 5 Jan 2009, Tejas Sumant wrote:

> I have few questions on lvm2 layout.
> 
> 1) Why array of MDA (metadata area) is required? Isnt single MDA sufficient?

It is not *required*, there is an option for only 1 MDA.  The extra
copies are for backup.  If main MDA gets wiped, and you don't have a backup
on a separate volume (I keep one in boot partition), then you will be glad
of the backup.

> 2) Which MDA is current?

There should be a counter in each MDA to determine most current.  Also
each MDA has a CRC to detect partial updates, and discourage manual
editing.

> 3) Why the metadata inside MDA wraps around, instead of the offset
> pointing to the start of metadata?

Someone else?

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
