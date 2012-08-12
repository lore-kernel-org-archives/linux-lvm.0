Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q7CDXYrj012845
	for <linux-lvm@redhat.com>; Sun, 12 Aug 2012 09:33:35 -0400
Received: from mx1.internecto.net (polaris.internecto.net [176.9.245.29])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q7CDXWXY001509
	for <linux-lvm@redhat.com>; Sun, 12 Aug 2012 09:33:33 -0400
Received: from localhost (localhost [127.0.0.1])
	by mx1.internecto.net (Postfix) with ESMTP id 4191DA02F2
	for <linux-lvm@redhat.com>; Sun, 12 Aug 2012 13:33:30 +0000 (UTC)
Received: from mx1.internecto.net ([127.0.0.1])
	by localhost (mail.polaris.internecto.net [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id KUXUleqsE0ij for <linux-lvm@redhat.com>;
	Sun, 12 Aug 2012 13:33:29 +0000 (UTC)
Received: from internecto.net (5ED4FDEB.cm-7-5d.dynamic.ziggo.nl
	[94.212.253.235])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(Client did not present a certificate)
	(Authenticated sender: lists@internecto.net)
	by mx1.internecto.net (Postfix) with ESMTPSA id BB89FA02EA
	for <linux-lvm@redhat.com>; Sun, 12 Aug 2012 13:33:29 +0000 (UTC)
Date: Sun, 12 Aug 2012 15:33:28 +0200
From: Mark van Dijk <lists+linux-lvm@internecto.net>
Message-ID: <20120812153328.67fc22ec@internecto.net>
In-Reply-To: <20120807140034.51bcd7af@internecto.net>
References: <20120807140034.51bcd7af@internecto.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Getting 'incorrect semaphore state' on self
 configured server kernel
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

> # lvcreate -L100M -n foobar -v array 
> /dev/array/foobar: not found: device not cleared
> Aborting. Failed to wipe start of new LV.
> semid 983040: semop failed for cookie 0xd4d19ee: incorrect semaphore
> state Failed to set a proper state for notification semaphore
> identified by cookie value 223156718 (0xd4d19ee) to initialize waiting
> for incoming notifications.
> 
> I appreciate all help I can get.
> 

I still haven't solved this.. who is willing to lend me a hand please?
