Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k12L8c123508
	for <linux-lvm@redhat.com>; Thu, 2 Feb 2006 16:08:38 -0500
Received: from uproxy.gmail.com (uproxy.gmail.com [66.249.92.199])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k12L8SMc014121
	for <linux-lvm@redhat.com>; Thu, 2 Feb 2006 16:08:28 -0500
Received: by uproxy.gmail.com with SMTP id q2so50554uge
	for <linux-lvm@redhat.com>; Thu, 02 Feb 2006 13:08:27 -0800 (PST)
Message-ID: <7cce3190602021308n184bcc43m@mail.gmail.com>
Date: Thu, 2 Feb 2006 22:08:27 +0100
From: =?ISO-8859-1?Q?Javier_de_Miguel_Rodr=EDguez?= <javier.miguel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Question about hardware LVM
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
To: linux-lvm@redhat.com

Hello

I have been successfully using LVM on RedHat Linux Server with no
hassle. We are now deploying a $BIGVENDOR expensive FiberChannel SAN.
One of the main features of this SAN is that is able to grow a
filesystem

How does Linux handle this? Do I still have to use LVM? If I still
have to use LVM I do NOT see the point of "hardware base growing".
Simply, create a new LUN in the SAN and I can join to our LVM setup.

Maybe this is a "Storage 101" questio, but I do not fully understand
expensive SAN "hardware based"  filesystem grow.

Thank you in advance
