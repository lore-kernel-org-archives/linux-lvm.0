Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6VAonb8006791
	for <linux-lvm@redhat.com>; Mon, 31 Jul 2006 06:50:49 -0400
Message-ID: <20060731105036.82906.qmail@web51110.mail.yahoo.com>
Date: Mon, 31 Jul 2006 03:50:36 -0700 (PDT)
From: Dave <davo_muc@yahoo.com>
Subject: Re: [linux-lvm] LVM1 - "VGDA in kernel and lvmtab are NOT
	consistent"error following lvm operations
In-Reply-To: <20060731085016.37744.qmail@web51107.mail.yahoo.com>
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
To: Dave <davo_muc@yahoo.com>
Cc: Linux-LVM@Sistina.com

Hi again,

Some more information re: this problem.  On the 2 (clustered) systems current displaying this error, I see four disks which are being report by pvscan as "inactive" and "exported".  They are reported this way by both hosts, however, the file systems that rely on these four disks are actually mounted an in use on one system.

Thus, my question is, how can I "alert" lvm as to the real status of these disks and have it update it's status information?  If I run vgimport or vgchange to try and get the status right, will that affect the already mounted file systems (which rely on those volume groups)?

Thanks,
Dave


----- Original Message ----
From: Dave <davo_muc@yahoo.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Sent: Monday, July 31, 2006 10:50:16 AM
Subject: Re: [linux-lvm] LVM1 - "VGDA in kernel and lvmtab are NOT consistent"error following lvm operations



Hello,

I have slightly more info re: this error message I'm seeing.  After running vgdisplay and getting the message:

    VGDA in kernel and lvmtab are NOT consistent

I issued an $? to see the exit code and it was 98, which is explained as:

    invalid lvmtab (run vgscan(8))

in the vgdisplay man page.  How does the lvmtab become invalid?  

I do not want to have to reboot (because this will cause an outage for our customers), but I know from previous experience that the error message will disappear following a reboot.  I'm also hesitant to add new disks, vg's, lv's, and file systems until I can run vgdisplay without an error.  Should I be concerned re: this message???


Thanks!
Dave


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
