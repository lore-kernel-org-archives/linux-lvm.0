Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i72ADDa04361
	for <linux-lvm@redhat.com>; Mon, 2 Aug 2004 06:13:13 -0400
Received: from mail.ecdl.hut.fi (mail.ecdl.hut.fi [130.233.167.1])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i72AD6Xn022780
	for <linux-lvm@redhat.com>; Mon, 2 Aug 2004 06:13:07 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.ecdl.hut.fi (Postfix) with ESMTP id DC86E78025
	for <linux-lvm@redhat.com>; Mon,  2 Aug 2004 13:13:00 +0300 (EEST)
Received: from zaphod.ecdl.hut.fi (zaphod.ecdl.hut.fi [130.233.167.69])
	by mail.ecdl.hut.fi (Postfix) with ESMTP id 2EEDE7800E
	for <linux-lvm@redhat.com>; Mon,  2 Aug 2004 13:12:59 +0300 (EEST)
From: Mika =?iso-8859-1?q?L=E4nsirinne?= <Mika.Lansirinne@iki.fi>
Subject: Re: [linux-lvm] old md-partitions to pvs
Date: Mon, 2 Aug 2004 13:13:17 +0300
References: <20040730205126.005F67360A@hormel.redhat.com>
In-Reply-To: <20040730205126.005F67360A@hormel.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Message-Id: <200408021313.18447.Mika.Lansirinne@iki.fi>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

Yes, that's what I wanted. Thanks! (Hadn't used mdadm before, only raidtool=
s).


-Mika

On Thu, 29 Jul 2004 20:19:21 +0200, Luca Berra wrote:
> On Thu, Jul 29, 2004 at 07:41:53PM +0300, Mika L=EF=BF=BDnsirinne wrote:
> >The question is that how could I get rid of those md signatures? pvcreate
>
> mdadm --zero-superblock
>
> --
> Luca Berra -- bluca@comedia.it
>         Communication Media & Services S.r.l.
>  /"\
>  \ /     ASCII RIBBON CAMPAIGN
>   X        AGAINST HTML MAIL
>  / \
>
>
