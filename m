From: Eike Bernhardt <eike@unorganized.net>
Subject: Re: [linux-lvm] Known Issues with FreeBSD Slices on Disks?
Message-Id: <20020410150204.GA50366@unorganized.homeip.net>
References: <20020405172933.GA71085@unorganized.homeip.net>
    <20020408142641.GE1321@tykepenguin.com>
    <20020408173054.GA77542@unorganized.homeip.net>
    <20020410073925.GK1321@tykepenguin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020410073925.GK1321@tykepenguin.com>
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
Date: Wed Apr 10 10:01:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi!

On Wed Apr 10 09:39:25 2002 CEST Patrick Caulfield wrote:

> On Mon, Apr 08, 2002 at 07:30:54PM +0200, Eike Bernhardt wrote:
> > On Mon Apr  8 16:26:41 2002 CEST Patrick Caulfield wrote:
> 
> It sounds a lot like
> 
> http://lists.sistina.com/pipermail/lvm-devel/2002-March/000873.html

Hm, must have missed that one while searching for similar problems.

> Can you try removing the lines
> 
> 
>         /* Check parallel LV spindown (LV remove) */
>         if (lv_ptr->lv_status & LV_SPINDOWN)
>                         return -EPERM;
> 
> 
> in lvm_blk_open() and see if that fixes the problem please ?

The "operation not permitted" is happening with a unpatched 2.4.19-pre5
Kernel, and also when the Kernel is patched to lvm-1.1-rc1.

When removing the lines quoted above, it is possible to create another
VG without the "operation not permitted" Problem.

I don't know how to debug this further, so if anyone needs more specific
Information, please tell me.

-- 
Eike Bernhardt              http://unorganized.net/                ICQ: 11256658
      "Duct tape is like the force. It has a light side, and a dark side,
       and it holds the universe together."               -- Carl Zwanzig
