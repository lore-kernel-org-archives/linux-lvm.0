Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q9GJHCn7015530
	for <linux-lvm@redhat.com>; Tue, 16 Oct 2012 15:17:12 -0400
Received: from smtp1.pacifier.net (smtp1.pacifier.net [64.255.237.171])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q9GJHB3X016019
	for <linux-lvm@redhat.com>; Tue, 16 Oct 2012 15:17:11 -0400
Received: from laptop.localnet (ip136.133.dsl-acs2.pdx.iinet.com
	[209.20.133.136])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp1.pacifier.net (Postfix) with ESMTPS id 2E8952CA03
	for <linux-lvm@redhat.com>; Tue, 16 Oct 2012 12:17:11 -0700 (PDT)
From: ben <benscott@nwlink.com>
Date: Tue, 16 Oct 2012 12:17:10 -0700
Message-ID: <6004025.KRaXd7Eq3X@laptop>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: [linux-lvm] thin pool grows but meta data does not?
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

Experimenting with thin pools I noticed that extending a thin pool doesn't 
seem to make the metadata larger. Is that the expected behavior?

Thank you.
