Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6LKU5BP024392
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 16:30:05 -0400
Received: from mail-pz0-f172.google.com (mail-pz0-f172.google.com
	[209.85.222.172])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n6LKTiQt018427
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 16:29:45 -0400
Received: by pzk2 with SMTP id 2so2300705pzk.23
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 13:29:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090721200728.GA30327@esri.com>
References: <2473b43f0907211255u7c116b1er9c3483bec2472cd@mail.gmail.com> 
	<20090721195830.GA30206@esri.com>
	<2473b43f0907211301m7e4092b3t8ccd496bb1371fe7@mail.gmail.com> 
	<20090721200728.GA30327@esri.com>
From: Adam Olsen <arolsen@gmail.com>
Date: Tue, 21 Jul 2009 14:29:23 -0600
Message-ID: <2473b43f0907211329u3f8c4dbbv43b4ecefde827b2c@mail.gmail.com>
Subject: Re: [linux-lvm] Can't mount or run fdisk on an existing logical 
	volume, help!
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Jul 21, 2009 at 2:07 PM, Ray Van Dolson<rvandolson@esri.com> wrote:
> Hmm... can you do an fdisk on your LV now? =EF=BF=BDThat error doesn't lo=
ok
> good though.

Nope, still says "unable to read"

> Are you able to run fdisk on each of the member physical volumes
> successfully?

I'm not sure how to do that.  For example:

imgserv:/storage/# fsck /dev/sda3
fsck 1.41.3 (12-Oct-2008)
fsck: fsck.lvm2pv: not found
fsck: Error 2 while executing fsck.lvm2pv for /dev/sda3

Though, it looks like fsck.lvm2pv is not something that has actually
been created yet.

--=20
Adam Olsen
SendOutCards.com
http://www.vimtips.org
http://last.fm/user/synic
