Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4GE5q022706
	for <linux-lvm@redhat.com>; Sun, 16 May 2004 10:05:52 -0400
Received: from outmta-1.esr.lvcm.net (outmta-1.esr.lvcm.net [24.234.0.14])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i4GE5k8K027904
	for <linux-lvm@redhat.com>; Sun, 16 May 2004 10:05:46 -0400
Received: from localhost (localhost [127.0.0.1])
	by outmta-1.esr.lvcm.net (Postfix) with ESMTP id B832924073
	for <linux-lvm@redhat.com>; Sun, 16 May 2004 07:07:12 -0700 (PDT)
Received: from outmta-1.esr.lvcm.net ([127.0.0.1])
	by localhost (outmta-1.esr.lvcm.net [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 05406-15 for <linux-lvm@redhat.com>;
	Sun, 16 May 2004 07:07:12 -0700 (PDT)
Received: from mlug.missouri.edu (ip68-104-28-32.lv.lv.cox.net [68.104.28.32])
	by outmta-1.esr.lvcm.net (Postfix) with ESMTP id 5D00124006
	for <linux-lvm@redhat.com>; Sun, 16 May 2004 07:07:12 -0700 (PDT)
Message-ID: <40A77537.20107@mlug.missouri.edu>
Date: Sun, 16 May 2004 07:05:43 -0700
From: Michael <mogmios@mlug.missouri.edu>
MIME-Version: 1.0
Subject: Re: [linux-lvm] /boot on lvm?
References: <40A72846.5050801@mlug.missouri.edu>
	<1084705130.3126.2.camel@localhost>
In-Reply-To: <1084705130.3126.2.camel@localhost>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>


>I run everything on LVM except for /boot, primarily because I use GRUB
>as a bootloader and it doesn't understand LVM volumes. As long as your
>bootloader understands LVM volumes there should be no problem with it.
>  
>
I use Lilo. Does Lilo understand LVM volumes?
