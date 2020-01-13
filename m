Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB1772022EAB
	for <linux-lvm@redhat.com>; Mon, 13 Jan 2020 14:33:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B31E080301D
	for <linux-lvm@redhat.com>; Mon, 13 Jan 2020 14:33:02 +0000 (UTC)
References: <8788b5db-6667-6060-e66a-beab7d3a56fc@nebelschwaden.de>
	<1c4af753-8f20-c50d-37a4-a3d8d8f979f9@redhat.com>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <fa490a40-1c58-f905-b5bb-93df3c9f22a2@assyoma.it>
Date: Mon, 13 Jan 2020 15:32:56 +0100
MIME-Version: 1.0
In-Reply-To: <1c4af753-8f20-c50d-37a4-a3d8d8f979f9@redhat.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] metadata device too small
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>, listac@nebelschwaden.de

On 12/01/20 19:11, Zdenek Kabelac wrote:
> With 16G there is 'problem' (not yet resolved known issue) with 
> different max size used by thin_repair (15.875G) & lvm2 (15.8125G) tools.
> 
> If you want to go with current max size supported by lvm2 - use the 
> value -L16192M.

Hi Zdenek,
just for confirmation: so using a 16 GiB thin metadata volume *will* 
result in activation problems? For example, a

lvcreate --thin system --name thinpool -L 100G --poolmetadatasize 16G

will be affected by the problem you wrote above?

Finally, does it means that lvmthin man page is wrong when stating that 
"Thin pool metadata LV sizes can be from 2MiB to 16GiB" (note the GiB 
suffix rather than GB)?

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
