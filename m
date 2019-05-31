Date: Fri, 31 May 2019 09:38:26 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20190531143826.GA25097@redhat.com>
References: <CAJBJ56LoBQF_cqfXwKdHVqhJfRHioBN9BJCy_fiqDRW36pCPuA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJBJ56LoBQF_cqfXwKdHVqhJfRHioBN9BJCy_fiqDRW36pCPuA@mail.gmail.com>
Subject: Re: [linux-lvm] A couple of questions on locking library
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shawn Guo <shawn.gsc@gmail.com>
Cc: linux-lvm@redhat.com, Zdenek Kabelac <zkabelac@redhat.com>

On Fri, May 31, 2019 at 03:13:39PM +0800, Shawn Guo wrote:
> Hi David, Zdenek,
> 
> Comparing to stable-2.02 branch, I noticed that there are significant
> changes around locking infrastructure on master branch.  I have a
> couple of questions regarding to these changes.
> 
> 1. I see External Locking support was removed as part of clvmd
> removal. What's the reason for dropping External Locking support?  I'm
> asking because we are investigating the possibility to use hardware
> assisted locking for cluster, in form of External Locking extension.

You could create other multi-host locking mechanisms in lvmlockd.
There are currently two, see lvmlockd-dlm.c and lvmlockd-sanlock.c.
Dave
