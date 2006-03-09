Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k29Grb113672
	for <linux-lvm@redhat.com>; Thu, 9 Mar 2006 11:53:37 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k29GrUBg012928
	for <linux-lvm@redhat.com>; Thu, 9 Mar 2006 11:53:30 -0500
Date: Thu, 9 Mar 2006 17:53:29 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] pvmove didn't work - now system won't boot
Message-ID: <20060309165329.GC25789@percy.comedia.it>
References: <6c3e3c670603090729ue151783w37c1c5ac412f7bd1@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6c3e3c670603090729ue151783w37c1c5ac412f7bd1@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Thu, Mar 09, 2006 at 10:29:41AM -0500, Chad Rebuck wrote:
>I ran "pvmove -v /dev/hdc2" to move the data off the drive but it
>stopped before any real drive activity happened.  The system was stuck
>for about 30 minutes not doing anything so I powered off/on.  Now it
>boots into a bash prompt but suggests I run fsck manually.  I noticed
>that lvm only reported that 2 of the 3 physical volumes were found.  I
>can't run any lvm commands from here as I get a 'Locking type 1
>initialization failed'.
>
run lvm commands with --ignorelockingfailure option

>What steps do I take to get the system to boot again?  The root dir is
>part of the lvm volume.  The /boot is separate from the lvm volume but
>maybe this is required anyway for lvm to work.
>
>Thanks,
>Chad
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
