Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7JBqFEw003826
	for <linux-lvm@redhat.com>; Tue, 19 Aug 2014 07:52:15 -0400
Received: from mail.fibbs.org (phineas.fibbs.org [109.234.106.32])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7JBqC02001677
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL)
	for <linux-lvm@redhat.com>; Tue, 19 Aug 2014 07:52:13 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.fibbs.org (Postfix) with ESMTP id 750B020042D
	for <linux-lvm@redhat.com>; Tue, 19 Aug 2014 13:52:11 +0200 (CEST)
Received: from mail.fibbs.org ([127.0.0.1])
	by localhost (mail.fibbs.org [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id fQYQV3zkP17Q for <linux-lvm@redhat.com>;
	Tue, 19 Aug 2014 13:52:11 +0200 (CEST)
Received: from [192.168.2.115] (p50895A6F.dip0.t-ipconnect.de [80.137.90.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
	bits)) (Client did not present a certificate)
	by mail.fibbs.org (Postfix) with ESMTPSA id A241520041F
	for <linux-lvm@redhat.com>; Tue, 19 Aug 2014 13:52:10 +0200 (CEST)
Message-ID: <53F33A68.2050203@mglug.de>
Date: Tue, 19 Aug 2014 13:52:08 +0200
From: Oliver Rath <rath@mglug.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Szenario for lvmetad
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

Hi list,

does it make sense to use lvmetad in one pc with 4 disks, which are used
for lvm? Are the metadata cached in a non-lvmetad environment?

Tfh!
Oliver
