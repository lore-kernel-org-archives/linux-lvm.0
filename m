Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 88C565D9CD
	for <linux-lvm@redhat.com>; Mon, 19 Nov 2018 14:04:51 +0000 (UTC)
Received: from sonic306-3.consmr.mail.bf2.yahoo.com
	(sonic306-3.consmr.mail.bf2.yahoo.com [74.6.132.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B579E308FBA0
	for <linux-lvm@redhat.com>; Mon, 19 Nov 2018 14:04:50 +0000 (UTC)
Date: Mon, 19 Nov 2018 14:04:46 +0000 (UTC)
From: matthew patton <pattonme@yahoo.com>
Message-ID: <1044845531.2858991.1542636286779@mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <1044845531.2858991.1542636286779.ref@mail.yahoo.com>
Subject: Re: [linux-lvm] lvcreate from a setuid-root binary
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

> program calls getpwuid() with the real user id of the calling user 

maybe I missed a critical post explaining why it has to be, but that's a job for a trivial sudo specification line.

I can't think of any reason why sudo is not the answer to your problem, or frankly isn't always the answer.
