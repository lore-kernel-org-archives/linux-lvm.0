Received: from [10.34.32.13] (mazyland.brq.redhat.com [10.34.32.13])
	by pobox.stuttgart.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l49FIX24007911
	for <linux-lvm@redhat.com>; Wed, 9 May 2007 17:18:33 +0200
Message-ID: <4641E649.4050607@redhat.com>
Date: Wed, 09 May 2007 17:18:33 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] mirrored lv with 6TB
References: <4641D430.1010101@cargo-partner.com>
	<4641D81D.1040009@cargo-partner.com>
In-Reply-To: <4641D81D.1040009@cargo-partner.com>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

Michael Eisenk=EF=BF=BDlbl / FIS wrote:
> *i am currently using the kernel 2.6.9-42.0.3.ELsmp and=20
> lvm2-2.02.06-6.0.RHEL4 on RHEL4.4 (32bitCPU) and i have three disks:*
...
> kernel: EIP is at bio_set_alloc+0x95/0x11c [dm_mod]

Bioset allocation code in device mapper is different in RHEL4.5,
please test it with RHEL4.5 update.

If you hit this bug again, please use Red Hat support or bugzilla
to report this problem, thanks.

Milan
--
mbroz@redhat.com
