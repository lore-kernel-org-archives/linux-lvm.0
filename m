Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q3OFRK38006782
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2012 11:27:20 -0400
Received: from mail-lpp01m010-f46.google.com (mail-lpp01m010-f46.google.com
	[209.85.215.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q3OFRHCJ017986
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2012 11:27:19 -0400
Received: by lahj13 with SMTP id j13so802675lah.33
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2012 08:27:17 -0700 (PDT)
MIME-Version: 1.0
Sender: sikieresmescribes@gmail.com
Date: Tue, 24 Apr 2012 17:27:16 +0200
Message-ID: <CAL-GF3xhhOQwOGYbJW06pOdjb2tVpcjGS9k=LM=mJH-KDfe2Pw@mail.gmail.com>
From: Da <dcodix@gmail.com>
Subject: Re: [linux-lvm] lvremove snapshot hangs LVM system
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

Well, I suppose no one else had this problem.

Does it mean that no one is using snapshots in a clvm environment? or
that they just work for everybody?

Just to keep it updated:
I tried withe the last soft versions and the same happens, the
"lvremove" of a snapshot just hangs my lvm system.
Here the versions I am using:

kernel-2.6.32-220.13.1.el6.x86_64
cman-3.0.12.1-23.el6.x86_64
corosync-1.4.1-4.el6.x86_64
corosynclib-1.4.1-4.el6.x86_64
lvm2-cluster-2.02.88-3.el6.x86_64
lvm2-libs-2.02.88-3.el6.x86_64
lvm2-2.02.88-3.el6.x86_64
lvm2-devel-2.02.88-3.el6.x86_64
fence-virt-0.2.3-5.el6.x86_64
fence-agents-3.1.5-10.el6.x86_64

Thanks!
