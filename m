From: benr@us.ibm.com
Message-ID: <85256900.006F9EE2.00@d54mta02.raleigh.ibm.com>
Date: Fri, 16 Jun 2000 16:19:10 -0400
Subject: Re: [linux-lvm] IBM to release LVM Technology to the Linux
	 Community
Mime-Version: 1.0
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Kleen <ak@suse.de>
Cc: linux-lvm@msede.com, sbest@us.ibm.com, andrea@suse.de



Andi,

Thanks for reading the white paper, and thanks for your comments and
questions!

>The stacking of multiple block translation modules seems to be already
>implemented in 2.4-latest, although it is a bit of a hack and SMP
>unfriendly.

My understanding of what is in 2.4-latest is that you do indeed have the
stacking of multiple block translation modules, but the implementation of
this is not as flexible or integrated as what we have described in the
white paper.   Please correct me if I am wrong!

>The white paper talks about software RAID. Do you plan to release an
>own software RAID implementation or just a port of the existing MD  ?

The Linux Community has not yet had a chance to evaluate IBM's vision of
what an LVMS should be, much less the technology that we are releasing in
support of that vision.  However, should things progress to the point where
the Linux Community has expressed an interest in this technology and IBM is
releasing code (under the GPL, of course) in support of this technology,
then I doubt that IBM would release another software RAID.  It would be far
more productive to have the existing software RAID adapted to run as a
"Feature Plug-in" than to develop or port another software RAID
implementation.

Ben
