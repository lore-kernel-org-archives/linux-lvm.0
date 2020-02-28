Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A4992026D69
	for <linux-lvm@redhat.com>; Fri, 28 Feb 2020 02:39:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 674E08007A4
	for <linux-lvm@redhat.com>; Fri, 28 Feb 2020 02:39:45 +0000 (UTC)
Received: FROM m9a0014g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0014g.houston.softwaregrp.com WITH ESMTP FOR linux-lvm@redhat.com;
	Fri, 28 Feb 2020 02:39:01 +0000
From: "heming.zhao@suse.com" <heming.zhao@suse.com>
Message-ID: <4c4417e5-0996-1385-1562-b3dceb94cd57@suse.com>
Date: Fri, 28 Feb 2020 10:37:33 +0800
Content-Language: en-US
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] stable-2.02 missing patch files for lib/device/bcache.c
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hello lvm team,

below 2 patches of stable-2.02 for lib/device/bcache.c are missing:
7550665ba49ac7d497d5b212e14b69298ef01361
36523a398d50381f8355e719b98c3ce584b81a23

They were overwriten by Joe Thornber recent bug fix.
Please re-apply them. Thank you.
