Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p9ADLHxh004655
	for <linux-lvm@redhat.com>; Mon, 10 Oct 2011 09:21:17 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9ADLC40013152
	for <linux-lvm@redhat.com>; Mon, 10 Oct 2011 09:21:13 -0400
Date: Mon, 10 Oct 2011 09:20:42 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <CAGRgLy5VqJvzgQZbXz8T9ykPk-Uio_xdQ9Cm4M1AYc4_mCQFag@mail.gmail.com>
Message-ID: <alpine.LRH.2.00.1110100919330.13345@bmsred.bmsi.com>
References: <CAGRgLy4AHJV9yFncX--aoSXbNg40LMJHtCqwMk=Y-L5RPe_dcQ@mail.gmail.com>
	<4E8CB045.7090103@gmail.com>
	<CAGRgLy6czUA01Pn8BUVh5QdLp+0HNRChcNyvAjDVCW73jJdnoA@mail.gmail.com>
	<alpine.LRH.2.00.1110060909570.10112@bmsred.bmsi.com>
	<CAGRgLy5VqJvzgQZbXz8T9ykPk-Uio_xdQ9Cm4M1AYc4_mCQFag@mail.gmail.com>
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

On Sun, 9 Oct 2011, Alexander Lyakas wrote:

> I will add a call to pvremove -ff before pvcreate.

You shouldn't need the -ff with pvremove.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
