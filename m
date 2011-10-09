Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p99JlMfT023822
	for <linux-lvm@redhat.com>; Sun, 9 Oct 2011 15:47:22 -0400
Received: from mail-iy0-f174.google.com (mail-iy0-f174.google.com
	[209.85.210.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p99JlIBk015284
	for <linux-lvm@redhat.com>; Sun, 9 Oct 2011 15:47:18 -0400
Received: by iakk32 with SMTP id k32so9576386iak.33
	for <linux-lvm@redhat.com>; Sun, 09 Oct 2011 12:47:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.00.1110060909570.10112@bmsred.bmsi.com>
References: <CAGRgLy4AHJV9yFncX--aoSXbNg40LMJHtCqwMk=Y-L5RPe_dcQ@mail.gmail.com>
	<4E8CB045.7090103@gmail.com>
	<CAGRgLy6czUA01Pn8BUVh5QdLp+0HNRChcNyvAjDVCW73jJdnoA@mail.gmail.com>
	<alpine.LRH.2.00.1110060909570.10112@bmsred.bmsi.com>
Date: Sun, 9 Oct 2011 21:47:16 +0200
Message-ID: <CAGRgLy5VqJvzgQZbXz8T9ykPk-Uio_xdQ9Cm4M1AYc4_mCQFag@mail.gmail.com>
From: Alexander Lyakas <alex.bolshoy@gmail.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Zdenek Kabelac <zdenek.kabelac@gmail.com>

Thank you Stuart,
I will add a call to pvremove -ff before pvcreate.

Alex.


On Thu, Oct 6, 2011 at 3:11 PM, Stuart D. Gathman <stuart@bmsi.com> wrote:
> On Thu, 6 Oct 2011, Alexander Lyakas wrote:
>
>> yes, I only had a single PV, and I did pvcreate on it, and then
>> lvm_scan() from my process.
>>
>> So you suggest to use first pvremove and then pvcreate? Because
>> pvcreate I do in any case. So pvcreate alone is not similar to
>> pvremove followed by pvcreate?
>
> Yes, you need to pvremove first to start from scratch.
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
