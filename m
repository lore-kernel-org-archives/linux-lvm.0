Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6LL7Yoa018322
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 17:07:35 -0400
Received: from esri3.esri.com (esrismtp2.esri.com [198.102.62.103])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n6LL784v016992
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 17:07:15 -0400
Received: from leoray.esri.com (leoray.esri.com [10.27.102.12])
	by esri3.esri.com (8.11.7p3+Sun/8.11.7) with ESMTP id n6LL76c21727
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 14:07:06 -0700 (PDT)
Received: from leoray.esri.com (leoray.esri.com [127.0.0.1])
	by leoray.esri.com (8.14.3/8.14.3) with ESMTP id n6LL766L031704
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 14:07:06 -0700
Received: (from ray5147@localhost)
	by leoray.esri.com (8.14.3/8.14.3/Submit) id n6LL76rD031703
	for linux-lvm@redhat.com; Tue, 21 Jul 2009 14:07:06 -0700
Date: Tue, 21 Jul 2009 14:07:06 -0700
From: Ray Van Dolson <rvandolson@esri.com>
Subject: Re: [linux-lvm] Can't mount or run fdisk on an existing logical
	volume, help!
Message-ID: <20090721210705.GA31479@esri.com>
References: <2473b43f0907211255u7c116b1er9c3483bec2472cd@mail.gmail.com>
	<20090721195830.GA30206@esri.com>
	<2473b43f0907211301m7e4092b3t8ccd496bb1371fe7@mail.gmail.com>
	<20090721200728.GA30327@esri.com>
	<2473b43f0907211329u3f8c4dbbv43b4ecefde827b2c@mail.gmail.com>
	<20090721203532.GA30997@esri.com>
	<2473b43f0907211347h5cad6d77se2dda5f779953f81@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2473b43f0907211347h5cad6d77se2dda5f779953f81@mail.gmail.com>
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
To: linux-lvm@redhat.com

On Tue, Jul 21, 2009 at 01:47:01PM -0700, Adam Olsen wrote:
> On Tue, Jul 21, 2009 at 2:35 PM, Ray Van Dolson<rvandolson@esri.com> wrot=
e:
> > Just a poor man's way to check that /dev/sda is OK. =EF=BF=BDDo this fo=
r the
> > other PV members.
>=20
> Oh, yes.  I can run fdisk and see that all the partitions are there.
> Each physical volume *looks* ok.

Very strange... a few more commands:

vgs -P -o +devices
lvs -P -a -o +devices

You also might want to take a look at the files under /etc/lvm to make
sure everything looks intact.

If you want, post the lvmdump tarball somewhere...

When did this start happening?

Ray
