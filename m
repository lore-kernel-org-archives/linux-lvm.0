From: Christoph Hellwig <chhellwig@t-online.de>
References: <00a201bfbe75$7395a020$4b1f04d5@migue>
	 <20000515194742.A1442@home.ds9a.nl>
	 <3923FAAF.A3E2A2D3@netconnect.com.au> <20000518190412.A17863@home.ds9a.nl>
Subject: Re:  [linux-lvm] How can activate the LVM in start
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Date: Fri, 19 May 2000 18:22:44 +0200
Message-ID: <12spXw-0BC3RQC@fwd01.sul.t-online.de>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: ahu@ds9a.nl
Cc: linux-lvm@msede.com

bert hubert schrieb:
> On Fri, May 19, 2000 at 12:14:07AM +1000, bug1 wrote:
>
> > Im no kernel hacker, but just wondering, would it be possible to get the
> > kernel to autodetect lvm partitions in a similar way that raid
> > autodetection works, or would it not be possible because of LVM's
> > userland tools.
>
> It is both possible and desireable. It is not easy however. Doing
> 'userland things' in the kernel requires immaculate code. Furthermore, the
> kernel puts a lot of restraints on what is possible.

I'm working on such a thing now. I've got about 20% ready. I'll try to post
something useable in a few weeks. (NOTE: You have to use devfs for this)

	Christoph
