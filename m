Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1RL15Ko028511
	for <linux-lvm@redhat.com>; Tue, 27 Feb 2007 16:01:05 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l1RL13ku024015
	for <linux-lvm@redhat.com>; Tue, 27 Feb 2007 16:01:04 -0500
Date: Tue, 27 Feb 2007 22:01:03 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] lvextend problem
Message-ID: <20070227210103.GA23712@percy.comedia.it>
References: <45E45454.6000402@yahoo-inc.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <45E45454.6000402@yahoo-inc.com>
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

On Tue, Feb 27, 2007 at 04:55:00PM +0100, Guilio Iannazzo wrote:
>Hi,
>about the *environment* :
>[root@priscilla var]# cat /proc/version
>Linux version 2.4.21-20.ELsmp (bhcompile@tweety.build.redhat.com) (gcc 
>version 3.2.3 20030502 (Red Hat Linux 3.2.3-42)) #1 SMP Wed Aug 18 
>20:46:40 EDT 2004
>
>The *problem* :
>I extended a logical volume following the procedure
>
>umount -l /dev/Volume00/var

from umount man page:
       -l     Lazy unmount. Detach the filesystem from the filesystem  hierar-
              chy now, and cleanup all references to the filesystem as soon as
              it is not busy anymore.  (Requires kernel 2.4.11 or later.)

the key phrase here is: "as soon as it is not busy anymore"

>lvextend -L+5G /dev/Volume00/var
harmless

>e2fsck -f /dev/Volume00/var
so you fscked an active filesystem, bad bad bad...

--- i think you wanted to resize2fs here ---
>mount -l /dev/Volume00/var
'mount -l' is _not_ the opposite of 'umount -l'

....
>
>Now, once the filesystem mounted, I've lost all the data I had on /var 
>(which I didn't back up, I know I know it's extremely stupid, luckily 
>enough this is not a production machine).
>For example
>
>[root@priscilla var]# ll /var/
>total 0
>
>however
>
>[root@priscilla var]# mkdir /var/log
>mkdir: cannot create directory `/var/log': File exists
>
>??
>What happened ? How to get all the data back ?
is the filesystem really mounted now?

- reboot the machine into single user
- fsck the filesystem again
- and try mounting it and check all data is still here.
if it is:
- backup your data
- umount the filesystem (really, not using -l)
- fsck -f 
- resize2fs
- mount again
- return to multi-user

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
