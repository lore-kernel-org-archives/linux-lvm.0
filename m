Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6VFH9cF016148
	for <linux-lvm@redhat.com>; Mon, 31 Jul 2006 11:17:09 -0400
Received: from web51114.mail.yahoo.com (web51114.mail.yahoo.com
	[206.190.39.91])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	k6VFH0Cl029918
	for <linux-lvm@redhat.com>; Mon, 31 Jul 2006 11:17:05 -0400
Message-ID: <20060731151654.24449.qmail@web51114.mail.yahoo.com>
Date: Mon, 31 Jul 2006 08:16:54 -0700 (PDT)
From: Dave <davo_muc@yahoo.com>
Subject: Re: [linux-lvm] LVM1 - "VGDA in kernel and lvmtab are NOT
	consistent"error following lvm operations
In-Reply-To: <20060731140920.GA2967@redhat.com>
MIME-Version: 1.0
Reply-To: Dave <davo_muc@yahoo.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mauelshagen@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

Hi Heinz,

Thanks for your message.  To answer your questions...

The root filesystem has over 50 GB available.  I ran vgscan but that did not improve the situation.  What we were able to do to get vgdisplay to not output an error was...

1)  modify the /etc/lvmtab file to include the filesystem which LVM claims is inactive and exported (even though it is in mounted and in use)

2)  cp /etc/lvmconf/${vg}.conf /etc/lvmtab.d/${vg}

3)  after steps 1 and 2, vgdisplay shows information regarding both volume groups defined;  however, pvscan still shows one volume group as inactive and exported;  we determined this must be due to a flag on the disks themselves, because /proc/lvm kernel info seems to show both volume groups as active

Any other info on why volume group status is not kept accurate by LVM is appreciated!!  Is this perhaps a bug with LVM v 1.08

Thanks!
Dave

----- Original Message ----
From: Heinz Mauelshagen <mauelshagen@redhat.com>
To: Dave <davo_muc@yahoo.com>; LVM general discussion and development <linux-lvm@redhat.com>
Sent: Monday, July 31, 2006 4:09:20 PM
Subject: Re: [linux-lvm] LVM1 - "VGDA in kernel and lvmtab are NOT consistent"error following lvm operations

On Mon, Jul 31, 2006 at 01:50:16AM -0700, Dave wrote:
> 
> 
> Hello,
> 
> I have slightly more info re: this error message I'm seeing.  After running vgdisplay and getting the message:
> 
>     VGDA in kernel and lvmtab are NOT consistent
> 
> I issued an $? to see the exit code and it was 98, which is explained as:
> 
>     invalid lvmtab (run vgscan(8))

E.g. because your root fs is full.
FYI: all lvm commands changing the configuration write the lvmtab.

Have you tried running vgscan yet ?

Heinz

> 
> in the vgdisplay man page.  How does the lvmtab become invalid?  
> 
> I do not want to have to reboot (because this will cause an outage for our customers), but I know from previous experience that the error message will disappear following a reboot.  I'm also hesitant to add new disks, vg's, lv's, and file systems until I can run vgdisplay without an error.  Should I be concerned re: this message???
> 
> 
> Thanks!
> Dave
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
Storage Development                               56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            PHONE +49  171 7803392
                                                  FAX   +49 2626 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
