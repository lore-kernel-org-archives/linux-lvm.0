Subject: Re: [linux-lvm] How well tested is the snapshot feature?
Message-ID: <20020607094430.GA2148@fib011235813.fsnet.co.uk>
References: <20020607112710.A5563@babbage.hcsd.de> <20020607093300.GA2085@fib011235813.fsnet.co.uk> <20020607113705.A5571@babbage.hcsd.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020607113705.A5571@babbage.hcsd.de>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
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
Date: Fri Jun  7 04:45:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jun 07, 2002 at 11:37:05AM +0200, Stephan Austermuehle wrote:
> On Fri, Jun 07, 2002 at 10:33:00AM +0100, Joe Thornber wrote:
> 
> > Did you apply the VFS patch from the 1.0.3 release ?  This makes
> > sure that the filesystem flushes a consistent state to the disk
> > before the snapshot is setup.
> 
> Do you mean the VFS lock patch? Yes, it is applied.

Curious, as far as I know people are using LVM1 snapshots successfully
with xfs.

- Joe
