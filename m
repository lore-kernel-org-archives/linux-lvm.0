Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8NA9FpJ032549
	for <linux-lvm@redhat.com>; Tue, 23 Sep 2008 06:09:15 -0400
Received: from smtp2.versatel.nl (smtp2.versatel.nl [62.58.50.89])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m8NA9Dpk003396
	for <linux-lvm@redhat.com>; Tue, 23 Sep 2008 06:09:13 -0400
Received: from [192.168.1.18] (unknown [80.101.105.201])
	by mail.vermeer.tv (Postfix) with ESMTPSA id 5318F26F1BB
	for <linux-lvm@redhat.com>; Tue, 23 Sep 2008 12:08:05 +0200 (CEST)
Subject: Re: [linux-lvm] Remove PV from VG
From: Koen Vermeer <koen@vermeer.tv>
In-Reply-To: <1222163256.9690.17.camel@koenws.oogziekenhuis.lan>
References: <1222163256.9690.17.camel@koenws.oogziekenhuis.lan>
Date: Tue, 23 Sep 2008 12:09:10 +0200
Message-Id: <1222164550.9690.20.camel@koenws.oogziekenhuis.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 2008-09-23 at 11:47 +0200, Koen Vermeer wrote:
> How can I tell LVM to free a specific PV within a VG? Alternatively, I
> could move all LVs in the VG to the other PV, but again, I don't know
> how.

Note to myself: Look at pvmove.

I was looking at the wrong level: I expected it to be a VG-command, or
alternatively a LV-command, but not a PV-command. Apologies for the
noise!

Koen
