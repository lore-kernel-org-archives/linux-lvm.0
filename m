Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p6H5TsdZ013674
	for <linux-lvm@redhat.com>; Sun, 17 Jul 2011 01:29:54 -0400
Received: from new-smtp01.pacifier.net (new-smtp01.pacifier.net
	[64.255.237.177])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6H5Tr3k005926
	for <linux-lvm@redhat.com>; Sun, 17 Jul 2011 01:29:53 -0400
Received: from laptop.localnet (ip136.133.dsl-acs2.pdx.iinet.com
	[209.20.133.136])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: benscott@nwlink.com)
	by new-smtp01.pacifier.net (Postfix) with ESMTPSA id 66C5C2CA24
	for <linux-lvm@redhat.com>; Sat, 16 Jul 2011 22:29:53 -0700 (PDT)
From: ben <benscott@nwlink.com>
Date: Sat, 16 Jul 2011 22:29:33 -0700
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <201107162229.33740.benscott@nwlink.com>
Subject: [linux-lvm] lvconvert --merge bug
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

I was playing with snapshot merging a discovered a problem. If a snap starts 
out as invalid the merge command starts merging and then quits. That leaves 
the snap in a strange condition. It is listed as merging even though the merge 
failed. It also becomes tricky to delete the invalid snap. It would seem 
better if the merge command checked the validity first. 

I also have a question. The error message from lvconvert suggests that the 
snap might become invalid <during>  the merge. If that happens does the origin 
get scrambled?

Thank you.
