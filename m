Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n42Jj5uR001131
	for <linux-lvm@redhat.com>; Sat, 2 May 2009 15:45:05 -0400
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n42JikJh009530
	for <linux-lvm@redhat.com>; Sat, 2 May 2009 15:44:46 -0400
Received: from racke.rauchzart (chello212017090083.12.15.vie.surfer.at
	[212.17.90.83])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTPSA id 91712104B1AE
	for <linux-lvm@redhat.com>; Sat,  2 May 2009 21:44:45 +0200 (CEST)
Date: Sat, 2 May 2009 21:44:45 +0200
From: Lars Ellenberg <lars.ellenberg@linbit.com>
Subject: Re: [linux-lvm] lvm ownership of special access node
Message-ID: <20090502194445.GI6466@racke>
References: <49FC7C24.6030702@fastmail.fm>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49FC7C24.6030702@fastmail.fm>
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

On Sat, May 02, 2009 at 02:00:20PM -0300, sebastian muniz wrote:
> Hello list.
> First post. Sorry  if this has already been discussed. I have search a  
> while with no luck.
> I need to mount a home directory for a user from a lvolume.
> For instance, I created
>  ACTIVE            '/dev/vg1/sebahome' [5.00 GB] inherit
>
> and need it mounted on /home/seba
> However, when I mount it on /home/seba permissions get root:root
>
> orion:~# ls -ld /home/seba
> drwxr-xr-x 4 root root 4096 2009-05-02 02:34 /home/seba
>
> I think that
>
> seba@orion:~$ ls -la /dev/vg1/sebahome
> lrwxrwxrwx 1 root root 24 2009-05-02 04:25 /dev/vg1/sebahome ->  
> /dev/mapper/vg1-sebahome
> seba@orion:~$ ls -la /dev/mapper/vg1-sebahome
> brw-rw---- 1 root disk 254, 3 2009-05-02 04:25 /dev/mapper/vg1-sebahome
>
> is the reason.
> Is there any way to create the special access node with other owner:group
> like the
> vxassist --user --group in veritas?
> Or is there any mount option I am now aware of?

mount /dev/vg1/sebahome /home/seba
chown owner:group /home/seba

should do the trick ;-)

once a file system gets mounted,
the ownership of its "/" overrides the ownership of the mount point.

	Lars

-- 
: Lars Ellenberg
: LINBIT | Your Way to High Availability
: DRBD/HA support and consulting http://www.linbit.com

DRBD� and LINBIT� are registered trademarks of LINBIT, Austria.
