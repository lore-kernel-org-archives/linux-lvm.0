Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i3EGNdj32765
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2004 12:23:39 -0400
In-Reply-To: <406C6F9E.4000400@comedia.it>
Subject: Re: [linux-lvm] Migrate to kernel 2.6 and lvm2 with root fs on lvm1
MIME-Version: 1.0
Message-ID: <OFDBD163B8.070E2479-ON00256E76.0058018F-00256E76.005A0C6B@svunta.os.is>
From: Kjartan Reynir Hauksson <krh@os.is>
Date: Wed, 14 Apr 2004 16:13:29 +0000
Content-Type: multipart/alternative;
	boundary="=_alternative 005A0C6900256E76_="
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
To: linux-lvm@sistina.com

This is a multi-part message in MIME format...

--=_alternative 005A0C6900256E76_=
Content-Type: text/plain; charset="US-ASCII"
Content-Disposition: inline

True, it worked with Mandrake's 2.6.3 kernel.  So basically if anyone 
want's to upgrade from Mandrake 9.2 to 10.0 with root filesystem on lvm1 
this is what I did.
Point urpmi main to a Mandrake 10.0 repository
do 'urpmi --auto-select' which upgrades to Mandrake 10.0 packages
do 'urpmi lvm2'
do 'urpmi kernel-2.6.3-7mdk' to install a new kernel
reboot and select the new kernel during bootup to test the new kernel.

Thanks to Luca for making it so easy :)
-Kjartan




>>Kjartan Reynir Hauksson wrote:
>> I've written earlier on the same subject but never got it resolved so 
I'm
>> going to give it another go since my desktop constantly stalls on me 
with
>> my 2.4 kernel.  I'm now running MDK 10.0 with
>> kernel24-tmp-2.4.25-2.tmp.1mdk rpm package from Thomas Backlund.  This
>Mdk 10 supports LVM1 and LVM2 seamlessly with kernel 2.4 and LVM2 with 
>kernel-2.6.

>Luca Berra wrote:
>you don't have to edit initscripts or do any other modifications by hand
>you only have to be sure you install the lvm2 package.
>
>Then you either:
>- install kernel 2.6 and an initrd that supports lvm2 will be created
>- run /sbin/mkinitrd again against your 2.4 kernel telling it to use lvm2
>
>you can remove the lvm1 package afterwards.
>(you can even switch between lvm1 and lvm2 if you want)
>
>Let me know if you have problems.
>
>-- 
>Luca Berra -- bluca@comedia.it



--=_alternative 005A0C6900256E76_=--
