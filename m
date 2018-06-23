MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sat, 23 Jun 2018 12:09:21 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <326c998e-67f8-6331-c8f1-a22e8c06fd98@redhat.com>
References: <66e4dbc1-ca00-3abf-5100-d19f7439a281@magenta.tv>
	<6e53a6f7-9896-2905-92ad-6b9c36f565ab@redhat.com>
	<39a2408c600ed4caf00724eb72c191c2@assyoma.it>
	<326c998e-67f8-6331-c8f1-a22e8c06fd98@redhat.com>
Message-ID: <c351a57bdcf219c04b315aa02b6207ea@assyoma.it>
Subject: Re: [linux-lvm] Unable to un-cache logical volume when chunk size
	is over 1MiB
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
Cc: Launchbury <ryan@magenta.tv>, Ryan, LVM general discussion and development <linux-lvm@redhat.com>

Il 22-06-2018 22:07 Zdenek Kabelac ha scritto:
> When cache will experience write error - it will become invalidate and 
> will
> need to be dropped - but this thing is not automated ATM - so admin
> works is needed to handle this task.

So, if a writethrough cache experience write errors but the 
administrator is not able to immediately intervene to drop the cache, 
what problem can arise? Stale reads? Slow performance?

What about cache *read* error? Is the read simply redirected to the 
underlying slow/main volume?

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
