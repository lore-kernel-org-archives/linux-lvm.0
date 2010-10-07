Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o97I7sM9009787
	for <linux-lvm@redhat.com>; Thu, 7 Oct 2010 14:07:54 -0400
Received: from mail-ww0-f46.google.com (mail-ww0-f46.google.com [74.125.82.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o97I7ivg015302
	for <linux-lvm@redhat.com>; Thu, 7 Oct 2010 14:07:44 -0400
Received: by wwb31 with SMTP id 31so130256wwb.27
	for <linux-lvm@redhat.com>; Thu, 07 Oct 2010 11:07:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1286473135.2287.0@raydesk1.bettercgi.com>
References: <AANLkTikzS14BL5PkbLm12_555khqLYGmDaDY+hV8gz2a@mail.gmail.com>
	<1286473135.2287.0@raydesk1.bettercgi.com>
Date: Thu, 7 Oct 2010 15:07:41 -0300
Message-ID: <AANLkTim47CB0WAX9jbZXYP5LFqtjJ_3G1cMHwxFunPbb@mail.gmail.com>
From: Fabricio Archanjo <farchanjo@gmail.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Grub with UUID
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

Ray,
When I use root=3D/dev/mapper/myvg-root (example) i can mount my root
partition, but when  i use UUID  i cannot mount and the lvm was
included in initramfs, i've checked it. It's too strange..

I get my UUID through vol_id, it's a tools of udev.

Thanks for reply,

On Thu, Oct 7, 2010 at 2:38 PM, Ray Morris <support@bettercgi.com> wrote:
>> I wanted to use GRUB with UUID when i pass the
>> boot flags root=3D. When i did this, my system cannot mount the root
>> more.
>
> root=3D is not a grub argument, it's a kernel argument.
> If it's wrong, you'll get a few dozen lines of output and then
> it'll say "can not mount root filesystem" or something similar.
>
> root (hd0,0) would be grub. =EF=BF=BDIf it's wrong, you'll get less than
> a dozen lines of output before the error message.
>
> Try mounting first with root=3D/dev/sda2 or whatever, then double
> check a) the UUID and b) the syntax you're using, which should be
> something like:
> root=3DUUID=3Dxxx
>
> If the root volume isn't a plain disk partition, but is rather
> a logical voume or mdadm, your initrd will need to include lvm,
> raid, or whatever else is needed to get the root volume up and
> running.
>
> See also super grub disk, which can be helpful for figuring all
> of this stuff out.
> --
> Ray Morris
> support@bettercgi.com
>
> Strongbox - The next generation in site security:
> http://www.bettercgi.com/strongbox/
>
> Throttlebox - Intelligent Bandwidth Control
> http://www.bettercgi.com/throttlebox/
>
> Strongbox / Throttlebox affiliate program:
> http://www.bettercgi.com/affiliates/user/register.php
>
>
> On 10/07/2010 12:12:56 PM, Fabricio Archanjo wrote:
>>
>> Hey all,
>>
>>
>> Sorry because my stupid question, but i don't know more. I'm using
>> Debian with LVM and I wanted to use GRUB with UUID when i pass the
>> boot flags root=3D. When i did this, my system cannot mount the root
>> more. May someone know why it happend? is there a problem with GRUB
>> v1??
>>
>>
>> Thanks all,
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
