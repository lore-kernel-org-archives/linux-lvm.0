Date: Tue, 28 Aug 2001 12:00:08 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] segfault running vgscan
Message-ID: <20010828120008.F609@tykepenguin.com>
References: <20010823145432.A20622@sistina.com> <20010823225107.2238.qmail@web20301.mail.yahoo.com> <20010823195402.A23333@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010823195402.A23333@sistina.com>; from lewis@sistina.com on Thu, Aug 23, 2001 at 07:54:02PM -0500
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Aug 23, 2001 at 07:54:02PM -0500, AJ Lewis wrote:
> On Thu, Aug 23, 2001 at 03:51:07PM -0700, Brad Langhorst wrote:
> > the static vs dynamic link bit gave me the idea to try
> > compiling lvm statically - seems to work now.
> > 
> > i can't upgrade glibc since its already at 2.2.4 which
> > is the most recent (as far as I can tell)
> 
> Interesting that i have the exact opposite problem with version 2.2.3 of
> glibc...I think more research is required.  Has anyone else seen a problem
> like this?

Just tried it with libc 2.2.4 and GCC 3.0 and GCC 2.95 and it seems OK for me.

patrick
