From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] How to transit from Linux 2.4 to 2.6 with LVM in play?
Message-ID: <20030930151649.GL1593@tykepenguin.com>
References: <Pine.LNX.4.55.0309300932270.593@mhw.ULib.IUPUI.Edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.55.0309300932270.593@mhw.ULib.IUPUI.Edu>
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
Date: Tue Sep 30 10:17:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Sep 30, 2003 at 09:39:23AM -0500, Mark H. Wood wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Okay, I must be missing something obvious, but...how do I get from kernel
> 2.4.19 to 2.6.0-testX without breaking LVM along the way?  The LVM1 tools,
> when run at 2.6 startup, fail after tripping a kernel message that module
> lvm_mod couldn't be found (which is sensible, since 2.6 has no such module
> that I can find).  The LVM2 tools don't want to run on 2.4 because the
> LVM1 driver is present.  So I have no tools that will run in both
> environments, meaning there's no way back if I don't like 2.6, and no way
> to try out LVM2 beforehand.  What have I failed to see?

You could run Debian :-) Debian unstable allows you to switch seamlessly from
LVM1 to LVM2 and back again depending on which kernel you are running.

If not then you'll need to patch device-mapper into your 2.4 kernel to allow you
to run LVM2 on it. (LVM2 will read the LVM1 metadata)

-- 

patrick
