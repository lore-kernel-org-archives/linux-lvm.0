Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9RFRgr26326
	for <linux-lvm@redhat.com>; Wed, 27 Oct 2004 11:27:42 -0400
Received: from sphinx.mythic-beasts.com (sphinx.mythic-beasts.com
	[212.69.37.6])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id i9RFRf8f013574
	for <linux-lvm@redhat.com>; Wed, 27 Oct 2004 11:27:41 -0400
Received: from pdw by sphinx.mythic-beasts.com with local (Exim 4.34)
	id 1CMpi8-000504-6q
	for linux-lvm@redhat.com; Wed, 27 Oct 2004 16:27:40 +0100
Date: Wed, 27 Oct 2004 16:27:40 +0100
From: Paul Warren <pdw@ex-parrot.com>
Subject: Re: [linux-lvm] High loads when writting to LVM
Message-ID: <20041027162740.J24976@sphinx.mythic-beasts.com>
References: <417FBB3D.6060002@ist.ucf.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <417FBB3D.6060002@ist.ucf.edu>;
	from jtracy@ist.ucf.edu on Wed, Oct 27, 2004 at 11:14:05AM -0400
Sender: Paul Warren <pdw@sphinx.mythic-beasts.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Oct 27, 2004 at 11:14:05AM -0400, Judd Tracy wrote:
> I have a system that I am testing out lvm on to get a feeling about 
> stability and performance.  Stability right now seems good, but I am a 
> little worried about the performance currently I am writing out a large 
> file ~1TB using dd if=/dev/zero of=test bs=1M and am noticing the load 
> seams extreamly high "5.21, 5.26, 5.17".  Most of the work is being done 
> in dd but I also notice that kswapd0 is also working fairly heavily.  Is 
> this to be expected with LVM or do i have things setup wrong.  Write 
> performance seems to be around 100MB/s on an XFS filesystem.

This may be a result of how load average is calculated.  What is the CPU
usage when doing these (see top)?  On a machine with a large number of
processes accessing the disk, it is quite easy for a single, I/O
intensive application (such as your dd) to drive the load up.

The load average is telling you that you have 5 processes blocked
waiting for I/O.  Without the dd, the time taken to service each is
reduced, and the average number blocked at any given time is therefore
lower.

On our combined shell/web/email server, an I/O intensive process will
result in a load of well over 10, yet responsiveness of the system
is not actually that bad, and cpu usage remains low.

Paul
