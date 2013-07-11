Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r6B07VJG021917
	for <linux-lvm@redhat.com>; Wed, 10 Jul 2013 20:07:31 -0400
Received: from mailserver (75-145-250-211-Connecticut.hfc.comcastbusiness.net
	[75.145.250.211])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r6B07Ub8017154
	for <linux-lvm@redhat.com>; Wed, 10 Jul 2013 20:07:30 -0400
Received: from localhost (localhost [127.0.0.1])
	by mailserver (Postfix) with ESMTP id 89A363F3E1
	for <linux-lvm@redhat.com>; Wed, 10 Jul 2013 20:12:20 -0400 (EDT)
Received: from mailserver ([127.0.0.1])
	by localhost (mail.mohawksoft.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zPF2ZX7fTXoK for <linux-lvm@redhat.com>;
	Wed, 10 Jul 2013 20:12:19 -0400 (EDT)
Received: from mail.mohawksoft.com (localhost [127.0.0.1])
	by mailserver (Postfix) with ESMTP id 6D6683F3DF
	for <linux-lvm@redhat.com>; Wed, 10 Jul 2013 20:12:19 -0400 (EDT)
Message-ID: <13d9860ff7a6b54efeecea353ecd6b98.squirrel@mail.mohawksoft.com>
Date: Wed, 10 Jul 2013 20:12:19 -0400
From: markw@mohawksoft.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Building thin-provisioning tools > 1.4 on RHEL 6.4
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This is half request half rant.

Is there a way to compile the latest thin-provisioning tools on RHEL 6.4?
The introduction of C++11 and Boost currently makes this impossible with
standard development tool chain in the release.

Are there any plans to support the RHEL tool chain? I dread building a new
gcc and all that involves.
