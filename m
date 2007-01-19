Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l0J7CE1a003006
	for <linux-lvm@redhat.com>; Fri, 19 Jan 2007 02:12:15 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l0J7CDJf023093
	for <linux-lvm@redhat.com>; Fri, 19 Jan 2007 02:12:14 -0500
Date: Fri, 19 Jan 2007 08:12:11 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Mirroring my install. Lots of problems !
Message-ID: <20070119071211.GB31075@percy.comedia.it>
References: <1168854146.45ab4c8281ce4@imp6-g19.free.fr>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1168854146.45ab4c8281ce4@imp6-g19.free.fr>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Mon, Jan 15, 2007 at 10:42:26AM +0100, Georges Giralt wrote:
...
>The conversion was a failure, because the tools asked for a THIRD disk in order
>to mirror the VG. Funny. I thought GNU/Linux was clever, I was wrong. How come
>HP-UX or Aix can do LVM mirror on 2 disks and not Linux ? (the corelog option
>is also an issue, as reconstruction will take place at every reboot which occur
>often as this is a home box, not a server)
i am still waiting for the lvm mirror interface to settle before trying
to use it, so i cannot comment...

>So I decided to try a more complex approach : Create a mirror using the mdtools
>(mdadm) and turn this into a VG. My plan was as follow :
>1) create a critical mirror using mdadm with only one copy active on hdb2 repeat
>with hdb3.
>2) pvcreate md0 and md1
>3) add md0 to vg0 and md1 to vg-ext
>4) pvmove all vg0 lv to md0 and all vg-ext lv to md1.
>5) vgreduce vg0 to remove hda2 and vg-ext to remove hda3
>6) add hda2 to md0 and hda3 to md1 and force re-sync
>7) have a beer, and enjoy.
this is the best part of your plan :)
>Again, a disaster. I CAN'T add an md to a vg and have the vg work. I've tried to
>do it using plain md0 to pvcreate, partitionning md0 to create md0p1 and
>pvcreate this (it's impossible, as there is no /dev/md0p1 device...)
can you please be more verbose as to why you can't add an md to a vg
eg showing logs and output of lvm commands with verbose options.
i usually pvcreate md devices without any problem.

regards,
L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
