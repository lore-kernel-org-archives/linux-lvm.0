MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 14 Apr 2017 11:55:21 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <b8f49134-dea7-7620-dba7-0123282f0bd8@redhat.com>
References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<fa8b9d2e-6f1f-d201-263a-48178815a055@assyoma.it>
	<2f9c4346d4e9646ca058efdf535d435e@xenhideout.nl>
	<f934657c1724caba1c432cace2f0ca69@assyoma.it>
	<5df13342-8c31-4a0b-785e-1d12f0d2d9e8@redhat.com>
	<483184bceea4fad4baafef32408015b6@assyoma.it>
	<b8f49134-dea7-7620-dba7-0123282f0bd8@redhat.com>
Message-ID: <0f509d1244e590f5e9518498dddf9812@assyoma.it>
Subject: Re: [linux-lvm] Snapshot behavior on classic LVM vs ThinLVM
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: Xen <list@xenhideout.nl>, LVM general discussion and development <linux-lvm@redhat.com>

Il 14-04-2017 11:37 Zdenek Kabelac ha scritto:
> The problem is not with 'stopping' access - but to gain the access 
> back.
> 
> So in this case - you need to run 'fsck' - and this fsck usually needs
> more space - and the complexity starts with - where to get this space.
> 
> In the the 'most trivial' case - you have the space in 'VG' - you just
> extend thin-pool and you run 'fsck' and it works.
> 
> But then there is number of cases ending with the case that you run
> out of metadata space that has the maximal size of ~16G so you can't
> even extend it, simply because it's unsupported to use any bigger
> size.
> 
> So while every case has some way forward how to proceed - none of them
> could be easily automated.

To better understand: what would be the (manual) solution here, if 
metadata are full and can not be extended due to the hard 16 GB limit?

> And it's so much easier to monitor and prevent this to happen compared
> with solving these thing later.
> 
> So all is needed is - user is aware what he is using and does proper
> action and proper time.
> 

Absolutely. However, monitoring can also fail - a safe failure model is 
a really important thing.

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
