Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id rBFKtxNL031803
	for <linux-lvm@redhat.com>; Sun, 15 Dec 2013 15:55:59 -0500
Received: from homiemail-a57.g.dreamhost.com (caibbdcaaaaf.dreamhost.com
	[208.113.200.5])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rBFKtwao004887
	for <linux-lvm@redhat.com>; Sun, 15 Dec 2013 15:55:58 -0500
Received: from homiemail-a57.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a57.g.dreamhost.com (Postfix) with ESMTP id 28EE3208063
	for <linux-lvm@redhat.com>; Sun, 15 Dec 2013 12:55:58 -0800 (PST)
Received: from [127.0.0.1] (unknown [159.63.145.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: tanstaafl@libertytrek.org)
	by homiemail-a57.g.dreamhost.com (Postfix) with ESMTPSA id 0CC32208058
	for <linux-lvm@redhat.com>; Sun, 15 Dec 2013 12:55:57 -0800 (PST)
Message-ID: <52AE1740.2060501@libertytrek.org>
Date: Sun, 15 Dec 2013 15:55:28 -0500
From: Tanstaafl <tanstaafl@libertytrek.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] How to tell if thin provisioning is used?
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
To: linux-lvm@redhat.com

Hello,

Is there a way to tell if thin-provisioning is being used on a given 
volume group?

Thanks
