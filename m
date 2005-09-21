Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8LHN8V29598
	for <linux-lvm@redhat.com>; Wed, 21 Sep 2005 13:23:08 -0400
Received: from mail4.mckesson.com (mail4.mckesson.com [143.112.129.39])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j8LHMxlM005846
	for <linux-lvm@redhat.com>; Wed, 21 Sep 2005 13:23:00 -0400
From: "Allen, Jack" <Jack.Allen@McKesson.com>
Message-ID: <C28DB247D333BC47BBAAFDC914DE39010261F5DE@atlexc07ntms.mckesson.com>
Subject: RE: [linux-lvm] Directly using a logical volume
Date: Wed, 21 Sep 2005 13:23:40 -0400
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: 'LVM general discussion and development' <linux-lvm@redhat.com>



-----Original Message-----
From: Lars Ellenberg [mailto:Lars.Ellenberg@linbit.com] 
Sent: Wednesday, September 21, 2005 8:58 AM
To: linux-lvm@redhat.com
Subject: Re: [linux-lvm] Directly using a logical volume


/ 2005-09-20 16:14:25 -0400
\ Allen, Jack:
>         I have a system connected to a SAN via Fibre Channel interface.
> The system sees 3 disk sdb, sdc and sdd. I put them in a volume group
> and then allocated some logical volumes. If I use the logical volume to
> read and write to directly for my application, if there is an error on a
> write, I assume the write system call will return an error. Or does the
> write give a good return value after putting the data in some system
> buffer to be written later? Then is the write of the system buffer fails
> later, my program would not know.

not exactly a linux-lvm question, is it?

man 2 write
man 2 fsync
man 3 open       (O_SYNC)

-- 
: Lars Ellenberg                                  Tel +43-1-8178292-0  :
: LINBIT Information Technologies GmbH            Fax +43-1-8178292-82 :
: Schoenbrunner Str. 244, A-1120 Vienna/Europe   http://www.linbit.com :

_______________________________________________

I have read the man pages and that would be "man 2 open". The O_SYNC seems
to only work for a regular file not a block device as the logical volume is.
This was part of the reason for my questions. On UNIX systems we use the
character device name and the O_SYNC does what you think it would there. I
know this is Linux and some things are different. Again the reason for my
questions. And yes it could be a linux-lvm question if the block device
presented by LVM works differently than a true SCSI block device. Again the
reason for the questions.

Thanks:
	Jack Allen
