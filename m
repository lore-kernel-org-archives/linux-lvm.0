Return-Path: <tomlins@cam.org>
From: Ed Tomlinson <tomlins@cam.org>
Subject: Re: [linux-lvm] LVM problems
Date: Tue, 19 Jun 2001 21:11:23 -0400
References: <85063BBE668FD411944400D0B744267A481A88@AUSMAIL> <20010619161930.A15720@sistina.com>
In-Reply-To: <20010619161930.A15720@sistina.com>
MIME-Version: 1.0
Message-Id: <01061921112300.12450@oscar>
Content-Transfer-Encoding: 8bit
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
To: linux-lvm@sistina.com, AJ Lewis <lewis@sistina.com>

On Tuesday 19 June 2001 17:19, AJ Lewis wrote:
> On Tue, Jun 19, 2001 at 02:28:05PM -0500, Gonyou, Austin wrote:
> > Why in the hell is this NOT in the source tree by default. This has
> > really got be boggled. I've seen tons of others have this proble, I've
> > had this problem, and still it doesn't seem to get itself into the tree.
> > Is this because it is a temporary problem or something?
>
> It *is* in the source tree by default.  It is in the CVS.  It is not in
> LVM 0.9.1 Beta7 because LVM 0.9.1 Beta7 was released before linux 2.4.4,
> which is when the problem surfaced.  We have not had a release since then,
> so it is not in the latest release.
>
> You can now grab the patch and apply it to beta7, which fixes the problem,
> or you can use the CVS repository.  I really don't know what else you
> expect us to do.

Actually getting the up-to-date lvm in the kernel would be nice.  Last time
I asked 2.4.<x>-ac<y> was about half way there.  What is happening?  Have the cvs
procedures been modified to enable producing Linus friendly patches?  When
can we expect a kernel with a current lvm?

Please read the above as just as a request for info.  LVM is working ok here.
Its just a bit of a pita to have to patch everything every time I rebuild a
tree...

TIA,
Ed Tomlinson <tomlins@cam.org>
