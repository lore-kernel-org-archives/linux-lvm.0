Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lBC8UM5r017435
	for <linux-lvm@redhat.com>; Wed, 12 Dec 2007 03:30:22 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lBC8TuB7021206
	for <linux-lvm@redhat.com>; Wed, 12 Dec 2007 03:29:57 -0500
Date: Wed, 12 Dec 2007 09:29:54 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] After replacing sata card can't read
Message-ID: <20071212082953.GA23948@percy.comedia.it>
References: <BAY124-W59BBCA092E4CB4D14E3BE1CD650@phx.gbl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BAY124-W59BBCA092E4CB4D14E3BE1CD650@phx.gbl>
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

On Wed, Dec 12, 2007 at 07:06:46AM +0000, Glynn Morrison wrote:
>
>what I did:
>
>  mdadm  --create --assume-clean /dev/md2 --level=5 --raid-devices=6 /dev/sd[a-f]1
and you are 1000% sure you got the order right?

>  pvcreate -u uRm1dv-M80B-YRPp-vNM8-WNth-kuke-oNCGHG /dev/md2
>  vgcfgrestore -f lvm-raid raid
>
>Latter I tried: pvcreate --restorefile lvm-raid -u uRm1dv-M80B-YRPp-vNM8-WNth-kuke-oNCGHG /dev/md2 instead to the same affect.
if the mdadm was correct this should have not been needed

>I'm assuming that all this wont have affected the actual data on the
>drive, but I'm at a loss of what to do now, as far as I can see
>everything is now as it was...
usually after doing "mdadm --create --assume-clean" you should check
that data is still readable, if not try changing the order of drives in
"mdadm" and try again.

L.
