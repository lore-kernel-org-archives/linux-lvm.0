Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s06CxhMj016032
	for <linux-lvm@redhat.com>; Mon, 6 Jan 2014 07:59:43 -0500
Received: from homiemail-a79.g.dreamhost.com (caibbdcaacbg.dreamhost.com
	[208.113.200.216])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s06CxfER019462
	for <linux-lvm@redhat.com>; Mon, 6 Jan 2014 07:59:41 -0500
Received: from homiemail-a79.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a79.g.dreamhost.com (Postfix) with ESMTP id 489367D4074
	for <linux-lvm@redhat.com>; Mon,  6 Jan 2014 04:59:41 -0800 (PST)
Received: from [127.0.0.1] (unknown [159.63.145.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: tanstaafl@libertytrek.org)
	by homiemail-a79.g.dreamhost.com (Postfix) with ESMTPSA id 2B14D7D406E
	for <linux-lvm@redhat.com>; Mon,  6 Jan 2014 04:59:41 -0800 (PST)
Message-ID: <52CAA89E.1000904@libertytrek.org>
Date: Mon, 06 Jan 2014 07:59:10 -0500
From: Tanstaafl <tanstaafl@libertytrek.org>
MIME-Version: 1.0
References: <52C16F30.9090501@libertytrek.org>
In-Reply-To: <52C16F30.9090501@libertytrek.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Question re: deleting an LV...
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
To: LVM List <linux-lvm@redhat.com>

On 2013-12-30 8:03 AM, Tanstaafl <tanstaafl@libertytrek.org> wrote:
> Hello,
>
> Due to a misunderstanding about how LVM snapshots work when I set up
> this system, I now need to delete an LV I had created to use for this
> purpose (I thought I had to pre-create the LV).
>
> Currently I have:
>
>   # lvscan
>    ACTIVE            '/dev/vg/tmp' [5.00 GiB] inherit
>    ACTIVE            '/dev/vg/log' [5.00 GiB] inherit
>    ACTIVE            '/dev/vg/vtmp' [5.00 GiB] inherit
>    ACTIVE            '/dev/vg/var' [700.00 GiB] inherit
>    ACTIVE            '/dev/vg/snaps' [4.00 GiB] inherit
>
> I just need to delete the /dev/vg/snaps LV, so that that 4GB is
> available for my LVM snapshots.
>
> Am I correct that all I have to do is:
>
> # umount /dev/vg/snaps
> # lvremove /dev/vg/snaps
>
> Then remove this line from fstab?
>
> This would then result in my VG having 4GB available for taking LVM
> snapshots?

Would appreciate a confirmation that I don't have to do anything else to 
totally eliminate the snaps LV...

I unmounted it, and commented that line in fstab. lvscan still shows the 
same as above, but lvs shows the snaps with a slightly different attribute:

  # lvs
   LV    VG   Attr       LSize
   log   vg   -wi-ao----   5.00g
   snaps vg   -wi-a-----   4.00g
   tmp   vg   -wi-ao----   5.00g
   var   vg   -wi-ao---- 700.00g
   vtmp  vg   -wi-ao----   5.00g

So again - is lvremove /dev/vg/snaps the correct way - and the only 
thing I need to do - to remove that LV as if it had never been created?

Thanks
