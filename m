Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 354C8171D3
	for <linux-lvm@redhat.com>; Tue, 19 Sep 2017 14:35:06 +0000 (UTC)
Received: from sonic302-21.consmr.mail.gq1.yahoo.com
	(sonic302-21.consmr.mail.gq1.yahoo.com [98.137.68.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8D6F480476
	for <linux-lvm@redhat.com>; Tue, 19 Sep 2017 14:35:00 +0000 (UTC)
Date: Tue, 19 Sep 2017 14:34:57 +0000 (UTC)
From: matthew patton <pattonme@yahoo.com>
Message-ID: <1118221441.5105826.1505831697387@mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <1118221441.5105826.1505831697387.ref@mail.yahoo.com>
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
To: linux-lvm@redhat.com

LVM and thin in particular is not for noobies or novices. If they get burned then they deserve it for using a technology they didn't bother to study and learn about beforehand. I think the warnings are gratuitous. Just like some of the other output that LVM emits like "create succeeded". Create succeeded is indicated by a 0 return code. Anything else is just noise. If the user wants noise, then need to use the '-v|--verbose' flag. 

I don't think it's a bad idea to have 'LVM_SUPPRESS_WARNINGS=1' in lvm.conf. 

The broader problem is LVM is entirely too chatty and every emitted message needs to be properly examined and assigned to 'verbose', 'debug', and 'normal' and likewise if it should be squelched via 'quiet' or 'double quiet'.

Commands that do listings is IMO the only place where warnings should show up, again subject to 'quiet' and the triggering threshold.
