From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] pecopy or lecopy
Message-ID: <20020524193426.B16798@uk.sistina.com>
References: <20020417013928.I27907@progsoc.uts.edu.au> <20020524164815.A16749@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020524164815.A16749@sistina.com>; from mauelshagen@sistina.com on Fri, May 24, 2002 at 04:48:15PM +0200
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
Date: Fri May 24 13:35:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, May 24, 2002 at 04:48:15PM +0200, Heinz J . Mauelshagen wrote:
> > If I try and mount the h2 filesystem my kernel opps as the first 150
> > PE<->LE mappings don't exist. Has anyone written a tool that copies
> > either PEs or LEs from disk without mounting the affected partition?
> Attached script, which *needs* 1.1-rc tools to run, tries this:

To aid recovery in LVM2 we've added a --partial flag which asks the
tools to bring up as much of an incomplete logical volume as they can
find (but read-only).  Missing bits get replaced by another block
device that you can set up to give I/O errors when accessed, or zeros 
or whatever.

Alasdair
-- 
agk@uk.sistina.com
