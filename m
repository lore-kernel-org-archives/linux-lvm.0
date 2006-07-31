Received: from o.ww.redhat.com (vpn-4-43.stuttgart.redhat.com [10.32.4.43])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6VE9NOq024837
	for <linux-lvm@redhat.com>; Mon, 31 Jul 2006 10:09:23 -0400
Date: Mon, 31 Jul 2006 16:09:20 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] LVM1 - "VGDA in kernel and lvmtab are NOT
	consistent"error following lvm operations
Message-ID: <20060731140920.GA2967@redhat.com>
References: <20060728103709.9701312EDE@bluewhale.planbit.co.uk>
	<20060731085016.37744.qmail@web51107.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20060731085016.37744.qmail@web51107.mail.yahoo.com>
Reply-To: mauelshagen@redhat.com,
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
To: Dave <davo_muc@yahoo.com>, LVM general discussion and development <linux-lvm@redhat.com>

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
