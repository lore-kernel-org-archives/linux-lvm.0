From: Joe Thornber <thornber@sistina.com>
Subject: Re: [linux-lvm] Block-Level Backup
Message-ID: <20030807155421.GK381@fib011235813.fsnet.co.uk>
References: <1060247670.28307.37.camel@rocky> <20030807093631.GE381@fib011235813.fsnet.co.uk> <1060260466.4360.2.camel@chtephan.cs.pocnet.net> <20030807134451.GA30494@www.13thfloor.at> <20030807151127.GB5036@ti19>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030807151127.GB5036@ti19>
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
Date: Thu Aug  7 10:55:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Aug 07, 2003 at 11:11:27AM -0400, Bill Rugolsky Jr. wrote:
> On Thu, Aug 07, 2003 at 03:44:51PM +0200, Herbert P?tzl wrote:
> > anyway, as pointed out in another response, there is
> > no good way, at least none I know of, to find the
> > blocks changed since the last backup ...
>  
> The DM snapshot target already keeps track of which blocks have
> been written.  For incremental backup, we really only need
> to know the block numbers.  Why not a new block-meta-data-only
> snapshot target that just records block numbers?  That
> should have *much* lower overhead and consume insignificant
> disk space.

This scheme only works if you don't use the device while you are
taking an incremental backup.  I think the real solution will be based
around snapshots.

- Joe
