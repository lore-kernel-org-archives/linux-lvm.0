MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon, 25 Jun 2018 19:19:01 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <CAG+REr=gFS_3YMo_6s5K32w=ibntEshE7VBOy-7Vt2c7Psi_kQ@mail.gmail.com>
References: <66e4dbc1-ca00-3abf-5100-d19f7439a281@magenta.tv>
	<6e53a6f7-9896-2905-92ad-6b9c36f565ab@redhat.com>
	<39a2408c600ed4caf00724eb72c191c2@assyoma.it>
	<326c998e-67f8-6331-c8f1-a22e8c06fd98@redhat.com>
	<c351a57bdcf219c04b315aa02b6207ea@assyoma.it>
	<CAG+REr=gFS_3YMo_6s5K32w=ibntEshE7VBOy-7Vt2c7Psi_kQ@mail.gmail.com>
Message-ID: <213e498ea447f141c7a975c13416281e@assyoma.it>
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
To: Ryan Launchbury <ryan@magenta.tv>
Cc: LVM, development <linux-lvm@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>

Il 24-06-2018 21:18 Ryan Launchbury ha scritto:
> In testing, forcibly removing the cache, via editing the LVM config
> file has caused extensive XFS filesystem corruption, even when backing
> up the metadata first and restoring after the cache device is missing.
> Any advice on how to safely uncache the volume would be massively
> appreciated.

It is my understanding that a writethrough cache should *never* have any 
data that are not on the backing volumes already.
In other words, forcibly removing a writethough cache (ie: disconnetting 
the physical cache device) should not cause any harms to 
filesystem/data.

Can you show the output of "dmsetup table"?
Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
