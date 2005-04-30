Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3UFlmO00458
	for <linux-lvm@redhat.com>; Sat, 30 Apr 2005 11:47:48 -0400
Received: from postman.arcor.de (postman4.arcor-online.net [151.189.20.158])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j3UFleJU030689
	for <linux-lvm@redhat.com>; Sat, 30 Apr 2005 11:47:41 -0400
Received: from server.schwinge.homeip.net (p62.246.102.250.tisdip.tiscali.de
	[62.246.102.250]) (authenticated bits=0)
	by postman.arcor.de (8.13.0.PreAlpha4/8.13.0.PreAlpha4) with ESMTP id
	j3UFkICl011692
	for <linux-lvm@redhat.com>; Sat, 30 Apr 2005 17:47:39 +0200 (MEST)
Date: Sat, 30 Apr 2005 17:43:15 +0200
From: Thomas Schwinge <schwinge-lists-redhat.com-linux-lvm@nic-nac-project.de>
Subject: Re: [linux-lvm] swap on LVM
Message-ID: <20050430154315.GB806@bobby.schwinge.homeip.net>
References: <4270E3C4.1090408@nextra.ro> <4270ED4E.8090500@mikebabcock.ca>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4270ED4E.8090500@mikebabcock.ca>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Apr 28, 2005 at 10:03:36AM -0400, Michael T. Babcock wrote:
> Gergely Imre wrote:
> 
> >what about swap partitions on LVM? are there any known problems? can one
> >put swap on a LV safely?

I'd say so.

> I've had crashes directly attributable to Swap on LVM both LVM1 and LVM2.

I can't confirm that, as I've been using swap partitions on LVs on
several systems with both LVM1 and LVM2 for some years without problems.


Regards,
 Thomas
