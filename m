Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jB9GYvV15989
	for <linux-lvm@redhat.com>; Fri, 9 Dec 2005 11:34:57 -0500
Received: from echohome.org (s233-64-196-242.try.wideopenwest.com
	[64.233.242.196])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jB9GYmp6010131
	for <linux-lvm@redhat.com>; Fri, 9 Dec 2005 11:34:48 -0500
Received: from www.echohome.org (localhost.localdomain [127.0.0.1])
	by echohome.org (8.12.8/8.12.8) with ESMTP id jB9GYe5Y015678
	for <linux-lvm@redhat.com>; Fri, 9 Dec 2005 11:34:41 -0500
Message-ID: <47679.69.49.99.19.1134146081.squirrel@www.echohome.org>
In-Reply-To: <439620CE.1030902@ee.duth.gr>
References: <439620CE.1030902@ee.duth.gr>
Date: Fri, 9 Dec 2005 11:34:41 -0500 (EST)
Subject: Re: [linux-lvm] If one disk fails i loose everything?
From: "Erik Ohrnberger" <Erik@echohome.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Reply-To: Erik@echohome.org,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm@redhat.com

On Tue, December 6, 2005 18:37, kyr wrote:
>
>   I have tree simple questions about LVM that just could not be answered
>   after 4 hours of search in LVM howto, Google, Linux questions and
>   linux-lvm Archives.
>
>
>   I have a small file server with 600Gbytes in one liner volume group
>   consisting of 3 200 Gbyte Hard disk. My questions are:
>
>
>   1. If one hard disk fails (hardware) do I loose all the data stored on
>   the VG?

    Yup.  That's how it works.  There are programs that can scavange
partial data from the hard disks that make up the VG.  r-studio being
one of them.

>   2. Can I add a new hard disk in the VG without having to format it
>   before? (I mean if it is full of data can I just add it?)

    You'll have to create an LVM data partition for the data that you want
to store on the drive, and this will wipe out the currently existing
data on the drive.

>   3. In case of failure can I recover the data from a single disk on
>   another box?

    Possibly, but I've never done this.  Seems rather doubtful to me.

>   Thanks in advance
>
>
>   Kyriakos
>
>
>   Greece
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
