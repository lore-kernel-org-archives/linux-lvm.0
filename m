Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o97HdHua002237
	for <linux-lvm@redhat.com>; Thu, 7 Oct 2010 13:39:17 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o97Hd5BR025170
	for <linux-lvm@redhat.com>; Thu, 7 Oct 2010 13:39:05 -0400
Received: from r74-192-2-154.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.2.154] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1P3uQi-0003Iy-Pe
	for linux-lvm@redhat.com; Thu, 07 Oct 2010 10:39:01 -0700
Date: Thu, 07 Oct 2010 12:38:55 -0500
From: Ray Morris <support@bettercgi.com>
In-Reply-To: <AANLkTikzS14BL5PkbLm12_555khqLYGmDaDY+hV8gz2a@mail.gmail.com>
	(from farchanjo@gmail.com on Thu Oct  7 12:12:56 2010)
Message-Id: <1286473135.2287.0@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="Flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

> I wanted to use GRUB with UUID when i pass the
> boot flags root=. When i did this, my system cannot mount the root
> more.

root= is not a grub argument, it's a kernel argument.
If it's wrong, you'll get a few dozen lines of output and then
it'll say "can not mount root filesystem" or something similar.

root (hd0,0) would be grub.  If it's wrong, you'll get less than
a dozen lines of output before the error message.

Try mounting first with root=/dev/sda2 or whatever, then double
check a) the UUID and b) the syntax you're using, which should be
something like:
root=UUID=xxx

If the root volume isn't a plain disk partition, but is rather
a logical voume or mdadm, your initrd will need to include lvm,
raid, or whatever else is needed to get the root volume up and
running.

See also super grub disk, which can be helpful for figuring all
of this stuff out.
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 10/07/2010 12:12:56 PM, Fabricio Archanjo wrote:
> Hey all,
> 
> 
> Sorry because my stupid question, but i don't know more. I'm using
> Debian with LVM and I wanted to use GRUB with UUID when i pass the
> boot flags root=. When i did this, my system cannot mount the root
> more. May someone know why it happend? is there a problem with GRUB
> v1??
> 
> 
> Thanks all,
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
