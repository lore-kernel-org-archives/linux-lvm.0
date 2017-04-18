Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F4BB784A2
	for <linux-lvm@redhat.com>; Tue, 18 Apr 2017 13:23:55 +0000 (UTC)
Received: from mr002msb.fastweb.it (mr002msb.fastweb.it [85.18.95.86])
	by mx1.redhat.com (Postfix) with ESMTP id 7B396811A7
	for <linux-lvm@redhat.com>; Tue, 18 Apr 2017 13:23:52 +0000 (UTC)
Received: from ceres.assyoma.it (93.63.55.57) by mr002msb.fastweb.it
	(8.5.140.05) id 58E21DDC00A11FE7 for linux-lvm@redhat.com;
	Tue, 18 Apr 2017 15:23:51 +0200
Received: from gdanti-laptop.assyoma.it (unknown [172.31.255.5])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ceres.assyoma.it (Postfix) with ESMTPSA id D3A0F281C9B
	for <linux-lvm@redhat.com>; Tue, 18 Apr 2017 15:23:50 +0200 (CEST)
References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<CALm7yL2N1Gs+ry+vkJucuYxXeGua3LpWCR+CEy_Zdgq-w-A3ag@mail.gmail.com>
	<fe625ba1be451139dd871982a24fb9ba@assyoma.it>
	<58E7992A.4030000@tlinx.org>
	<dc7ab70743a92705e6be6fefab2d29d0@assyoma.it>
	<ece5d455-87e7-5d7c-18a4-a51355f28307@gathman.org>
	<062fccc39afe128ef5950634309a01ea@assyoma.it>
	<783965ccb392bea2faded10436cdaf39@xenhideout.nl>
	<0658b33a7d4e5494de71231b7343a514@assyoma.it>
	<88a2badd9b77546407bba31778c00699@xenhideout.nl>
	<341979ccda1b2ee7cb5242006f1b03c8@assyoma.it>
	<9b5cd79f258fbb79b7d7e213970b1ae2@xenhideout.nl>
	<e88f9168-7426-f0d8-1e97-77ce36b3ffd2@redhat.com>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <a371d42c-cba5-1124-53c3-133cdb940cbd@assyoma.it>
Date: Tue, 18 Apr 2017 15:23:50 +0200
MIME-Version: 1.0
In-Reply-To: <e88f9168-7426-f0d8-1e97-77ce36b3ffd2@redhat.com>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 18/04/2017 12:17, Zdenek Kabelac wrote:
> Unmount of thin-pool has been dropped from upstream version >169.
> It's now delegated to user script executed on % checkpoints
> (see 'man dmeventd')

Hi Zdenek,
I missed that; thanks.

Any thoughts on the original question? For snapshot with relatively big 
CoW table, from a stability standpoint, how do you feel about classical 
vs thin-pool snapshot?

Regards.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
