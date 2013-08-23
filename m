Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r7NMk0qA012560
	for <linux-lvm@redhat.com>; Fri, 23 Aug 2013 18:46:00 -0400
Received: from smtp3.pacifier.net (smtp3.pacifier.net [64.255.237.177])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r7NMjwaS018251
	for <linux-lvm@redhat.com>; Fri, 23 Aug 2013 18:45:59 -0400
Received: from bedroom.localnet (ip136.133.dsl-acs2.pdx.iinet.com
	[209.20.133.136])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: benscott@nwlink.com)
	by smtp3.pacifier.net (Postfix) with ESMTPSA id 1808138EA6
	for <linux-lvm@redhat.com>; Fri, 23 Aug 2013 15:45:58 -0700 (PDT)
From: ben <benscott@nwlink.com>
Date: Fri, 23 Aug 2013 15:45:37 -0700
Message-ID: <5182102.mBdGx9EggG@bedroom>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: [linux-lvm] liblvm2app values for  lvm_errno
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
To: linux-lvm@redhat.com

Is there a list of the values that should be returned by lvm_errno() in 
liblvm2app? When I try to open a clustered volume group outside the cluster it 
simply returns -1.

thank you.
