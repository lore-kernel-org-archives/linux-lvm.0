Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q3OCNhEn030795
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2012 08:23:43 -0400
Received: from smtp2-1.tng.de (smtp2-1.tng.de [213.178.66.95])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q3OCNdKY009733
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2012 08:23:40 -0400
Received: from smtp2-2.tng.de (smtp2-2.tng.de [213.178.66.96])
	by smtp2-1.tng.de (Postfix) with ESMTP id D2B5274001
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2012 14:23:36 +0200 (CEST)
Received: from smtp.tng.de (proxy01.mailcluster.tng.de [82.97.146.15])
	by smtp2-2.tng.de (Postfix) with ESMTP id CD0709C0BB
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2012 14:23:36 +0200 (CEST)
Received: from [213.178.67.139] (myrmidia.tng.de [213.178.67.139])
	by smtp.tng.de (Postfix) with ESMTPSA id C75E220DBF
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2012 14:23:36 +0200 (CEST)
Message-ID: <4F969B43.2080504@ki.tng.de>
Date: Tue, 24 Apr 2012 14:23:31 +0200
From: Jan-Hendrik Palic <billgotchy@ki.tng.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] calculating size of metadata.
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

Hi there,

we planning to create a pv and vg on a 19,95TB partition running on 
raid6. One issue I have is the size of the metadata. I am looking for a 
way to calculate the this size, but unfortunatly, I cannot find a some.
Which size should I use?

Thanks in advance.

Jan
