Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4GBiJ000607
	for <linux-lvm@redhat.com>; Sun, 16 May 2004 07:44:19 -0400
Received: from monkey.sneakemail.com (clean.sneakemail.com [38.136.15.35])
	by mx3.redhat.com (8.12.10/8.12.10) with SMTP id i4GBiD8K012343
	for <linux-lvm@redhat.com>; Sun, 16 May 2004 07:44:14 -0400
Message-ID: <22463-19176@sneakemail.com>
Date: Sun, 16 May 2004 13:44:06 +0200
From: "Peter Valdemar Morch" <swp5jhu02@sneakemail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] /boot on lvm?
References: <40A72846.5050801@mlug.missouri.edu>
In-Reply-To: <40A72846.5050801@mlug.missouri.edu>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@redhat.com

Running RH9 with /root on LVM gave me no end of headaches when upgrading=20
to 2.6 kernels. Primarily because I had to make a initrd RAM disk image.

So now it works fine. But next time I set up my own box, I'll make sure=20
that at least /boot and /root are no-frills partitions.

Peter

Michael mogmios-at-mlug.missouri.edu |Lists| wrote:
> Is it okay to put everything, including /boot and other critical Linux=20
> files on an LVM drive? How about swap space?
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--=20
Peter Valdemar M=EF=BF=BDrch
http://www.XXXXXXXXX
