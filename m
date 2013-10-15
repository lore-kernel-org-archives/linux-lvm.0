Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r9FAjers032644
	for <linux-lvm@redhat.com>; Tue, 15 Oct 2013 06:45:40 -0400
Received: from mail-bk0-f45.google.com (mail-bk0-f45.google.com
	[209.85.214.45])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r9FAjcGj007966
	for <linux-lvm@redhat.com>; Tue, 15 Oct 2013 06:45:39 -0400
Received: by mail-bk0-f45.google.com with SMTP id mx11so3043457bkb.18
	for <linux-lvm@redhat.com>; Tue, 15 Oct 2013 03:45:38 -0700 (PDT)
Message-ID: <525D1CD1.6090803@gmail.com>
Date: Tue, 15 Oct 2013 12:45:37 +0200
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
MIME-Version: 1.0
References: <CAHuLeS=HDBNcHRPH7nAXhurDs08rcV6LWnjFU2YXSDo8P5Urxg@mail.gmail.com>
In-Reply-To: <CAHuLeS=HDBNcHRPH7nAXhurDs08rcV6LWnjFU2YXSDo8P5Urxg@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] vgcfgrestore crashed, for double free or corruption,
 after some hot swapping of HDDs
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 15.10.2013 05:05, Justin Lee napsal(a):
> *****  Here is the message when vgcfgrestore crashed:
>
> [root@localhost tmp]# vgcfgrestore -f
> /var/lib/3gen/lvm_mirror.vg_hur.metadata.vg vh_hur
>    /dev/md0: read failed after 0 of 2048 at 0: Input/output error
>    /dev/md0: read failed after 0 of 2048 at 600125931520: Input/output error
>    /dev/md0: read failed after 0 of 2048 at 600126033920: Input/output error
>    /dev/md0: read failed after 0 of 2048 at 4096: Input/output error
>    /dev/vg_sdc1/lv_sdc1: read failed after 0 of 4096 at 214748299264:
> Input/output error
>    /dev/vg_sdc1/lv_sdc1: read failed after 0 of 4096 at 214748356608:
> Input/output error
>    /dev/vg_sdc1/lv_sdc1: read failed after 0 of 4096 at 0: Input/output error
>    /dev/vg_sdc1/lv_sdc1: read failed after 0 of 4096 at 4096: Input/output error
>    Couldn't find device with uuid 5sNFQj-9DrG-abBO-cKnP-rP7g-i9Lc-47rpfX.
>    '/var/lib/3gen/lvm_mirror.vg_hur.metadata.vg' does not contain
> volume group 'vh_hur'.
> *** glibc detected *** vgcfgrestore: double free or corruption
> (!prev): 0x0000000001ed0620 ***
> ======= Backtrace: =========
> /lib64/libc.so.6(+0x75146)[0x7ffcdf999146]
>

Has been fixed with release of 2.02.99

Zdenek
