Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p27E20EY001594
	for <linux-lvm@redhat.com>; Mon, 7 Mar 2011 09:02:00 -0500
Received: from eastrmfepo202.cox.net (eastrmfepo202.cox.net [68.230.241.217])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p27E1oJa021486
	for <linux-lvm@redhat.com>; Mon, 7 Mar 2011 09:01:50 -0500
Received: from eastrmimpo01.cox.net ([68.1.16.119]) by eastrmfepo202.cox.net
	(InterMail vM.8.01.04.00 201-2260-137-20101110) with ESMTP id
	<20110307140149.KBOE32466.eastrmfepo202.cox.net@eastrmimpo01.cox.net>
	for <linux-lvm@redhat.com>; Mon, 7 Mar 2011 09:01:49 -0500
Message-ID: <4D74E580.4010201@cox.net>
Date: Mon, 07 Mar 2011 09:02:40 -0500
From: "Clyde E. Kunkel" <rascal.jumper-747@cox.net>
MIME-Version: 1.0
References: <4D6EDD66.3070901@cox.net>
In-Reply-To: <4D6EDD66.3070901@cox.net>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvm2-monitor slow shutdown
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 03/02/2011 07:14 PM, Clyde E. Kunkel wrote:
> On Rawhide and Fedora 15 systems with one lv snapshot, shutdown/reboot
> hangs for about a minute waiting for lvm2-monitor to shutdown. I see
> msgs that lvm2-monitor.service process exited, code=exited status=1, and
> msgs that the there are still devices being monitored and a msg that lvm
> is "Refusing to exit."
>
> I can disable the service with systemd and shutdown/reboot proceeds in a
> more expected rapid manner.
>
> Is this normal?
>
>

Anyone else seeing this.  Please, is this expected behavior?

-- 
Regards,
OldFart
