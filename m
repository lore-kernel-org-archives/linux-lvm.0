Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k35Ee2jE013619
	for <linux-lvm@redhat.com>; Wed, 5 Apr 2006 10:40:02 -0400
Received: from hotmail.com (bay102-f16.bay102.hotmail.com [64.4.61.26])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k35EdtCC002744
	for <linux-lvm@redhat.com>; Wed, 5 Apr 2006 10:39:55 -0400
Message-ID: <BAY102-F1695A745E2F1701B4A34F0EFCB0@phx.gbl>
In-Reply-To: <200604051048.59100@bj-ig.de>
From: "Christopher Probst" <probst_christopher@hotmail.com>
Subject: Re: [linux-lvm] pvmove on a root partition
Date: Wed, 05 Apr 2006 13:51:35 +0000
Mime-Version: 1.0
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable
To: linux-lvm@redhat.com

Hello Ralf,

Thank you very much for the info. I guess I won't pvmove on a root partitio=
n=20
for a while ;)

Christopher




>From: Ralf M=EF=BF=BDller <ralf@bj-ig.de>
>Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
>To: LVM general discussion and development <linux-lvm@redhat.com>
>Subject: Re: [linux-lvm] pvmove on a root partition
>Date: Wed, 5 Apr 2006 10:48:54 +0200
>
>On Tuesday 04 April 2006 20:58, Christopher Probst wrote:
>
> > pvmove /dev/hdb1 /dev/hdb2 where /dev/hdb1 is mounted on "/"
> >
> > makes my system unuseable. I can't log into my machine even in a text
> > console. Has anybody tried this before?
>
>Yes - about a year before. And I failed. After asking I have been told
>there is some locking problem somewhere and there have to be major
>changes before this would work - if I remember correctly. The answer
>gave not the impression that this is rated a high priority problem.
>
>Regards
>Ralf
>
>--
>Van Roy's Law: -------------------------------------------------------
>        An unbreakable toy is useful for breaking other toys.


><< attach4 >>




>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
