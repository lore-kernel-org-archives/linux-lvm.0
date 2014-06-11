Message-ID: <53982262.3010205@redhat.com>
Date: Wed, 11 Jun 2014 11:33:22 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CAFrGbuXWhQaPBGhc60oaE-WP__vrnJ32to-uWkcVZOrX2yBmzA@mail.gmail.com>	<53980AF8.6060303@mglug.de>
	<CAFrGbuUYwj9xasnQZ8DYkFoj2qoZxjE7ui6Tf4Uj7bxzR2P2jA@mail.gmail.com>
In-Reply-To: <CAFrGbuUYwj9xasnQZ8DYkFoj2qoZxjE7ui6Tf4Uj7bxzR2P2jA@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] pvs -a on a partition of ZFS block device
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, alessandro.macuz@gmail.com

Dne 11.6.2014 10:43, alessandro macuz napsal(a):
>
>
> 2014-06-11 9:53 GMT+02:00 Oliver Rath <rath@mglug.de <mailto:rath@mglug.de>>:
>
>     Hi Alex,
>
>     Im not sure if I understand right: You take a zfv-Volume to create a lvm
>     volume inside? Make it sense to mix two similar concepts in this way? Imho
>     zfs and lvm are focussed to different goals, so if you combine it, you get
>     the worse of both.
>
>     What is your goal mixing these concepts? If you have created a zfs-volume,
>     you can mount it directly without detouring over lvm and vice versa.
>
>     I think it is much better to decide for one of these (zfs-volumes XOR
>     lvm-Volumes) depending on your needs.
>
>     Just my 2ct
>
>     Regards
>     Oliver
>
>
> Hi Oliver,
>
> I see and back your point since the flexibility given by LVM can be obtained
> with ZFS as well.
> In this case I'm not trying to achieve anything but rather dealing with
> something already existing and without making too many changes I'd like to
> access that volume. I think my reasoning is correct but somehow I see
> something non-expected. I thought I could use pvs, and lvs later on, on any
> block device as for any physical disks.
>
> Maybe pvs is coded to work only with some devices on purpose, I haven't looked
> at the source. I don't think what I'm doing is wrong in theory and I would
> like to know if instead, from the theoretically point of view, it is.
>
> Thanks, Alex

Support for  ZFS partitions has been embedded into 2.02.106 lvm2 version.
You may as well add it to older version of lvm2 by updating your lvm.conf

https://bugzilla.redhat.com/show_bug.cgi?id=913597


You can add the following to your /etc/lvm.conf devices section to solve the 
issue:

types = [ "zvol", 16 ]

Zdenek
