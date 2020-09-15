Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 391F02156A23
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2020 22:15:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 070DE858283
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2020 22:15:44 +0000 (UTC)
Date: Tue, 15 Sep 2020 17:30:55 -0400 (EDT)
From: Stuart D Gathman <stuart@gathman.org>
In-Reply-To: <257A9B1C-04AC-4EDE-9671-9E7A60104F9F@gmail.com>
Message-ID: <alpine.LRH.2.23.451.2009151726030.32184@mail.gathman.org>
References: <2d496550-4609-0a26-489b-8721737c783b@redhat.com>
	<257A9B1C-04AC-4EDE-9671-9E7A60104F9F@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="-1203360521-2029954526-1600205455=:32184"
Subject: Re: [linux-lvm] lvm limitations
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Gionatan Danti <g.danti@assyoma.it>, Zdenek Kabelac <zkabelac@redhat.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1203360521-2029954526-1600205455=:32184
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.gathman.org id
	08FLUtCe008369

On Tue, 15 Sep 2020, Tomas Dalebj=C3=B6rk wrote:

> ok, lets say that I have 10 LV on a server, and want create a thin lv
> snapshot every hour and keep that for 30 days that would be 24h *
> 30days * 10lv =3D 720 lv

> if I want to keep snapshot copies from more nodes, to serve a single
> repository of snapshot copies, than these would easily become several
> hundred thousands of lv

> not sure if this is a good idea, but I guess it can be very useful in
> some sense as block level incremental forever and instant recovery can
> be implemented for open sourced based applications
>
> what reflections do you have on this idea?

My feeling is that btrfs is a better solution for the hourly snapshots.
(Unless you are testing a filesystem :-)

I find "classic" LVs a robust replacement for partitions that are easily
resized without moving data around.  I would be more likely to try
RAID features on classic LVs than thin LVs.
---1203360521-2029954526-1600205455=:32184--
