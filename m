Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4JHoZXP018585
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 13:50:36 -0400
Received: from mail-wy0-f174.google.com (mail-wy0-f174.google.com
	[74.125.82.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4JHoP2h003710
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 13:50:25 -0400
Received: by wyg36 with SMTP id 36so672842wyg.33
	for <linux-lvm@redhat.com>; Wed, 19 May 2010 10:50:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <05d201caf776$17abb110$47031330$@com>
References: <059801caf769$fc848350$f58d89f0$@com>
	<4BF40A8B.2000201@alteeve.com> <20100519162601.GA18162@us.ibm.com>
	<05c901caf771$a3161920$e9424b60$@com>
	<Pine.LNX.4.64.1005191246520.28122@bmsred.bmsi.com>
	<4BF41884.4080000@alteeve.com> <05d201caf776$17abb110$47031330$@com>
Date: Wed, 19 May 2010 12:28:43 -0500
Message-ID: <AANLkTinix9cC-NIOWpHlx2wvM5g2Z89Zkn3qbLXbefTJ@mail.gmail.com>
From: Richard Shaw <hobbes1069@gmail.com>
Subject: Re: [linux-lvm] Adding a disk to expand an existing logical volume
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

On Wed, May 19, 2010 at 12:09 PM, kevin <k@kevinkevin.com> wrote:
> One last thing I want to confirm is the lvextend command to 'grow' the
> logical volume :
>
>
> lvextend -L+144G /dev/VolGroup00/my_volume
>
> After all said steps in previous messages on this thread are complete, is
> the above command correct for my particular scenario? Do I want to 'extend'
> the volume size or 'grow' it?
>
> Not sure what the difference is.

Chiming in a little late here but I would suggest the following
(although I'm certainly not a LVM expert):

lvextend -l +100%FREE /dev/VolGroup00/my_volume (notice the lower case
l in -l, not upper)

This should make sure you add 100% of the extents of the new drive to
your logical volume. As I've said, I'm not an expert so I don't know
the innards of "lvextend" but I would be concerned that if you specify
the size of the expansion in gigabytes instead of as a percentage that
you might get some unallocated extents due to rounding.

Richard
