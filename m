From: Stephan Austermuehle <au@hcsd.de>
Subject: Re: [linux-lvm] How well tested is the snapshot feature?
Message-ID: <20020607115623.B5571@babbage.hcsd.de>
References: <20020607112710.A5563@babbage.hcsd.de> <20020607093300.GA2085@fib011235813.fsnet.co.uk> <20020607113705.A5571@babbage.hcsd.de> <20020607094430.GA2148@fib011235813.fsnet.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020607094430.GA2148@fib011235813.fsnet.co.uk>; from joe@fib011235813.fsnet.co.uk on Fri, Jun 07, 2002 at 10:44:30AM +0100
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Fri Jun  7 04:56:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jun 07, 2002 at 10:44:30AM +0100, Joe Thornber wrote:

> Curious, as far as I know people are using LVM1 snapshots
> successfully with xfs.

To be pretty correct: I used the VFS lock patch from LVM 1.1-rc2 with
LVM 1.0.4 because this doesn't give any rejects. But I had the problem
with previous LVM versions with it's own VFS lock patch, too.

At the moment I have two systems that cause trouble: One SuSE 7.0
based which is running about 2,5 years and one freshly installed
Debian Woody system. Both have different hardware, compiler, libc,
etc. Seems to be Kernel/LVM/XFS related.

Stephan
