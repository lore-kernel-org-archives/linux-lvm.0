Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6V8oSI5015793
	for <linux-lvm@redhat.com>; Mon, 31 Jul 2006 04:50:28 -0400
Received: from web51107.mail.yahoo.com (web51107.mail.yahoo.com
	[206.190.38.149])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id k6V8oLpW012428
	for <linux-lvm@redhat.com>; Mon, 31 Jul 2006 04:50:22 -0400
Message-ID: <20060731085016.37744.qmail@web51107.mail.yahoo.com>
Date: Mon, 31 Jul 2006 01:50:16 -0700 (PDT)
From: Dave <davo_muc@yahoo.com>
Subject: Re: [linux-lvm] LVM1 - "VGDA in kernel and lvmtab are NOT
	consistent"error following lvm operations
In-Reply-To: <20060728103709.9701312EDE@bluewhale.planbit.co.uk>
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
To: LVM general discussion and development <linux-lvm@redhat.com>



Hello,

I have slightly more info re: this error message I'm seeing.  After running vgdisplay and getting the message:

    VGDA in kernel and lvmtab are NOT consistent

I issued an $? to see the exit code and it was 98, which is explained as:

    invalid lvmtab (run vgscan(8))

in the vgdisplay man page.  How does the lvmtab become invalid?  

I do not want to have to reboot (because this will cause an outage for our customers), but I know from previous experience that the error message will disappear following a reboot.  I'm also hesitant to add new disks, vg's, lv's, and file systems until I can run vgdisplay without an error.  Should I be concerned re: this message???


Thanks!
Dave
