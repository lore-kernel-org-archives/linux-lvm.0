From: Wolfgang Weisselberg <weissel@netcologne.de>
Subject: Re: [linux-lvm] File size limit exceeded
Message-ID: <20011217092813.B9157@tiger.bigcats.invalid>
References: <20011217014227.A453@golem.blacknet.de> <20011217035851.B4880@tiger.bigcats.invalid> <20011217004350.L855@lynx.no>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011217004350.L855@lynx.no>; from adilger@turbolabs.com on Mon, Dec 17, 2001 at 12:43:50AM -0700
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
Date: Mon Dec 17 02:41:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm <linux-lvm@sistina.com>

Hi, Andreas!

Andreas Dilger (adilger@turbolabs.com) wrote 39 lines:
> On Dec 17, 2001  03:58 +0100, Wolfgang Weisselberg wrote:

> > Also funny: It works OK from the console, but not under X -- if

> It is a kernel problem, and not limited to LVM.  You need to log
> in directly as root (no "su -") so that you don't have any ulimit
> set for your shell.  Block devices moved into the page cache in
> 2.4.10, and were (incorrectly) affected by file size limits.

That explains some things... Thanks!

-Wolfgang
