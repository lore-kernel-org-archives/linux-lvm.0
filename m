Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oB7GwKjT006562
	for <linux-lvm@redhat.com>; Tue, 7 Dec 2010 11:58:20 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oB7Gw98I007455
	for <linux-lvm@redhat.com>; Tue, 7 Dec 2010 11:58:09 -0500
Received: from melissa.gathman.org (fairfax.gathman.org [72.209.196.211])
	(authenticated bits=0)
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id oB7Gw8LU028067
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 7 Dec 2010 11:58:08 -0500
Message-ID: <4CFE679D.2090702@bmsi.com>
Date: Tue, 07 Dec 2010 11:58:05 -0500
From: Stuart D Gathman <stuart@bmsi.com>
MIME-Version: 1.0
References: <AANLkTiktmuWTBC-s1Qi4KBjQOyhYh+TtLxiu0hPhNh+K@mail.gmail.com>
In-Reply-To: <AANLkTiktmuWTBC-s1Qi4KBjQOyhYh+TtLxiu0hPhNh+K@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] General Q on adding new PVs to existing striped
 RAID set
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

On 12/07/2010 04:15 AM, hansbkk@gmail.com wrote:
> Example - if I have say 6TB of RAID10 managed by LVM, and then find I
> need to add another 2TB, I might add a RAID1 mirror of 2x 2TB drives
> and extend my VG to get more space. However it seems for optimum
> performance and fault tolerance I should  consider this a somewhat
> temporary workaround. Ultimately I would want to get back to a
> coherent single 8TB RAID set, and take the RAID1 mirror out.
>
> This seems to be better from multiple POVs - more space efficient,
> more consistently predictable performance (if not actually faster),
> and most importantly more fault tolerant.
Raid1 is just as fault tolerant as raid10.  Raid10 just adds striping
for performance.  You are probably thinking that with more devices, the
probability of 2 devices failing close together is larger.  However,
going from 4 to 6 (or 8) devices does not significantly decrease
reliability compared to the increase provided by raid1 (with or without
striping).
> I realize if I was using RAID6 as many have advised I should, I could
> grow the underlying RAID itself directly and then expand the VG, and
> obviously this would be ideal. But I wanted to clarify regarding those
> RAID flavors that can't be grown in place, as a principle of best
> practice.
You can grow raid1/raid10 also.  Raid6 (and 5) has the read/modify/write
cycle issue that affects random write performance.
> Please confirm if my thinking on this is on the right track.
LVM supports raid0 and 1 (and other levels in testing).  The only reason
I use raid1 "underneath" is that LVM is still maturing in raid support
(compared to, say, AIX).  LVM raid0 is quite good, however.  Consider
making all your PVs raid1, and doing your striping in LVM.  That is the
equivalent of raid10 and gives you much more flexibility in growing your
VG than raid10 underneath.
