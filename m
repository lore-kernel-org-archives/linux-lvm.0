Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p9R9O06f015887
	for <linux-lvm@redhat.com>; Thu, 27 Oct 2011 05:24:00 -0400
Received: from mail-iy0-f174.google.com (mail-iy0-f174.google.com
	[209.85.210.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9R9Nxvd009510
	for <linux-lvm@redhat.com>; Thu, 27 Oct 2011 05:23:59 -0400
Received: by iaby12 with SMTP id y12so4206526iab.33
	for <linux-lvm@redhat.com>; Thu, 27 Oct 2011 02:23:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.00.1110241349570.23222@bmsred.bmsi.com>
References: <CAGRgLy6mHYGGS-ydGCx_mWGuKE31TLu5xnAzkAb6ZoEHjzPW+A@mail.gmail.com>
	<CAJJYPdkzu_SXGjuoUmfMVOA_UJhAFsnZWf8z41pfGUxJFMT6xA@mail.gmail.com>
	<CAGRgLy5Sm_T19Ex+qLe=rTH3r_nSnYOhW+mU5HZy5Y1y2JnJAw@mail.gmail.com>
	<alpine.LRH.2.00.1110241349570.23222@bmsred.bmsi.com>
Date: Thu, 27 Oct 2011 11:23:59 +0200
Message-ID: <CAGRgLy4Ra6FBQmg+jKu5hTzuGLrHm14DEGqQdYNCJuz8i=eQiQ@mail.gmail.com>
From: Alexander Lyakas <alex.bolshoy@gmail.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi Stuart,
with device mapper it's very easy to switch the underneath stack,
using dmsetup reload. (So now you would ask why would I want to do
it?)

Alex.


On Mon, Oct 24, 2011 at 7:52 PM, Stuart D. Gathman <stuart@bmsi.com> wrote:
> On Mon, 24 Oct 2011, Alexander Lyakas wrote:
>
>>> dm-xxx devices are created dynamicaly - there is currently no way to
>>> have a fixed dm device node and it would be quite ugly to provide such
>>> feature.
>>
>> I did not understand this comment. Do you mean the dm-xxx devices that
>> LVM creates for its LVs? I was talking about dm-linear devices that I
>> use for PVs.
>
> Why are you using dm-linear for PVs?
>
> --
> � � � � � � �Stuart D. Gathman <stuart@bmsi.com>
> � �Business Management Systems Inc. �Phone: 703 591-0911 Fax: 703 591-6154
> "Confutatis maledictis, flammis acribus addictis" - background song for
> a Microsoft sponsored "Where do you want to go from here?" commercial.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
