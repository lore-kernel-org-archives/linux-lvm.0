Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF62F60C65
	for <linux-lvm@redhat.com>; Sun, 16 Dec 2018 20:40:37 +0000 (UTC)
Received: from mr013msb.fastweb.it (mr013msb.fastweb.it [85.18.95.104])
	by mx1.redhat.com (Postfix) with ESMTP id 339E458E33
	for <linux-lvm@redhat.com>; Sun, 16 Dec 2018 20:40:33 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sun, 16 Dec 2018 21:40:30 +0100
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <167b30557b8.d471a29712958.970233558882873666@vacanti.org>
References: <167b30557b8.d471a29712958.970233558882873666@vacanti.org>
Message-ID: <807b41c03c2d66e16153a8ee3489b4f1@assyoma.it>
Subject: Re: [linux-lvm] PV not found
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
To: giuseppe@vacanti.org, LVM general discussion and development <linux-lvm@redhat.com>

Il 15-12-2018 18:59 Giuseppe Vacanti ha scritto:
> - pvscan does not report /dev/sdc
> 
> - pvdisplay does not seem to know about this PV
>   pvdisplay /dev/sdc
>   Failed to find physical volume "/dev/sdc"

Can you show the output of "lsblk" and "pvscan -vvv" ?
Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
