Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oB831FdM000326
	for <linux-lvm@redhat.com>; Tue, 7 Dec 2010 22:01:15 -0500
Received: from smtp1.pacifier.net (smtp1.pacifier.net [64.255.237.171])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oB8315WU031175
	for <linux-lvm@redhat.com>; Tue, 7 Dec 2010 22:01:06 -0500
Received: from laptop.localnet (ip136.133.dsl-acs2.pdx.iinet.com
	[209.20.133.136])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: benscott@nwlink.com)
	by smtp1.pacifier.net (Postfix) with ESMTP id 26D486EF47
	for <linux-lvm@redhat.com>; Tue,  7 Dec 2010 19:01:03 -0800 (PST)
From: ben <benscott@nwlink.com>
Date: Tue, 7 Dec 2010 19:01:01 -0800
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <201012071901.01998.benscott@nwlink.com>
Subject: [linux-lvm] lv segment "devices" property?
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
Content-Type: Text/Plain; charset="us-ascii"
To: linux-lvm@redhat.com

Is there any plan to add the lvm2app get property "devices" function for 
logical volume segments?

ie:   value = lvm_lvseg_get_property(lvm_lvseg, "devices");

Thank you.
benscott@nwlink.com
 
