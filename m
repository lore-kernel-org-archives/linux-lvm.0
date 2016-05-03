Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u43DFnSv024906
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Tue, 3 May 2016 09:15:49 -0400
Received: from mr003msb.fastweb.it (mr003msb.fastweb.it [85.18.95.87])
	by mx1.redhat.com (Postfix) with ESMTP id 4A9C881126
	for <linux-lvm@redhat.com>; Tue,  3 May 2016 13:15:47 +0000 (UTC)
Received: from ceres.assyoma.it (93.63.55.57) by mr003msb.fastweb.it
	(8.5.140.04) id 57173F4D00BC2339 for linux-lvm@redhat.com;
	Tue, 3 May 2016 15:15:46 +0200
Received: from gdanti-laptop.assyoma.it (unknown [172.31.255.5])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ceres.assyoma.it (Postfix) with ESMTPSA id 89AC5269F4C
	for <linux-lvm@redhat.com>; Tue,  3 May 2016 15:15:45 +0200 (CEST)
References: <929635034.3140318.1461840230292.JavaMail.yahoo.ref@mail.yahoo.com>
	<929635034.3140318.1461840230292.JavaMail.yahoo@mail.yahoo.com>
	<445afc4b9ae3fbf477f8f66db9d28580@dds.nl> <57234421.5040902@redhat.com>
	<CALm7yL05s2BrFL=C_r_BEP3jDkUgKWhRFgHSwhYNreEj9AgLNQ@mail.gmail.com>
	<57287A50.5020506@assyoma.it> <57288EB8.9020303@redhat.com>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <5728A481.6080600@assyoma.it>
Date: Tue, 3 May 2016 15:15:45 +0200
MIME-Version: 1.0
In-Reply-To: <57288EB8.9020303@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] thin handling of available space
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 03/05/2016 13:42, Zdenek Kabelac wrote:
>
> Danger with having 'disable' options like this is many distros do decide
> themselves about best defaults for their users, but Ubuntu with their
> issue_discards=1 shown us to be more careful as then it's not Ubuntu but
> lvm2 which is blamed for dataloss.
>
> Options are evaluated...
>

Very true. "Sane defaults" is one of the reason why I (happily) use 
RHEL/CentOS as hypervisors and other critical tasks.

>
>
> What's wrong with  'lvs'?
> This will give you the available space in thin-pool.
>

Oh, absolutely nothing wrong with lvs. I used "lsblk" only as an example 
of the block device/layer exposing some (lack of) features to upper layer.

One note about the continued "suggestion" to use BTRFS. While for 
relatively simple use case it can be ok, for more demanding 
(rewrite-heavy) scenarios (eg: hypervisor, database, ecc) it performs 
*really* bad, even when "nocow" is enabled.

I had much more fortune, performance wise, with ZFS. Too bad ZoL is an 
out-of-tree component (albeit very easy to install and, in my 
experience, quite stable also).

Anyway, ThinLVM + XFS is an extremely good combo in my opinion.

>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
