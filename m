Date: Tue, 18 Sep 2001 08:52:51 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] RAWIO Patch with 2.4?
Message-ID: <20010918085251.C736@tykepenguin.com>
References: <550C100A8350CE4BBD3DD2D7788FD0CA481FB7@fcmail1.FC.COM>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <550C100A8350CE4BBD3DD2D7788FD0CA481FB7@fcmail1.FC.COM>; from bbailey@fcmail.org on Mon, Sep 17, 2001 at 04:51:11PM -0500
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

On Mon, Sep 17, 2001 at 04:51:11PM -0500, Brian Bailey wrote:
> When attempting to run make to create the 1.0 patch for my server, I
> continually receive the message that I haven't applied the rawio patch.
> However, this is a 2.4.3-6 kernel via Redhat 7.1.  My understanding is
> rawio is built-in to the kernel post-2.4.
> 
> In a failed attempt, I actually applied the patch and was still
> unsuccessful.  Any suggestions?
> 

I would guess that the configure script didn't find your kernel correctly and
thinks you still have 2.2. Make sure you point it at the right sources using
eg:

./configure --with-kernel_dir=/usr/src/mykernel

(watch for the hyphen and underscore!)

Then re-run make in the PATCHES directory.

You can check that configure has found the right kernel by examining the
Makefile in the PATCHES directory - it should have the following three variables
set:

KERNEL_DIR=
LVM_VERSION=
KERNEL_VERSION=

patrick
