Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 63DF55D96F
	for <linux-lvm@redhat.com>; Tue, 24 Oct 2017 02:51:28 +0000 (UTC)
Received: from mail.stoffel.org (mail.stoffel.org [104.236.43.127])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 966D3C04AC59
	for <linux-lvm@redhat.com>; Tue, 24 Oct 2017 02:51:27 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <23022.43694.467077.542704@quad.stoffel.home>
Date: Mon, 23 Oct 2017 22:51:26 -0400
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <1714773615.1945146.1508792555922@mail.yahoo.com>
References: <1714773615.1945146.1508792555922.ref@mail.yahoo.com>
	<1714773615.1945146.1508792555922@mail.yahoo.com>
Subject: Re: [linux-lvm] cache on SSD makes system unresponsive
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
To: matthew patton <pattonme@yahoo.com>, LVM general discussion and development <linux-lvm@redhat.com>

>>>>> "matthew" == matthew patton <pattonme@yahoo.com> writes:

>> On Mon, 10/23/17, John Stoffel <john@stoffel.org> wrote:

matthew> SSD pathologies aside, why are we concerned about the cache
matthew> layer on a streaming read?

matthew> By definition the cache shouldn't be involved at all.

Because his system is going into OOM when doing this?  Yes, the cache
won't probably do anything for a streaming read, it needs to be
primed.  But when the system craps out... it cries out to be figured
out.
