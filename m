Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l62KOpbZ021981
	for <linux-lvm@redhat.com>; Mon, 2 Jul 2007 16:24:52 -0400
Received: from carpentier.vpsland.com (carpentier.vpsland.com [207.210.113.97])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l62KOoZF020621
	for <linux-lvm@redhat.com>; Mon, 2 Jul 2007 16:24:50 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by carpentier.vpsland.com (Postfix) with ESMTP id C217E181C2
	for <linux-lvm@redhat.com>; Mon,  2 Jul 2007 22:24:48 +0200 (CEST)
Received: from carpentier.vpsland.com ([127.0.0.1])
	by localhost (carpentier.vpsland.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id DXdiht5wqh5o for <linux-lvm@redhat.com>;
	Mon,  2 Jul 2007 22:24:27 +0200 (CEST)
Received: from soetens.vdberg.org (h8441201224.dsl.speedlinq.nl
	[84.41.201.224])
	by carpentier.vpsland.com (Postfix) with ESMTP id EDE26181BD
	for <linux-lvm@redhat.com>; Mon,  2 Jul 2007 22:24:24 +0200 (CEST)
Received: from [192.168.0.34] (h8441201224.dsl.speedlinq.nl [84.41.201.224])
	by soetens.vdberg.org (Postfix) with ESMTP id C00F814C515
	for <linux-lvm@redhat.com>; Mon,  2 Jul 2007 22:24:24 +0200 (CEST)
Message-ID: <46895EF8.6090702@vdberg.org>
Date: Mon, 02 Jul 2007 22:24:24 +0200
From: Richard van den Berg <richard@vdberg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] some questions
References: <e55f48520707021203w1cfe21f3qb7f91f2b093508a2@mail.gmail.com>
In-Reply-To: <e55f48520707021203w1cfe21f3qb7f91f2b093508a2@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

Andr=EF=BF=BDs Ghigliazza wrote:
> - Several times, I had to recover data from hard disks without LVM; in
> those cases, I boot with a live GNU/Linux CD, mount the partitions,
> and copy the files. Can this be done with disks with LVM?, how?, which
> live CD do you recommend for this task?.

Personally I recommend systemrescuecd from http://www.sysresccd.org/ It
comes with lvm2 and all other tools I've ever needed to recover a system.

Sincerely,

Richard van den Berg
