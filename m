Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C10E60BEB
	for <linux-lvm@redhat.com>; Sat, 21 Oct 2017 16:08:46 +0000 (UTC)
Received: from sonic316-8.consmr.mail.gq1.yahoo.com
	(sonic316-8.consmr.mail.gq1.yahoo.com [98.137.69.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 106F3369C4
	for <linux-lvm@redhat.com>; Sat, 21 Oct 2017 16:08:46 +0000 (UTC)
Date: Sat, 21 Oct 2017 16:08:42 +0000 (UTC)
From: matthew patton <pattonme@yahoo.com>
Message-ID: <1540708205.1077645.1508602122091@mail.yahoo.com>
MIME-Version: 1.0
References: <1540708205.1077645.1508602122091.ref@mail.yahoo.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] cache on SSD makes system unresponsive
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
Content-Type: text/plain; charset="utf-8"
To: Mike Snitzer <snitzer@redhat.com>, Oleg Cherkasov <o1e9@member.fsf.org>, LVM general discussion and development <linux-lvm@redhat.com>
Cc: ejt@redhat.com

>  But if it's something that only exhibits in writeback mode rather than writethrough, then I'd guess it's to do with the
> list of writeback work that the policy builds.  So check

OP is being coy about the DD command but I saw it mentioned off-hand earlier.

dd if=/250GB_file/on_LVM/H800_vdev of=/dev/null

It's a pure, streaming read. LVM cache should be doing absolutely nothing.


 
