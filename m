Return-Path: <jomarqua@indiana.edu>
Date: Fri, 23 Feb 2001 13:40:31 -0500 (EST)
From: John Marquart <jomarqua@indiana.edu>
Subject: Re: [linux-lvm] Patch needed for kernel 2.4.2 ?
In-Reply-To: <20010223102617.D12979@sistina.com>
Message-ID: <Pine.A41.4.21.0102231337280.9104-100000@gigue.dlib.indiana.edu>
MIME-Version: 1.0
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
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Is there a way to configure / install the tools such that they can fall
back to handle IOP 10?  I enjoy helping test new beta code (Great job by
the way - I have yet to have ANY problems w/ the beta versions i have
tested) - but it becomes quite a bit more stressful when the userspace
tools are not backwards compatible.  Am I just overlooking something, or
is there truly no backwards compatibility in IOP11 tools to IOP10 and/or
IOP6?

thanks,
-john


On Fri, 23 Feb 2001, AJ Lewis wrote:

> Read the README in the PATCHES directory.  This explains how to generate a
> patch for your kernel.  And yes, you do need to patch the kernel.  The IOP
> version was reved to 11, and the 2.4.2 kernel still has 0.9.1 Beta2 LVM
> code, which is IOP 10, so the Beta5 tools will not work with it.





John "Jamie" Marquart		|     This message posted 100% MS free.
Digital Library SysAdmin	|  Work: 812-856-5174   Pager: 812-334-6018
Indiana University Libraries	|  ICQ: 1131494	 	D'net Team:  6265
