Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6VGt9TF013948
	for <linux-lvm@redhat.com>; Mon, 31 Jul 2006 12:55:09 -0400
Received: from web51111.mail.yahoo.com (web51111.mail.yahoo.com
	[206.190.39.88])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id k6VGt2W9001745
	for <linux-lvm@redhat.com>; Mon, 31 Jul 2006 12:55:02 -0400
Message-ID: <20060731165456.28513.qmail@web51111.mail.yahoo.com>
Date: Mon, 31 Jul 2006 09:54:56 -0700 (PDT)
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

Hello Heinz and any others who might know the answer to this question,

One other question...  As I mentioned in a separate message, I currently have a volume group which seen as "inactive" and "exported" by two separate systems, both of which have physical access to the volume group over fibre to a SAN.  In this two node cluster, one node should always have the volume group as "active".  In fact, currently one node does have the volume group in use, because they are visible using df and mounted.

I would like to make sure that the status displayed by pvscan is corrected to "active" on that node.  Is it safe to run "vgimport" and "vgchange -ay" on the volume that is active, even though pvscan shows it as "inactive" and "exported"???  Will this cause any problem to the file system that is running on top of that volume group???

Thanks!!
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
