From: Stephan Austermuehle <au@hcsd.de>
Subject: Re: [linux-lvm] How well tested is the snapshot feature?
Message-ID: <20020607121530.C5571@babbage.hcsd.de>
References: <20020607112710.A5563@babbage.hcsd.de> <20020607093300.GA2085@fib011235813.fsnet.co.uk> <20020607113705.A5571@babbage.hcsd.de> <20020607094430.GA2148@fib011235813.fsnet.co.uk> <20020607115623.B5571@babbage.hcsd.de> <20020607100706.GA2222@fib011235813.fsnet.co.uk> <20020607101052.GD1053@tykepenguin.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020607101052.GD1053@tykepenguin.com>; from caulfield@sistina.com on Fri, Jun 07, 2002 at 11:10:52AM +0100
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
Date: Fri Jun  7 05:16:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jun 07, 2002 at 11:10:52AM +0100, Patrick Caulfield wrote:

> I think he means the VFS lock patch in 1.1rc2 - which should be
> fine.  It might be a stack size issue ?

I took only the VFS lock patch from 1.1rc2, everything else is from
1.0.4.

Stephan
