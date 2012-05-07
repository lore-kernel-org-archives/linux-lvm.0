Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q479Jmx0014822
	for <linux-lvm@redhat.com>; Mon, 7 May 2012 05:19:48 -0400
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q479JlQo027190
	for <linux-lvm@redhat.com>; Mon, 7 May 2012 05:19:47 -0400
Received: by lbbgm6 with SMTP id gm6so4707170lbb.33
	for <linux-lvm@redhat.com>; Mon, 07 May 2012 02:19:46 -0700 (PDT)
MIME-Version: 1.0
Sender: sikieresmescribes@gmail.com
Date: Mon, 7 May 2012 11:19:46 +0200
Message-ID: <CAL-GF3x7beLNgN-gMLO3VTfPnNc5=TygsKumdOWzZ-Uaj1+QJw@mail.gmail.com>
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

Thanks a lot Ray,

I will give a try as soon as I can find a window as the server is in production.

Anyway, I add some information.

As I said, the lvm system stop responding after a lvremove of a
snapshot. This snapshot is a snapshot of a clustered system (clvm) but
with exclusive use.
When I remove it (and it works) the snapshot is active. I thought that
maybe that was the problem, so I tried to deactivate it first with the
result:

[root@s02 ~]# lvchange -an /dev/vols-001/vol01-autosnap-1333451491
  Can't change snapshot logical volume "vol01-autosnap-1333451491"

Don't know if I am doing it the correct way, but I am unable to
deactivate the snapshot.
