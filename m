Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6LKZlAv028339
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 16:35:47 -0400
Received: from Vail.esri.com (esrismtp2.esri.com [198.102.62.103])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n6LKZX1b031564
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 16:35:33 -0400
Received: from leoray.esri.com (leoray.esri.com [10.27.102.12])
	by Vail.esri.com (8.13.7+Sun/8.13.7) with ESMTP id n6LKZWmx019101
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 13:35:32 -0700 (PDT)
Received: from leoray.esri.com (leoray.esri.com [127.0.0.1])
	by leoray.esri.com (8.14.3/8.14.3) with ESMTP id n6LKZXFP031045
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 13:35:33 -0700
Received: (from ray5147@localhost)
	by leoray.esri.com (8.14.3/8.14.3/Submit) id n6LKZWkn031044
	for linux-lvm@redhat.com; Tue, 21 Jul 2009 13:35:32 -0700
Date: Tue, 21 Jul 2009 13:35:32 -0700
From: Ray Van Dolson <rvandolson@esri.com>
Subject: Re: [linux-lvm] Can't mount or run fdisk on an existing logical
	volume, help!
Message-ID: <20090721203532.GA30997@esri.com>
References: <2473b43f0907211255u7c116b1er9c3483bec2472cd@mail.gmail.com>
	<20090721195830.GA30206@esri.com>
	<2473b43f0907211301m7e4092b3t8ccd496bb1371fe7@mail.gmail.com>
	<20090721200728.GA30327@esri.com>
	<2473b43f0907211329u3f8c4dbbv43b4ecefde827b2c@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2473b43f0907211329u3f8c4dbbv43b4ecefde827b2c@mail.gmail.com>
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

On Tue, Jul 21, 2009 at 01:29:23PM -0700, Adam Olsen wrote:
> On Tue, Jul 21, 2009 at 2:07 PM, Ray Van Dolson<rvandolson@esri.com> wrot=
e:
> > Hmm... can you do an fdisk on your LV now? =EF=BF=BDThat error doesn't =
look
> > good though.
>=20
> Nope, still says "unable to read"
>=20
> > Are you able to run fdisk on each of the member physical volumes
> > successfully?
>=20
> I'm not sure how to do that.  For example:
>=20
> imgserv:/storage/# fsck /dev/sda3
> fsck 1.41.3 (12-Oct-2008)
> fsck: fsck.lvm2pv: not found
> fsck: Error 2 while executing fsck.lvm2pv for /dev/sda3
>=20
> Though, it looks like fsck.lvm2pv is not something that has actually
> been created yet.

Nono, don't do that... fsck is for filesystems :)  Just run fdisk
/dev/sda, run 'p' (for print) and see if you can see your LVM
partition.

Just a poor man's way to check that /dev/sda is OK.  Do this for the
other PV members.

Do not run fsck on it, that'll hose the data (if it even runs at all).

Ray
