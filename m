Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p6JJD4DM021974
	for <linux-lvm@redhat.com>; Tue, 19 Jul 2011 15:13:04 -0400
Received: from cdptpa-omtalb.mail.rr.com (cdptpa-omtalb.mail.rr.com
	[75.180.132.121])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6JJD3YX030241
	for <linux-lvm@redhat.com>; Tue, 19 Jul 2011 15:13:03 -0400
Message-ID: <4E25D73E.9050807@cfl.rr.com>
Date: Tue, 19 Jul 2011 15:13:02 -0400
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
References: <CA30349F.11C2A%brian.p.stamper@nasa.gov>
In-Reply-To: <CA30349F.11C2A%brian.p.stamper@nasa.gov>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Mail etiquette ( was: Fedora 15 lvm root device not
 found )
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Lee Gold <leegold@operamail.com>

You appear to have sent this message as a reply to my message in the 
thread with the subject "Help to mount ext3 boot partiton which reports 
it's LVM2_member when I try to mount it".  As a result, it shows up as a 
reply in that thread, when you really meant to start a new thread.  This 
causes needless confusion and is poor etiquette.

In the future, when you mean to compose a new message, please do not 
reply to an existing one and delete all of the quotations and change the 
subject line.

On 6/29/2011 4:47 AM, Stamper, Brian P. (ARC-D)[Stinger Ghaffarian
Technologies Inc. (SGT Inc.)] wrote:
> I just upgraded a Fedora system from 13 to 15, and now I can't get it
> to boot.  I'm getting dumped to a dracut shell and getting the error
> dm-linear device lookup failed.  In the dracut output with debug on,
> I see dracut scan my drives, and I see it find my 3 LVs, but it then
> tries to do something with them, I get the error, and it then fails
> out with root device not found and drops me into dracut.
>
> Here's the odd thing, booting off the rescue dvd my volumes are fine.
> The LVM can be mounted no problem.
>
> This makes me think that there's something missing from the kernel or
> initrd.  I can't really figure out what though.  I've gone through
> the output of lsmod when running from the rescue dvd.  I've even
> build a few ramdisks including all the modules that I thought might
> be related (dm, lvm, mdraid, dmraid, multipath).  I tried building
> them with mkinitrd -with=module, and I tried again with dracut
> -add=modules.  No change in results.
>
> I'm not sure where to go from here.  I feel like the system can be
> rescued, but I don't know how to work backward through dracut to find
> out why it's unable to find my root volume.  Any help would be
> appreciated.  Cross-posting to dm-devel.
>
> Thanks, -Brian
