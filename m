Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q5JFdAdo005719
	for <linux-lvm@redhat.com>; Tue, 19 Jun 2012 11:39:10 -0400
Received: from mail-pz0-f46.google.com (mail-pz0-f46.google.com
	[209.85.210.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q5JFd9Rm021545
	for <linux-lvm@redhat.com>; Tue, 19 Jun 2012 11:39:09 -0400
Received: by dady13 with SMTP id y13so9239347dad.33
	for <linux-lvm@redhat.com>; Tue, 19 Jun 2012 08:39:09 -0700 (PDT)
Message-ID: <1340120294.2712.7.camel@globesm.com>
From: "Amos.Huang" <ch.linux.free@gmail.com>
Date: Tue, 19 Jun 2012 23:38:14 +0800
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Subject: [linux-lvm] lvm create a large amount of lv seems problem
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
To: linux-lvm@redhat.com

Hi,all.
	I hava two hard disk.I create two physical-volume,and on the two
physical-volume created a volume-group.

I run the following shell:
for(( i = 0; i < 400; i++));do
	lvcreate -L 1G volume-group
done

But it whill missing pv with 'UUID' ,occasionally!

Who can help me?Thanks!!

-- 
Amos.Huang <ch.linux.free@gmail.com>
