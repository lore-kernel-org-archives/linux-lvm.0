From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Moving to a new system.
Message-ID: <20040109083417.GD18337@percy.comedia.it>
References: <20040108203554.2d609d0f@hollowbox>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040108203554.2d609d0f@hollowbox>
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
Date: Fri Jan  9 03:35:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Jan 08, 2004 at 08:35:54PM +0100, neuron wrote:
>I'm moving my data from the old server, kernel 2.4 and lvm1.  To a new server, kernel 2.6 and lvm2.
>I thought I'd start by removing hdd1. It's 80gb and I have about 111gb free.
>
>pvmove --test /dev/hdd1
>pvmove -- couldn't find source physical volume "/dev/hdd1" in volume group "vg_main"
??devfs??

>pvdisplay /dev/hdd1 works, total pe's 3575
>would the best way of doing this be:
>lvreduce -l-3575 /dev/vg_main/storagelv
>resize_reiserfs /dev/vg_main/storagelv (I think reiserfs can do online resizing?)
i'd reduce the fs _BEFORE_ shrinking the underlying device.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
