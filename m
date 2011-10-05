Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p95JYkMu012265
	for <linux-lvm@redhat.com>; Wed, 5 Oct 2011 15:34:46 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p95JYgWA014061
	for <linux-lvm@redhat.com>; Wed, 5 Oct 2011 15:34:42 -0400
Date: Wed, 5 Oct 2011 15:34:17 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <CAGRgLy4AHJV9yFncX--aoSXbNg40LMJHtCqwMk=Y-L5RPe_dcQ@mail.gmail.com>
Message-ID: <alpine.LRH.2.00.1110051533410.5243@bmsred.bmsi.com>
References: <CAGRgLy4AHJV9yFncX--aoSXbNg40LMJHtCqwMk=Y-L5RPe_dcQ@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] initializing a PV, which was part of an old VG
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
Cc: Zdenek Kabelac <zdenek.kabelac@gmail.com>

On Wed, 5 Oct 2011, Alexander Lyakas wrote:

> I am frequently hitting issues when trying to create a new VG on a PV
> that had existing VG. (This PV is usually an MD raid0 or raid1
> device). I am wondering what is the correct procedure to completely
> wipe out any remains of LVM signatures from a PV, and initialize the
> PV afresh?

pvremove /dev/xxxx

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
