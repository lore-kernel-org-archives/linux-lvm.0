Return-Path: <thornber@btconnect.com>
Date: Thu, 26 Jul 2001 10:41:00 +0100
Subject: Re: [linux-lvm] downgrade from beta8 to beta7
Message-ID: <20010726104100.C490@btconnect.com>
References: <15199.7603.761521.721280@rigel.oswf.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <15199.7603.761521.721280@rigel.oswf.de>; from john@oswf.de on Wed, Jul 25, 2001 at 09:27:47PM +0200
From: Joe Thornber <thornber@btconnect.com>
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

On Wed, Jul 25, 2001 at 09:27:47PM +0200, Werner John wrote:
> Hi folks
> 
> I just had to downgrade back to beta7. I got 5 PVs /dev/sda[1269] and
> /dev/md1. 
> 
> I ran through the instructions to upgrade from 7 to 8, did pvversion -2 for
> /dev/sda[1269] but *not* for /dev/md1 - I just missed it. Consequently, the
> upgrade was not complete. Ok, downgrade back from 8 to 7 by changing the
> version number with pvversion -1 /dev/sda[1269]. That failed. 
> 
> Lets read the docs: " ...  Note that the pvversion tool needs to have the
> "right" userland tools in the PATH to work correctly so if you are
> upgrading from beta7 to beta8 with the command "pvversion -2" then you
> should have the beta7 tools on your PATH. If you are downgrading from beta8
> to beta7 then you should have the beta8 tools on your PATH. ..."
>    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> I made it sure half a dozend times. Then I thought, well, try pvversion -1
> /dev/sda[1269] with the PATH pointing to the *old* tools. That worked.
> 
> Is this some kind of coincidence or a typo in README.1st?

I just skimmed through the pvversion script, it appears to be trying
to get the pe positions from pvdisplay even when doing a downgrade
(something it wont need to do).  Because you failed to upgrade fully,
the pvdisplay will fail with the beta8 tools, preventing you from
downgrading.  As far as I can tell you should be able to downgrade
with either your old or new tools (if they are working).  Sorry for
any trouble.

> Then I activated the VG with beta7 tools, ran pvversion -2 for *all* my PVs
> as recommended and now I'm all fine with beta8. 

Good.

- Joe
