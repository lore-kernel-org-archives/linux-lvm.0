MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sat, 23 Jun 2018 12:14:48 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <b6977938-ecdb-46d8-9c45-8ac048f713b1@redhat.com>
References: <f158d4decb9c99fec72c600553ef519b@assyoma.it>
	<b6977938-ecdb-46d8-9c45-8ac048f713b1@redhat.com>
Message-ID: <0bfbc3719a0796551c685b9f3925ca40@assyoma.it>
Subject: Re: [linux-lvm]
	=?utf-8?q?Thin_metadata_volume_bigger_than_16GB_=3F?=
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
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Il 22-06-2018 22:13 Zdenek Kabelac ha scritto:
> 
> Addressing is internally limited to use lower amount of bits.
> 
> Usage of memory resources, efficiency.
> 
> ATM we do not recommend to use cache with more then 1.000.000 chunks
> for better efficiency reasons although on bigger machines bigger
> amount of chunks are still quite usable especially now with cache
> metadata format 2.

Does it means that with a 64 KB cache chunk size I can efficiently cache 
only up to 64 KB * 1000000 = ~60 GB volume?
So for, say, a 64 TB volume do I need to use 64 MB cache chunks?

> ATM drop data you don't need  (fstrim filesystem).
> 
> So far there were not many request to support bigger size although
> there are plans to improve thin-pool metadata format for next version.
> 
> Regards
> 
> Zdenek

Extremely informative answer, thanks a lot.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
