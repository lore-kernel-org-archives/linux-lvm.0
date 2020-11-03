Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E762A205F387
	for <linux-lvm@redhat.com>; Tue,  3 Nov 2020 08:51:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DF0A811E79
	for <linux-lvm@redhat.com>; Tue,  3 Nov 2020 08:51:29 +0000 (UTC)
From: Annamalai Gurusami <annamalai.gurusami@oracle.com>
References: <87362fg62i.fsf@oracle.com>
	<24457.45991.672260.342062@quad.stoffel.home>
Date: Tue, 03 Nov 2020 14:19:15 +0530
In-Reply-To: <24457.45991.672260.342062@quad.stoffel.home> (John Stoffel's
	message of "Fri, 16 Oct 2020 10:52:23 -0400")
Message-ID: <87wnz2akqc.fsf@oracle.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Identifying Unused VG
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
Content-Transfer-Encoding: 7bit
To: John Stoffel <john@stoffel.org>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

"John Stoffel" <john@stoffel.org> writes:

> Looking at your 'lsblk' output, I suspect you can remove drive sda,
> the Seagate.  So I'd probably try to shutdown cleanly, then remove
> that drive and boot up again.

Finally I was able to spend sometime doing this.  And you are correct.
I shutdown the computer and removed the Seagate HDD and started the
computer.  Everything went smooth.

Thanks for helping me.

Rgds,
anna
