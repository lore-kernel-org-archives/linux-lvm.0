References: <da37558c-157c-3817-ca59-96202f615be9@assyoma.it>
	<20170918185551.GB6025@redhat.com>
	<3c3eefcc34a6d322b790d91f63cb9d95@assyoma.it>
	<03ce46a8-531e-0b16-b01c-f94e7ae2c6b3@gmail.com>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <f10d57e3-9866-c62e-3b22-96bd810488c8@assyoma.it>
Date: Tue, 19 Sep 2017 10:44:01 +0200
MIME-Version: 1.0
In-Reply-To: <03ce46a8-531e-0b16-b01c-f94e7ae2c6b3@gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Option to silence "WARNING: Sum of all thin volume
 sizes exceeds the size of thin pool"
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>, David Teigland <teigland@redhat.com>

On 18/09/2017 22:08, Zdenek Kabelac wrote:
> 
> 
> We can possibly print WARNING message only with the 1st. thin LV� which 
> causes overprovisioining of thin-pool.

This should be ok, but it would not cover all use cases. For example, a 
thin snapshot taken, and removed, for backup purpose would repeatedly 
trigger the warning.

So, while more "intelligence" on when printing the warning on lvm side 
is welcomed, I really advocate for a simple command line option (or 
lvm.conf parameter) to skip the warning.

> As� for 'read-only' snapshot - it really doesn't matter - the 
> overprovisioned pool can in the 'worst' case end in out-of-space 
> condition (i.e. fully rewritten origin)

Sure, I was only describing a possible case where the warning is 
"redundant" (ie: because the admin know the snapshot will be short-lived).

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
