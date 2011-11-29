Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pAU1bvae029855
	for <linux-lvm@redhat.com>; Tue, 29 Nov 2011 20:37:57 -0500
Received: from smarty.dreamhost.com (smarty.dreamhost.com [208.113.175.8])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pAU1buj8026653
	for <linux-lvm@redhat.com>; Tue, 29 Nov 2011 20:37:56 -0500
Received: from hulk.dreamhost.com (hulk.dreamhost.com [75.119.204.199])
	by smarty.dreamhost.com (Postfix) with ESMTP id B1B60700D2B
	for <linux-lvm@redhat.com>; Tue, 29 Nov 2011 10:38:30 -0800 (PST)
Date: Tue, 29 Nov 2011 07:43:32 -0800
From: lvm@qasmos.net
Message-ID: <20111129154332.GA5898@hulk.dreamhost.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Recovering a volume after lost disk
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

I had done the vgreduce part some time ago but when I run the second command, I get:

# vgchange -ay
0 logical volume(s) in volume group "video" now active
#

also, when I try to mount it:

# mount /dev/video/video /m/video
mount: special device /dev/video/video does not exist
#

whic is expetable, because the volume is not listed, to begin with:

# lvs|grep video
#

How do I get the volume to show and the special device created?
