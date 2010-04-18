Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3IN4Tpm031078
	for <linux-lvm@redhat.com>; Sun, 18 Apr 2010 19:04:29 -0400
Received: from cdptpa-omtalb.mail.rr.com (cdptpa-omtalb.mail.rr.com
	[75.180.132.123])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3IN4G3a002437
	for <linux-lvm@redhat.com>; Sun, 18 Apr 2010 19:04:16 -0400
Message-ID: <4BCB8FEE.9030802@cfl.rr.com>
Date: Sun, 18 Apr 2010 19:04:14 -0400
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
References: <4BCAC8B2.7090505@tvcablenet.be>
In-Reply-To: <4BCAC8B2.7090505@tvcablenet.be>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Problem to remove LVM snaphots
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: =?ISO-8859-1?Q?Fran=E7ois_Valenduc?= <francois.valenduc@tvcablenet.be>

On 04/18/2010 04:54 AM, Fran=EF=BF=BDois Valenduc wrote:
> Hello everybody,
>
> I am using gentoo and I use LVM snapshots to make backups of my system.
> Unfortunately, I always have a problem to remove these. LVM always
> complains that it can't remove an open logical volume. However, the
> snapshot is unmounted when I try to remove it. It seems it's only
> possible to remove the snapshot if the corresponding volume is
> deactivated. So, I am forced to boot on a live cd to remove the snapshot
> of my root partition. Is this really normal ?

No, it is not normal.  Obviously something on your system has the=20
snapshot open.  Perhaps it is being auto mounted?
