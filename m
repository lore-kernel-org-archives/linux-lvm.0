Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A87F75C3FA
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2017 21:14:44 +0000 (UTC)
Received: from sonic305-48.consmr.mail.gq1.yahoo.com
	(sonic305-48.consmr.mail.gq1.yahoo.com [98.137.64.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C6DA1A850
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2017 21:14:43 +0000 (UTC)
Date: Mon, 18 Sep 2017 21:10:42 +0000 (UTC)
From: matthew patton <pattonme@yahoo.com>
Message-ID: <603627203.4607722.1505769042298@mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <603627203.4607722.1505769042298.ref@mail.yahoo.com>
Subject: Re: [linux-lvm] Option to silence "WARNING: Sum of all thin volume
 sizes exceeds the size of thin pool"
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

 > So, any changes to disable the warning at least when taking snapshots?
> https://bugzilla.redhat.com/show_bug.cgi?id=1465974
 
If the warnings are not being emitted to STDERR then that needs to be fixed right off the bat.

'lvs -q blah' should squash any warnings.
'lvcreate' frankly shouldn't output anything unless invoked with '-v' anyway. So therefore '-q' should also squash warnings.

I suspect a wholesale cleanup of the way LVM does logging will suffice to fix the gratuitous and unnecessary output.
