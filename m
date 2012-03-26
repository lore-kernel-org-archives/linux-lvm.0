Received: from mx2.redhat.com (ext-mx01.rdu.redhat.com [10.11.45.6])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q2QHno9U012318
	for <linux-lvm@redhat.com>; Mon, 26 Mar 2012 13:49:50 -0400
Received: from titan.nuclearwinter.com (titan.nuclearwinter.com
	[209.40.204.131])
	by mx2.redhat.com (8.13.8/8.13.8) with ESMTP id q2QHnnuM021325
	for <linux-lvm@redhat.com>; Mon, 26 Mar 2012 13:49:49 -0400
Message-ID: <4F70AC36.1050207@nuclearwinter.com>
Date: Mon, 26 Mar 2012 12:49:42 -0500
From: Larkin Lowrey <llowrey@nuclearwinter.com>
MIME-Version: 1.0
References: <4F6ECF9B.40907@nuclearwinter.com>
	<33016A114D6EF84EB47C507EA7AFCC5703FC8D@SN2PRD0802MB113.namprd08.prod.outlook.com>
In-Reply-To: <33016A114D6EF84EB47C507EA7AFCC5703FC8D@SN2PRD0802MB113.namprd08.prod.outlook.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM commands extremely slow during raid check/resync
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: James Candelaria <jc@whiptailtech.com>

Thank you for the reply.

I/O does slow down during the raid check and that's to be expected, but
two minutes to create  a snapshot seems excessive. I only experience a
few seconds delay when modifying and copying files. It is hard to
imagine how those operations can complete in seconds while lvs and
lvcreate take minutes. I suppose if lvm was issuing a lot of fsyncs then
a delay of that magnitude could be expected.

This phenomenon did not occur when I was still running Fedora 15 so
something changed.

--Larkin

On 3/26/2012 8:02 AM, James Candelaria wrote:
> Larkin,
>
> This is likely due to the way the scheduler and MD driver are interacting.  The MD driver has likely filled the queue of the devices pretty deep with read requests, then when you attempt to run a LVM command such as lvcreate your request gets inserted.  You must "wait-in-line" for this command (likely only a few sectors worth of IO) to get its turn on the media.  The MD driver realizes that there is another request to the media and slows itself briefly, but since there is no further IO after the LVM command it then goes back to its job of resyncing your array in earnest.
>
> James
>
>
> -----Original Message-----
> From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Larkin Lowrey
> Sent: Sunday, March 25, 2012 3:56 AM
> To: linux-lvm@redhat.com
> Subject: [linux-lvm] LVM commands extremely slow during raid check/resync
>
> I've been suffering from an extreme slowdown of the various lvm commands
> during high I/O load ever since updating from Fedora 15 to 16.
>
> I notice this particularly Sunday AMs when Fedora kicks of a raid-check.
> What is normally near instantaneous, commands like lvs and lvcreate
> --snapshot take minutes to complete (literally). This causes my backup
> jobs to timeout and fail.
>
> While all this is going on, the various filesystems are reasonably
> responsive (considering the raid-check is running) and I can read/write
> to files without problems. It seems that this slow-down is unique to lvm.
>
> I have three raid 5 arrays of 8, 6, and 6 drives. The root fs sits
> entirely within the 8 disk array as does the spare area used for snapshots.
>
> Interestingly, perhaps, if I can coax a backup into running, the lvs
> command, for example, will complete in just 15-30 seconds instead of
> 120-180s. It would seem that the random I/O of the backup is able to
> break things up enough for the lvm commands to squeeze in.
>
> I'm at a loss for what to do about this or what data to scan for clues.
> Any suggestions?
>
> kernel 3.2.10-3.fc16.x86_64
>
> lvm> version
>   LVM version:     2.02.86(2) (2011-07-08)
>   Library version: 1.02.65 (2011-07-08)
>   Driver version:  4.22.0
>
> --Larkin
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
