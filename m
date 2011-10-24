Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p9OHr7j9022314
	for <linux-lvm@redhat.com>; Mon, 24 Oct 2011 13:53:07 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9OHr69P018685
	for <linux-lvm@redhat.com>; Mon, 24 Oct 2011 13:53:06 -0400
Date: Mon, 24 Oct 2011 13:52:38 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <CAGRgLy5Sm_T19Ex+qLe=rTH3r_nSnYOhW+mU5HZy5Y1y2JnJAw@mail.gmail.com>
Message-ID: <alpine.LRH.2.00.1110241349570.23222@bmsred.bmsi.com>
References: <CAGRgLy6mHYGGS-ydGCx_mWGuKE31TLu5xnAzkAb6ZoEHjzPW+A@mail.gmail.com>
	<CAJJYPdkzu_SXGjuoUmfMVOA_UJhAFsnZWf8z41pfGUxJFMT6xA@mail.gmail.com>
	<CAGRgLy5Sm_T19Ex+qLe=rTH3r_nSnYOhW+mU5HZy5Y1y2JnJAw@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Changing dev_t-devname mapping in lvmlib seems to
 be problematic
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

On Mon, 24 Oct 2011, Alexander Lyakas wrote:

>> dm-xxx devices are created dynamicaly - there is currently no way to
>> have a fixed dm device node and it would be quite ugly to provide such
>> feature.
> I did not understand this comment. Do you mean the dm-xxx devices that
> LVM creates for its LVs? I was talking about dm-linear devices that I
> use for PVs.

Why are you using dm-linear for PVs?

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
