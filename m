Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6LMiei0009831
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 18:44:40 -0400
Received: from an-out-0708.google.com (an-out-0708.google.com [209.85.132.250])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n6LMiLmh002722
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 18:44:21 -0400
Received: by an-out-0708.google.com with SMTP id d14so2134805and.36
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 15:44:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090721222118.GA755@esri.com>
References: <20090721195830.GA30206@esri.com>
	<20090721200728.GA30327@esri.com> 
	<2473b43f0907211329u3f8c4dbbv43b4ecefde827b2c@mail.gmail.com> 
	<20090721203532.GA30997@esri.com>
	<2473b43f0907211347h5cad6d77se2dda5f779953f81@mail.gmail.com> 
	<20090721210705.GA31479@esri.com>
	<2473b43f0907211424o209e52ccj9223295a328220d3@mail.gmail.com> 
	<20090721215913.GA32225@esri.com>
	<2473b43f0907211509w2385d916p3fd9511a60ab778a@mail.gmail.com> 
	<20090721222118.GA755@esri.com>
From: Adam Olsen <arolsen@gmail.com>
Date: Tue, 21 Jul 2009 16:43:58 -0600
Message-ID: <2473b43f0907211543t46aff11eqb1db163605bafca1@mail.gmail.com>
Subject: Re: [linux-lvm] Can't mount or run fdisk on an existing logical 
	volume, help!
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Jul 21, 2009 at 4:21 PM, Ray Van Dolson<rvandolson@esri.com> wrote:
> I'm not sure which one of these backup files I'd use to restore to.
> You can also re-run pvcreate with the --uuid and --restorefile argument
> if you want to recreate a "lost" uuid...

How can I see the difference between what uuid's it's looking for and
what is currently set on the devices?

(neither of the vgcfgrestore commands helped, either for
storage_00034.vg or /etc/lvm/backup/storage)

-- 
Adam Olsen
SendOutCards.com
http://www.vimtips.org
http://last.fm/user/synic
