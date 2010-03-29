Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o2TLIsxK018102
	for <linux-lvm@redhat.com>; Mon, 29 Mar 2010 17:18:54 -0400
Received: from mail-vw0-f46.google.com (mail-vw0-f46.google.com
	[209.85.212.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o2TLIiKh010875
	for <linux-lvm@redhat.com>; Mon, 29 Mar 2010 17:18:45 -0400
Received: by vws20 with SMTP id 20so302634vws.33
	for <linux-lvm@redhat.com>; Mon, 29 Mar 2010 14:18:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4BB0D44A.1F8D.00A2.0@cegepsth.qc.ca>
References: <4BB0D44A.1F8D.00A2.0@cegepsth.qc.ca>
Date: Mon, 29 Mar 2010 14:18:44 -0700
Message-ID: <ea5cdf451003291418w7e97fdc1reea8cc9d02aa6276@mail.gmail.com>
From: Bryan Whitehead <driver@megahappy.net>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Reduce an LVM volume split on two physical disks
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Reducing the size of the LV is possible, but the filesystem sitting on
top likely cannot be reduced.
(there are some guides to resize ext3, such as:
http://www.howtoforge.com/linux_resizing_ext3_partitions )

Suggestion:
Use an external disk (usb/firewire) and add it to the volume group
where the two logical disks are on. migrate data off the second disk,
replace disk, then migrate data off the external disk, and then remove
the external disk.

On Mon, Mar 29, 2010 at 1:24 PM, Mathieu Chartier
<mchartier@cegepsth.qc.ca> wrote:
> Hi,
>
> I have an LVM volume of 1.8TB split on two physical disk that have a 900
> someting GB partition on each of them.
>
> I need to change the second disk, and only 396GB og the 1.8TB is used...so
> can I reduce the size of the LVM volume to only the first disk, change the
> second disk and expand after the LVM volume to the second disk?
>
> The volume is in LVM2
>
> Regards,
>
> Mathieu Chartier
> Technicien Informatique
> C�gep de Saint-Hyacinthe
> t�l:� 450 773-6800 Poste 153
> ligne Mtl (514) 875-4445 Poste 153
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
