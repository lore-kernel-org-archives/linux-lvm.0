Sender: alewis@redhat.com
Subject: Re: [linux-lvm] kernel 2.6 + LVM 1.0.8
References: <mailman.15273.1098718671.3231.linux-lvm@redhat.com>
From: AJ Lewis <alewis@redhat.com>
Date: 25 Oct 2004 14:05:29 -0500
Message-ID: <x05breq7h52.fsf@null.msp.redhat.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Mariano Cunietti <mcunietti@enter.it>

"Mariano Cunietti" <mcunietti@enter.it> writes:

> can you please address me to some *useful* informatioin about
> patching linux 2.6.9 kernel source for compiling LVM 1.0.8 support?
> I read the /PATCHES readme but i always get a "You haven't applied
> the rawio patch, please see the README" My system is a RH Enterprise
> 3ES (unlicensed), I'm trying to compile a Vanilla 2.6.9 kernel on it
> I've been googling around since yesterday, but I can't find out any
> solution (neither on RedHat website)

That's because you can't use LVM 1.0.8 with a 2.6 kernel.  You need to
use the device-mapper kernel module and LVM2.  Please read the LVM
Howto at http://www.tldp.org/HOWTO/LVM-HOWTO/ - especially the LVM2
FAQ entries for information about LVM2.  Also
http://sources.redhat.com/lvm2/ and http://sources.redhat.com/dm/ will
be useful.

LVM2 will work with your LVM1 volumes.

Regards,
-- 
AJ Lewis                                   Voice:  612-638-0500
Red Hat Inc.                               E-Mail: alewis@redhat.com
720 Washington Ave. SE, Suite 200
Minneapolis, MN 55414
   
Current GPG fingerprint = D9F8 EDCE 4242 855F A03D  9B63 F50C 54A8 578C 8715
Grab the key at: http://people.redhat.com/alewis/gpg.html or one of the
many keyservers out there...
