Received: from [10.34.131.19] (dhcp131-19.brq.redhat.com [10.34.131.19])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2SFVSHi013666
	for <linux-lvm@redhat.com>; Fri, 28 Mar 2014 11:31:29 -0400
Message-ID: <533595CF.3040003@redhat.com>
Date: Fri, 28 Mar 2014 16:31:27 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CANfzhCZOM3xUdVfG74RtxtDa5tHE6MhnHo=LmNS_G9DR5WwYqQ@mail.gmail.com>
In-Reply-To: <CANfzhCZOM3xUdVfG74RtxtDa5tHE6MhnHo=LmNS_G9DR5WwYqQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] How do I remove a locked Logical Volume ([pvmove0])
 left over after a disk error?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 27.3.2014 12:32, Derek Dongray napsal(a):
> Following some disk errors while I was moving some extents, I now have a
> hidden locked [pvmove0] which doesn't seem to have any physical extents
> assigned, although it is shown as 4Mb long.
>
>      # lvs -a -o+seg_pe_ranges a/pvmove0
>        LV        VG   Attr       LSize Pool Origin Data%  Move Log Cpy%Sync
> Convert PE Ranges
>        [pvmove0] a    vwC---v--- 4.00m
>
> The simple 'lvremove a/pvmove0' (optionally with '--force') results in the
> message 'Can't remove locked LV pvmove0'.
>
> 'pvmove --abort' does nothing. The presence of this volume doesn't seem to
> affect other moves (which simply use [pvmove1]).
>


pvmove --abort has to work - unless you have some ancient version of lvm2 tools?

What's the vresion in use ?

(You could always hack your lvm2 metadata in 'vi' - if you know what you
are doing...)

Zdenek
