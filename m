MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sat, 22 Apr 2017 22:58:10 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <b1b73e21196be7c50daa098b2724880a@xenhideout.nl>
References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<fa8b9d2e-6f1f-d201-263a-48178815a055@assyoma.it>
	<2f9c4346d4e9646ca058efdf535d435e@xenhideout.nl>
	<f934657c1724caba1c432cace2f0ca69@assyoma.it>
	<5df13342-8c31-4a0b-785e-1d12f0d2d9e8@redhat.com>
	<e12f977563bfccf0a2a39aa3e53b9cf4@assyoma.it>
	<b1b73e21196be7c50daa098b2724880a@xenhideout.nl>
Message-ID: <305bfacb87be98d3b636f0dabb62df33@assyoma.it>
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
To: Xen <list@xenhideout.nl>
Cc: LVM, development <linux-lvm@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>

Il 22-04-2017 18:32 Xen ha scritto:
> This is not my experience on LVM 111 from Debian.
> 
> For me new messages are generated when:
> 
> - the pool reaches any threshold again
> - I remove and recreate any thin volume.
> 
> Because my system regenerates snapshots, I now get an email from my
> script when the pool is > 80%, every day.
> 
> So if I keep the pool above 80%, every day at 0:00 I get an email
> about it :p. Because syslog gets a new entry for it. This is why I
> know :p.
> 

Interesting, I had to try that ;)
Thanks for suggesting.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
