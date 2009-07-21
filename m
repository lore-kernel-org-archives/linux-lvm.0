Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6LMovAj013639
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 18:50:57 -0400
Received: from Vail.esri.com (esrismtp2.esri.com [198.102.62.103])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n6LMoi4E020725
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 18:50:44 -0400
Received: from leoray.esri.com (leoray.esri.com [10.27.102.12])
	by Vail.esri.com (8.13.7+Sun/8.13.7) with ESMTP id n6LMoiTl007124
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 15:50:44 -0700 (PDT)
Received: from leoray.esri.com (leoray.esri.com [127.0.0.1])
	by leoray.esri.com (8.14.3/8.14.3) with ESMTP id n6LMoiO3001847
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 15:50:44 -0700
Received: (from ray5147@localhost)
	by leoray.esri.com (8.14.3/8.14.3/Submit) id n6LMohuo001846
	for linux-lvm@redhat.com; Tue, 21 Jul 2009 15:50:43 -0700
Date: Tue, 21 Jul 2009 15:50:43 -0700
From: Ray Van Dolson <rvandolson@esri.com>
Subject: Re: [linux-lvm] Can't mount or run fdisk on an existing logical
	volume, help!
Message-ID: <20090721225043.GA1749@esri.com>
References: <20090721200728.GA30327@esri.com>
	<2473b43f0907211329u3f8c4dbbv43b4ecefde827b2c@mail.gmail.com>
	<20090721203532.GA30997@esri.com>
	<2473b43f0907211347h5cad6d77se2dda5f779953f81@mail.gmail.com>
	<20090721210705.GA31479@esri.com>
	<2473b43f0907211424o209e52ccj9223295a328220d3@mail.gmail.com>
	<20090721215913.GA32225@esri.com>
	<2473b43f0907211509w2385d916p3fd9511a60ab778a@mail.gmail.com>
	<20090721222118.GA755@esri.com>
	<2473b43f0907211543t46aff11eqb1db163605bafca1@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2473b43f0907211543t46aff11eqb1db163605bafca1@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Tue, Jul 21, 2009 at 03:43:58PM -0700, Adam Olsen wrote:
> On Tue, Jul 21, 2009 at 4:21 PM, Ray Van Dolson<rvandolson@esri.com> wrote:
> > I'm not sure which one of these backup files I'd use to restore to.
> > You can also re-run pvcreate with the --uuid and --restorefile argument
> > if you want to recreate a "lost" uuid...
> 
> How can I see the difference between what uuid's it's looking for and
> what is currently set on the devices?

pvdisplay should show the UUID's currently on your physical devices.
You can look at the contents of the file to compare.

> (neither of the vgcfgrestore commands helped, either for
> storage_00034.vg or /etc/lvm/backup/storage)

I am kinda stumped at this point.

Ray
