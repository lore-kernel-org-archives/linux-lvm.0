Date: Wed, 1 Nov 2000 17:35:20 +0100
From: Andrea Arcangeli <andrea@suse.de>
Subject: [linux-lvm] Re: Repeatable oops mounting snapshot fs on 2.4.0-test10
Message-ID: <20001101173520.C17627@athlon.random>
References: <39FF9E2E.5586ADF1@pobox.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <39FF9E2E.5586ADF1@pobox.com>; from jjs@pobox.com on Tue, Oct 31, 2000 at 08:38:06PM -0800
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: J Sloan <jjs@pobox.com>
Cc: linux-kernel@vger.kernel.org, linux-lvm@msede.com

On Tue, Oct 31, 2000 at 08:38:06PM -0800, J Sloan wrote:
> version a spin for the very first time when I ran into
> some big problems:

Check your userspace tools. The kernel trusts the data that arrives from the
userspace tools. If the data that arrives from userspace is wrong the kernel
will malfunction. On the kernel list a few days ago I pointed out an userspace
tools package that works for me.

Andrea
