Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6LKlgXP004246
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 16:47:42 -0400
Received: from wf-out-1314.google.com (wf-out-1314.google.com [209.85.200.169])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n6LKlMoK027471
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 16:47:22 -0400
Received: by wf-out-1314.google.com with SMTP id 28so936543wfa.6
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 13:47:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090721203532.GA30997@esri.com>
References: <2473b43f0907211255u7c116b1er9c3483bec2472cd@mail.gmail.com> 
	<20090721195830.GA30206@esri.com>
	<2473b43f0907211301m7e4092b3t8ccd496bb1371fe7@mail.gmail.com> 
	<20090721200728.GA30327@esri.com>
	<2473b43f0907211329u3f8c4dbbv43b4ecefde827b2c@mail.gmail.com> 
	<20090721203532.GA30997@esri.com>
From: Adam Olsen <arolsen@gmail.com>
Date: Tue, 21 Jul 2009 14:47:01 -0600
Message-ID: <2473b43f0907211347h5cad6d77se2dda5f779953f81@mail.gmail.com>
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

On Tue, Jul 21, 2009 at 2:35 PM, Ray Van Dolson<rvandolson@esri.com> wrote:
> Just a poor man's way to check that /dev/sda is OK. =EF=BF=BDDo this for =
the
> other PV members.

Oh, yes.  I can run fdisk and see that all the partitions are there.
Each physical volume *looks* ok.

--=20
Adam Olsen
SendOutCards.com
http://www.vimtips.org
http://last.fm/user/synic
