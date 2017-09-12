Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF71969509
	for <linux-lvm@redhat.com>; Tue, 12 Sep 2017 23:25:00 +0000 (UTC)
Received: from sonic301-22.consmr.mail.gq1.yahoo.com
	(sonic301-22.consmr.mail.gq1.yahoo.com [98.137.64.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 057A113AAE
	for <linux-lvm@redhat.com>; Tue, 12 Sep 2017 23:25:00 +0000 (UTC)
Date: Tue, 12 Sep 2017 23:24:56 +0000 (UTC)
From: matthew patton <pattonme@yahoo.com>
Message-ID: <691633892.829188.1505258696384@mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <691633892.829188.1505258696384.ref@mail.yahoo.com>
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
Reply-To: matthew patton <pattonme@yahoo.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

> True, with a catch: with the default data=ordered option, even ext4 does 
> *not* remount read only when data writeout fails. You need to use
> both  "errors=remount-ro" and "data=journal" which basically nobody uses.
 
Then you need to hang out with people who actually do storage for a living.
