Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pA8I0pOM016208
	for <linux-lvm@redhat.com>; Tue, 8 Nov 2011 13:00:51 -0500
Received: from qmta15.westchester.pa.mail.comcast.net
	(qmta15.westchester.pa.mail.comcast.net [76.96.59.228])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pA8I0oAo003973
	for <linux-lvm@redhat.com>; Tue, 8 Nov 2011 13:00:51 -0500
Date: Tue, 8 Nov 2011 18:00:51 +0000 (UTC)
From: Dan White <ygor@comcast.net>
Message-ID: <915936479.2003418.1320775251420.JavaMail.root@sz0126a.westchester.pa.mail.comcast.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Cannot unmount logical volume to reduce it
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

RHEL5.7 x86_64
I want to reduce the size of the logical volumes on a server.
The two giving me trouble are mounted on /var and /usr

I cannot unmount them to reduce them.  Even tried booting into a rescue disc.

Any suggestions ?

“Sometimes I think the surest sign that intelligent life exists elsewhere in the universe is that none of it has tried to contact us.”
Bill Waterson (Calvin & Hobbes)
