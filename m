Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4HKTF011253
	for <linux-lvm@redhat.com>; Mon, 17 May 2004 16:29:15 -0400
Received: from chaos.ao.net (root@chaos.ao.net [208.5.40.6])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i4HKT9x7002912
	for <linux-lvm@redhat.com>; Mon, 17 May 2004 16:29:10 -0400
Received: from chaos.ao.net (harik@localhost [127.0.0.1])
	by chaos.ao.net (8.12.9/8.12.9/Debian-5) with ESMTP id i4HKT8uE006096
	for <linux-lvm@redhat.com>; Mon, 17 May 2004 16:29:08 -0400
Received: (from harik@localhost)
	by chaos.ao.net (8.12.9/8.12.9/Debian-5) id i4HKT8tg006095
	for linux-lvm@redhat.com; Mon, 17 May 2004 16:29:08 -0400
Date: Mon, 17 May 2004 16:29:08 -0400
From: Dan Merillat <dmerillat@sequiam.com>
Subject: Re: [linux-lvm] /boot on lvm?
Message-ID: <20040517202908.GB2216@chaos.ao.net>
References: <40A72846.5050801@mlug.missouri.edu> <22463-19176@sneakemail.com>
	<40A90413.905@ipax.tk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40A90413.905@ipax.tk>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 17 May 2004, raoul bhatia wrote:

> what about compiling these modules into your kernel, since they are an 
> integrated part of your setup?

You still have to vgscan; vgchange -ay in order to activate the volume
group, so that gets done in initrd.  Still, it's fairly painless.

--Dan
