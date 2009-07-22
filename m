Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6M62BqV010165
	for <linux-lvm@redhat.com>; Wed, 22 Jul 2009 02:02:12 -0400
Received: from mail-yx0-f202.google.com (mail-yx0-f202.google.com
	[209.85.210.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n6M61q61011505
	for <linux-lvm@redhat.com>; Wed, 22 Jul 2009 02:01:52 -0400
Received: by yxe40 with SMTP id 40so5369681yxe.23
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 23:01:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4A66A873.8050100@cox.net>
References: <2473b43f0907211255u7c116b1er9c3483bec2472cd@mail.gmail.com> 
	<20090721195830.GA30206@esri.com> <4A66A30F.1020906@cox.net> 
	<2473b43f0907212241q3c07e2d4tb160a95b154ad201@mail.gmail.com> 
	<4A66A873.8050100@cox.net>
From: Adam Olsen <arolsen@gmail.com>
Date: Wed, 22 Jul 2009 00:01:31 -0600
Message-ID: <2473b43f0907212301g605fd40cw894d9266b9877b41@mail.gmail.com>
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

On Tue, Jul 21, 2009 at 11:49 PM, Ron Johnson<ron.l.johnson@cox.net> wrote:
> Why didn't I have to? =EF=BF=BDThis has always worked for me:
>
> # mkfs.${TYPE} /dev/some_vg/some_lv

Perhaps you're not required to.  I just always assumed you did, so I
always have.  It does work, and works how you'd expect it to.

--=20
Adam Olsen
SendOutCards.com
http://www.vimtips.org
http://last.fm/user/synic
