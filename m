Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3SDdrv24858
	for <linux-lvm@redhat.com>; Wed, 28 Apr 2004 09:39:53 -0400
Subject: Re: [linux-lvm] Looking for RedHat Linux Help!!!
From: Jeffrey Layton <jtlayton@poochiereds.net>
In-Reply-To: <3ADAEFA2E3DEA54BA343F18E4416D625212EBC@leavb1doimexs2.leavenworth.army.mil>
References: <3ADAEFA2E3DEA54BA343F18E4416D625212EBC@leavb1doimexs2.leavenworth.army.mil>
Message-Id: <1083159590.20355.13.camel@tesla.mmt.bellhowell.com>
Mime-Version: 1.0
Date: Wed, 28 Apr 2004 09:39:50 -0400
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

On Tue, 2004-04-27 at 11:58, Brennaman, Molly Ms NSC wrote:
> To Whom it May Concern:
>     I found this addresss on a website.  I am a Linux novice with a
> big job at hand.  We are converting from VAX VMS to Linux and are
> transferring files to a server.  We have multiple users accessing
> files on the server.  How can we ensure that when A opens a file, that
> A has a write-lock on the file so if B opens the same file - B only
> has read access until A closes the file???  Any assistance would be
> greatly appreciated.
> 
> Molly

First, this is a list for the logical volume manager in Linux, so you're
probably asking this in the wrong place. You might try a more general
red hat users forum or something.

Most Linux filesystems, however, allow for advisory locking through the
fcntl() system call. Advisory locks are like stoplights -- they only
work if all programs respect them. You haven't said anything about how
your users are accessing files, so it's tough to know whether the
programs you're using respect (and set) fcntl locks (however most well
written programs do).

Some linux filesystems allow you to mount them with a -o mand option,
which will enforce manditory locking.

In any case, your software needs to set the correct flags to lock the
files when opening them.

See the fcntl(2) manpage for more info, and check the source code of
your software (or check with the vendor) to find out whether it does
fcntl locks.

Hope this helps,
Jeff
