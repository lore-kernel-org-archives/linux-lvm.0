Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 070018BE39
	for <linux-lvm@redhat.com>; Wed, 12 Jun 2019 04:18:31 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A952A2F8BD5
	for <linux-lvm@redhat.com>; Wed, 12 Jun 2019 04:18:12 +0000 (UTC)
MIME-Version: 1.0
Message-ID: <trinity-fec29f23-aa03-442b-b6d6-84dece8ba273-1560313085888@3c-app-gmx-bs14>
From: "Steve Keller" <keller.steve@gmx.de>
Date: Wed, 12 Jun 2019 06:18:05 +0200
Subject: [linux-lvm] Question on vgconvert
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I want to convert from LVM1 to LVM2 using vgconvert on a server.  Is
vgconvert -M2 <vg-name> considered a risky operation?  Should I switch
the server into single-user mode and make a backup before running
vgconvert?

And will vgconvert take a long time?  May PEs be moved on the disk or
is only the meta-data rewritten?

Steve
