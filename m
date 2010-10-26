Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id o9QIu58N026887
	for <linux-lvm@redhat.com>; Tue, 26 Oct 2010 14:56:06 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o9QItt6V021860
	for <linux-lvm@redhat.com>; Tue, 26 Oct 2010 14:55:55 -0400
Received: from r74-192-2-154.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.2.154] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1PAogZ-0005D5-56
	for linux-lvm@redhat.com; Tue, 26 Oct 2010 11:55:51 -0700
Date: Tue, 26 Oct 2010 13:55:50 -0500
From: Ray Morris <support@bettercgi.com>
In-Reply-To: <20101026184139.GA32464@us.ibm.com> (from malahal@us.ibm.com on
	Tue Oct 26 13:41:39 2010)
Message-Id: <1288119350.22010.8@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Determine boot disk device name...
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
Content-Type: text/plain; charset="utf-8"; delsp="Yes"; format="Flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

    Lacking any better answers so far, you can:

Look for grub.conf / lilo
check each device for a valid boot block (begins with EB 48 90 on x64)
Restate the question to specify what you actually want to accomplish.

    As an example of the last option, someone might try to figure
out which disk was booted from in order see which bootloader is there,
and that information will be used to do some other task, call it "task  
C".
It may be possible to figure out which bootloader it is without knowing
which device was booted from, and it may be possible to do "task C"
without either of the previously discussed steps.
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 10/26/2010 01:41:39 PM, Malahal Naineni wrote:
> Alexander Skwar [alexanders.mailinglists+nospam@gmail.com] wrote:
> >    Hi!
> >    2010/10/25 Malahal Naineni <[1]malahal@us.ibm.com>
> >
> >      Alexander Skwar [[2]alexanders.mailinglists+nospam@gmail.com]  
> wrote:
> >      >    I also wanted to suggest this, but…
> >      >
> >      >    benutzer@horst:~$ cat /proc/cmdline
> >      >    root=/dev/xvda1 ro
> >
> >      I got confused with boot and root! Thanks for correction.  
> Usually boot
> >      disk is mounted at /boot. Your boot disk could be same as root  
> disk (in
> >      this case there would not be anything mounted at /boot but  
> just a
> >      directory).
> >
> >    Well, but even the location of the /boot directory/partition  
> doesn't
> >    necessarily tell, from where someone booted - suppose, you've got
> >    a boot disk /dev/sda. On /dev/sda, there's grub. Grub's setup so,
> >    that it boots a system/kernel, which is on /dev/sdb. The system
> >    is "self contained" on /dev/sdb.
> >
> >    In such a case, the system would've been booted from /dev/sda,
> >    but there's no way to tell that, once the "/dev/sdb system" has
> >    been started - or is there?
> 
> Once loader's job is done, it is not needed and I don't think there  
> is a
> way to find out your boot disk in all __situations__ as I said before.
> In fact, you can use a USB disk as your boot disk and remove it after
> boot.
> 
> Thanks, Malahal.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
