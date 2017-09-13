MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 13 Sep 2017 12:46:40 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <49748849-d6ac-1b02-7f7a-7bb03981529d@redhat.com>
References: <1575245610.821680.1505258554456.ref@mail.yahoo.com>
	<1575245610.821680.1505258554456@mail.yahoo.com>
	<052d4c46af896716c0f47132f4ddfb8d@assyoma.it>
	<b0d6b9a1-19fa-5e88-e031-d30d7386dfe8@redhat.com>
	<738b359eccce111fb8c81733276b9845@assyoma.it>
	<49748849-d6ac-1b02-7f7a-7bb03981529d@redhat.com>
Message-ID: <95eec292e168ee02459ae283212c2295@assyoma.it>
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: matthew, LVM general discussion and development <linux-lvm@redhat.com>

Il 13-09-2017 10:44 Zdenek Kabelac ha scritto:
> Forcible remove (with some reasonable locking - so i.e. 2 processes
> are not playing with same device :)   'dmsetup remove --force' - is
> replacing
> existing device with 'error' target (with built-in noflush)
> 
> Anyway - if you see a reproducible problem with forcible removal - it
> needs to be reported as this is a real bug then and BZ shall be
> opened...
> 
> Regards
> 
> Zdenek

Ok, I'll do some more test and in case problems arise I'll open the BZ 
:)
Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
