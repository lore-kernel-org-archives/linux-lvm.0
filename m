Date: Wed, 3 Oct 2001 20:56:16 +0100 (IST)
From: Paul Jakma <paulj@alphyra.ie>
Subject: Re: [linux-lvm] lvcreate segfault in vg_setup_pointers_for_snapshots
In-Reply-To: <20011003133021.K8954@turbolinux.com>
Message-ID: <Pine.LNX.4.33.0110032052370.16480-100000@dunlop.dub.ie.alphyra.com>
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

On Wed, 3 Oct 2001, Andreas Dilger wrote:

> The min/max issues are easily fixed

yep. fixed it by hand.

> Infomation about whether the coredump is in user space or a kernel oops
> would be helpful.

no kernel oops. purely a segfault in lvcreate.

>  Also, there is a known issue about the "inline"
> functions, which may not have been fixed yet (it is a compiler bug).
> 
> Cheers, Andreas
> --

regards

--paulj
