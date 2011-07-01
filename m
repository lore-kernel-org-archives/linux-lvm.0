Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p61F5KZr011134
	for <linux-lvm@redhat.com>; Fri, 1 Jul 2011 11:05:20 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p61F5Jlp008990
	for <linux-lvm@redhat.com>; Fri, 1 Jul 2011 11:05:19 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p61F5AKC006031
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 1 Jul 2011 11:05:10 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p61F59fo003769
	for <linux-lvm@redhat.com>; Fri, 1 Jul 2011 11:05:09 -0400
Date: Fri, 1 Jul 2011 11:05:09 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <CA30CF51.11CAC%brian.p.stamper@nasa.gov>
Message-ID: <alpine.LRH.2.00.1107011100030.3606@bmsred.bmsi.com>
References: <CA30CF51.11CAC%brian.p.stamper@nasa.gov>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Fedora 15 lvm root device not found
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 29 Jun 2011, Stamper, Brian P. (ARC-D)[Stinger Ghaffarian Technologies Inc. (SGT Inc.)] wrote:

> I was able to boot this system by taking an initramfs from another Fedora 15
> test system and putting it in /boot and referencing it in grub.conf.
>  However, I need to find out why an initramfs I build on the system is
> unable to boot.
> 
> When I?m in dracut, I was able to do some checking.  Using the lvm commands,
> I was able to activate and deactivate the vg, display the lvs, but not use
> them.  I would get ?device not found?, and in /dev/mapper, the lvm devices
> were not there.  There were other lvm devices there, but not from my primary
> system lvm.  The only thing that stands out about it is that it is ext4, not
> ext3.

This is a Fedora issue, not LVM, and you might try the Fedora IRC chat, but...

Have you tried running mkinitrd again since you got the system booted?
Since you just upgraded, mkinitrd could have screwed up since drivers
and device names may have changed from 13 to 15.  I even had this problem
with CentOS, 5.5 -> 5.6 mkinitrd had to be run again (after booting from
older kernel).

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
