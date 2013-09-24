Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r8OGE7Kd003647
	for <linux-lvm@redhat.com>; Tue, 24 Sep 2013 12:14:07 -0400
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8OGE6OE011898
	for <linux-lvm@redhat.com>; Tue, 24 Sep 2013 12:14:06 -0400
Received: by mail-yh0-f46.google.com with SMTP id c41so2033426yho.5
	for <linux-lvm@redhat.com>; Tue, 24 Sep 2013 09:14:06 -0700 (PDT)
Message-ID: <5241BA4B.7050504@gmail.com>
Date: Tue, 24 Sep 2013 12:14:03 -0400
From: =?ISO-8859-2?Q?Jorge_F=E1bregas?= <jorge.fabregas@gmail.com>
MIME-Version: 1.0
References: <5238A190.2050000@gmail.com>
	<alpine.LFD.2.00.1309241512590.2049@localhost.localdomain>
	<alpine.LFD.2.00.1309241649340.2049@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.00.1309241649340.2049@localhost.localdomain>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM & fstrim behaviour (Fedora 19)
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

Here's without discard mount option in fstab:

http://paste.fedoraproject.org/41849/80039018/

As you can see fstrim is not actually working at all.

Regards,
Jorge
