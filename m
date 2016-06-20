Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5KKqYeN003913
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2016 16:52:34 -0400
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	(using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 05A4A7F6B6
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2016 20:52:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5KKqWIl017166
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2016 13:52:32 -0700 (PDT)
Message-ID: <5768578E.2010608@windriver.com>
Date: Mon, 20 Jun 2016 14:52:30 -0600
From: Chris Friesen <chris.friesen@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] what creates the symlinks in /dev/<volgroup> ?
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

Hi,

Can someone tell me what creates the /dev/<volgroup>/<volume symlinks?  Is this 
LVM or udev (and if udev, do you know which rule)?

I'm seeing some interesting behaviour where if I create a thin pool it creates a 
symlink for the pool, but once I create a thin volume within the pool then the 
pool symlink disappears.

Thanks,
Chris
