Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 468F85C57B
	for <linux-lvm@redhat.com>; Mon, 19 Nov 2018 16:05:21 +0000 (UTC)
Received: from sonic301-4.consmr.mail.bf2.yahoo.com
	(sonic301-4.consmr.mail.bf2.yahoo.com [74.6.129.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5B995308FB95
	for <linux-lvm@redhat.com>; Mon, 19 Nov 2018 16:05:16 +0000 (UTC)
Date: Mon, 19 Nov 2018 16:05:14 +0000 (UTC)
From: matthew patton <pattonme@yahoo.com>
Message-ID: <1479542688.2901829.1542643514135@mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <1479542688.2901829.1542643514135.ref@mail.yahoo.com>
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

http://linux-pam.org/Linux-PAM-html/sag-pam_exec.html

I would further assume pam_exec ignores SUID bit on binaries either because of a bug or deliberately because there is no good reason to ever do that.
