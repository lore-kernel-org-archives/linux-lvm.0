Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r8SKgCIS025752
	for <linux-lvm@redhat.com>; Sat, 28 Sep 2013 16:42:12 -0400
Received: from Ishtar.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8SKgAl7002207
	for <linux-lvm@redhat.com>; Sat, 28 Sep 2013 16:42:11 -0400
Received: from [192.168.4.12] (Athenae [192.168.4.12])
	by Ishtar.tlinx.org (8.14.7/8.14.4/SuSE Linux 0.8) with ESMTP id
	r8SKg6N7002733
	for <linux-lvm@redhat.com>; Sat, 28 Sep 2013 13:42:09 -0700
Message-ID: <52473F1E.80704@tlinx.org>
Date: Sat, 28 Sep 2013 13:42:06 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
References: <521871FD.8000700@mglug.de> <5225B49B.6050904@redhat.com>
In-Reply-To: <5225B49B.6050904@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] buffers shared between different devs? (was: howto
	speed-up thinpool-devices?)
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 9/3/2013 3:06 AM, Marian Csontos wrote:
> Buffers may be more relevant metric as the I/O among snapshots is 
> "shared" on block device level.
----
I am not going to say this isn't true, BUT, some parts of the kernel seem to
report different block numbers for files on the same device  when you mount
the same device (or possible subtrees of a same device) at alternate mount
points via "bind".

I have my "/usr/share" physically located on my "/home" partition under
"/home/share".  In moving files from /usr/share/<subdir> to
/home/share/<subdir2>, the coreutils "mv" cmd, actually does a file copy
-- vs. when a file is detected as being on the same device, it usually
does a simple rename.

If 'mv' is seeing different device id's for a file, it's *less probable*,
but possible that such misinformation could exist at lower levels in the
kernel (?).  Do you know whether or not the kernel "knows" they are on the
same device, or is it possible the buffer area of the kernel has the same
bug as the upper level that is reporting different devices to "mv"?
