Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sB88UDVm016867
	for <linux-lvm@redhat.com>; Mon, 8 Dec 2014 03:30:13 -0500
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sB88U6lU021273
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Mon, 8 Dec 2014 03:30:08 -0500
Received: by mail-lb0-f174.google.com with SMTP id 10so1788982lbg.19
	for <linux-lvm@redhat.com>; Mon, 08 Dec 2014 00:30:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5484C5A7.8080601@ubuntu.com>
References: <5480E939.3070702@ubuntu.com>
	<CADxRZqxjvrp3MhW4rAxaBvxeJ7qev=KE=0H92rNcKGBAD1VMaA@mail.gmail.com>
	<5484C5A7.8080601@ubuntu.com>
Date: Mon, 8 Dec 2014 11:30:06 +0300
Message-ID: <CADxRZqyi7Ybowtm8YXErwZY7o3NjSi7XELBSnp8xk0mKo4vOOw@mail.gmail.com>
From: Anatoly Pugachev <matorola@gmail.com>
Subject: Re: [linux-lvm] Raid1 -> linear conversion = destroyed data
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Dec 8, 2014 at 12:24 AM, Phillip Susi <psusi@ubuntu.com> wrote:
>
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA512
>
> On 12/05/2014 05:12 AM, Anatoly Pugachev wrote:
> > Phillip,
> >
> > can you please paste the commands you've used to convert the
> > volume? I don't have ubuntu , but rhel7 manual page for lvconvert,
> > example section is pretty clear on how to convert back to flat
> > (-m0) volume and what physical device you remove from logical
> > volume, quote:
> >
> >
> > Converts mirror logical volume "vg00/lvmirror1" to linear, freeing
> > physical extents from /dev/sda:
> >
> > lvconvert -m0 vg00/lvmirror1 /dev/sda
>
> I simply used lvconvert -m0 vg/lv.  I did not think I would need to
> specify which leg should be kept; obviously it should be the one
> currently in use rather than the out of date copy.


I wonder how many more people would lost their data before there would
be changes to lvconvert -m0 to require specification of physicalVolume
instead of optional requirement.
