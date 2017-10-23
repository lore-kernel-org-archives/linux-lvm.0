Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 35CD85C578
	for <linux-lvm@redhat.com>; Mon, 23 Oct 2017 21:02:42 +0000 (UTC)
Received: from sonic307-9.consmr.mail.gq1.yahoo.com
	(sonic307-9.consmr.mail.gq1.yahoo.com [98.137.64.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D0474343395
	for <linux-lvm@redhat.com>; Mon, 23 Oct 2017 21:02:40 +0000 (UTC)
Date: Mon, 23 Oct 2017 21:02:35 +0000 (UTC)
From: matthew patton <pattonme@yahoo.com>
Message-ID: <1714773615.1945146.1508792555922@mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <1714773615.1945146.1508792555922.ref@mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

>On Mon, 10/23/17, John Stoffel <john@stoffel.org> wrote:

SSD pathologies aside, why are we concerned about the cache layer on a streaming read?

By definition the cache shouldn't be involved at all.
