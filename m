Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7HKJI5k007714
	for <linux-lvm@redhat.com>; Thu, 17 Aug 2006 16:19:18 -0400
Received: from mail.eecs.harvard.edu (bowser.eecs.harvard.edu [140.247.60.24])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7HKJHoj027302
	for <linux-lvm@redhat.com>; Thu, 17 Aug 2006 16:19:17 -0400
Received: from labrador.eecs.harvard.edu (labrador.eecs.harvard.edu
	[140.247.60.247])
	by mail.eecs.harvard.edu (Postfix) with ESMTP id 56B301A3C86
	for <linux-lvm@redhat.com>; Thu, 17 Aug 2006 16:19:17 -0400 (EDT)
Message-Id: <20060817201917.1EF8E1EB6B8@labrador.eecs.harvard.edu>
Date: Thu, 17 Aug 2006 16:19:17 -0400 (EDT)
From: Norman Ramsey <nr@eecs.harvard.edu>
Subject: [linux-lvm] how to learn number of stripes on logical volume?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I'm using LVM2 under Debian.  I have a logical volume 
created by the Debian installer, and I'd like to know if it
is striped.  How can I find out?

I tried 'lvdisplay -v' and 'vgdisplay -v', but neither
shows the number of stripes on a logical volume (I tried
with a newly created LV with two stripes, but the information
is not shown).


Norman Ramsey
