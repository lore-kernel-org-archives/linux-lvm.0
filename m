Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6TIJOa20627
	for <linux-lvm@redhat.com>; Thu, 29 Jul 2004 14:19:24 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i6TIJNe1000820
	for <linux-lvm@redhat.com>; Thu, 29 Jul 2004 14:19:24 -0400
Date: Thu, 29 Jul 2004 20:19:21 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] old md-partitions to pvs
Message-ID: <20040729181921.GC19952@percy.comedia.it>
References: <200407291941.53919.Mika.Lansirinne@iki.fi>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <200407291941.53919.Mika.Lansirinne@iki.fi>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Jul 29, 2004 at 07:41:53PM +0300, Mika L=EF=BF=BDnsirinne wrote:
>The question is that how could I get rid of those md signatures? pvcreate =


mdadm --zero-superblock

--=20
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
