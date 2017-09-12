References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<0c6c96790329aec2e75505eaf544bade@assyoma.it>
	<8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
	<7d0d218c420d7c687d1a17342da5ca00@xenhideout.nl>
	<6e9535b6-218c-3f66-2048-88e1fcd21329@redhat.com>
	<2cea88d3e483b3db671cc8dd446d66d0@xenhideout.nl>
	<f00db013-56a5-87f5-dd98-37d603ea1b9b@redhat.com>
	<9115414464834226be029dacb9b82236@xenhideout.nl>
	<50f67268-a44e-7cb7-f20a-7b7e15afde3a@redhat.com>
	<5cb21c879cfff0b1916e823b85d35909@xenhideout.nl>
	<87a619a2-cefc-3b4e-a709-0906053503e9@redhat.com>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <bd0c1d0e-172a-f6c1-039f-8724dc8d007e@assyoma.it>
Date: Tue, 12 Sep 2017 19:14:58 +0200
MIME-Version: 1.0
In-Reply-To: <87a619a2-cefc-3b4e-a709-0906053503e9@redhat.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>, Xen <list@xenhideout.nl>

On 12/09/2017 16:37, Zdenek Kabelac wrote:
> ZFS with zpolls with thin with thinpools running directly on top of device.
> 
> If zpools - are 'equally' fast as thins  - and gives you better protection,
> and more sane logic the why is still anyone using thins???
> 
> I'd really love to see some benchmarks....
> 
> Of course if you slow down speed of thin-pool and add way more 
> synchronization points and consume 10x more memory :) you can get better 
> behavior in those exceptional cases which are only hit by unexperienced 
> users who tends to intentionally use thin-pools in incorrect way.....

Having benchmarked them, I can reply :)

ZFS/ZVOLs surely are slower than thinp, full stop.
However, they are not *massively* slower.

To tell the truth, what somewhat slow me on ZFS adoption is its low 
integration in the Linux kernel subsystem. For example:
- cache duplication (ARC + pagecache)
- slow reclaim of memory used for caching
- SPL (sun porting layer)
- dependency on 3rd part module
...

Thinp is great tech - and I am already using it. I did not started this 
thread as ZFS vs Thinp, really. Rather, I would like to understand how 
to better use thinp, and I traced a parallelism with ZVOLs, nothing more.

Thanks.

-- 
-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
