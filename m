Received: from [10.34.130.176] (dhcp130-176.brq.redhat.com [10.34.130.176])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t6E8hx7a003558
	for <linux-lvm@redhat.com>; Tue, 14 Jul 2015 04:44:00 -0400
References: <CAK9_OPrqjkfNhxtRUT8V6nuqxfB0jrLtRmipB0Q8LpNbxguAuw@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <55A4CBCF.1050706@redhat.com>
Date: Tue, 14 Jul 2015 10:43:59 +0200
MIME-Version: 1.0
In-Reply-To: <CAK9_OPrqjkfNhxtRUT8V6nuqxfB0jrLtRmipB0Q8LpNbxguAuw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] what is free space in LVM
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 10.7.2015 v 11:45 Angelo Moreschini napsal(a):
> Hi,
>
> I am new to LVM and I would like to have an exact answer to the question :
>
> what is the criteria that allows to distinguishes the "free space" on the all
> the space in a Volume Group?
>
> or (if you prefer)...
>
> howthe command pvscan does to obtain information about the free space in LVM ?
>
> ------------
> According to my current knowledge, I know that the definition of "free space"
> concerns with withthe set of blocks for which, in the FAT, is not  registered
> a significant link to access a file.
>
> But I think that in the context of LVM there should be a different criterion
> to define the "free space" insidea Volume Group.
> ----------

lvm2 is NOT filesystem

lvm2 is 'volume manager' - thus  every PV is divided into extents.
And 'extent' could be associated with LV.

So easily - if PV has  32bit #extent count.
(Size of extent is again 32bit number -> in total 64bit address space).

So when you calc all extents in use (being member of any LV),
and subtracts this from number of all available extent
you will get number of 'free' extent.

Note - you put filesystem ON your LV - and then filesystem is managing free 
space within this LV.

Zdenek
