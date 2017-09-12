Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 934AC62662
	for <linux-lvm@redhat.com>; Tue, 12 Sep 2017 13:51:12 +0000 (UTC)
Received: from nm4-vm2.bullet.mail.gq1.yahoo.com
	(nm4-vm2.bullet.mail.gq1.yahoo.com [98.136.218.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E7D1CC0587EE
	for <linux-lvm@redhat.com>; Tue, 12 Sep 2017 13:51:11 +0000 (UTC)
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Message-ID: <20170912135110.5718104.351.1089@yahoo.com>
Date: Tue, 12 Sep 2017 09:51:10 -0400
From: pattonme@yahoo.com
In-Reply-To: <f82cf9e82a9ecb2e4465a469219c53af@xenhideout.nl>
References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<0c6c96790329aec2e75505eaf544bade@assyoma.it>
	<8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
	<872ad7be3b36e2eb0afc080fa781d84d@assyoma.it>
	<e580b78b-0aaa-d075-5009-278d26823a7c@redhat.com>
	<e3bc609f-a1fd-e2e8-e431-4820cd9f9487@assyoma.it>
	<b51c8dfd-bdd0-2e38-cc47-bef358bbc8e6@redhat.com>
	<f82cf9e82a9ecb2e4465a469219c53af@xenhideout.nl>
Content-Transfer-Encoding: 8bit
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
To: Xen <linux-lvm@redhat.com>

Is this the same xen? Because that was an actually intelligent and logical response. But like was the case a year ago there is no data or state sharing between the fs and LVM block so what you want is not possible and will never see the light of day. Use ZFS or btrfs or something else. Full stop.
