Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r1JDxotO014141
	for <linux-lvm@redhat.com>; Tue, 19 Feb 2013 08:59:50 -0500
Received: from jajo.eggsoft.pl (eggsoft.sp.imz.pl [212.106.158.142])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r1JDxi9X015983
	for <linux-lvm@redhat.com>; Tue, 19 Feb 2013 08:59:44 -0500
Received: from jajo.eggsoft (localhost [127.0.0.1])
	by jajo.eggsoft.pl (Postfix) with ESMTP id 8C119B002
	for <linux-lvm@redhat.com>; Tue, 19 Feb 2013 14:59:41 +0100 (CET)
Date: Tue, 19 Feb 2013 14:59:40 +0100
From: Jacek Konieczny <jajcus@jajcus.net>
Message-ID: <20130219145940.411cd271@jajo.eggsoft>
In-Reply-To: <51238003.3050709@pse-consulting.de>
References: <51238003.3050709@pse-consulting.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] resize and snapshots with clvm
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
To: linux-lvm@redhat.com

On Tue, 19 Feb 2013 14:37:07 +0100
Andreas Pflug <pgadmin@pse-consulting.de> wrote:
> 
> What I'm missing is the possibility to resize a LV or taking a
> snapshot of it while a volume is used on one node. I'd expect this to
> work on the active node, if the volume is inactive on all other
> nodes.

I can confirm this works.

> But when I try that, I get
> cluster request failed: Invalid argument
>    Failed to suspend <logvol>

Are you sure you have the volume activated _exclusively_ on the single
node.
'is used on one node' doesn't mean much when any other node is allowed
to activate the volume at any time.

When the LV is exclusively activated (lvchange -aey) snapshots should
work (and they do work for me).

Greets,
	Jacek
