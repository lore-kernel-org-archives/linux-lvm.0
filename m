From: "Stephen C. Tweedie" <sct@redhat.com>
Subject: Re: [linux-lvm] Re: What really works?
Message-ID: <20011102153732.A5007@redhat.com>
References: <E15vISM-0005YX-00.2001-10-21-14-15-58@mail5.svr.pol.co.uk> <002501c15a66$34f8d010$836788cf@industry> <20011022230524.B4212@redhat.com> <20011023104359.B385@btconnect.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011023104359.B385@btconnect.com>; from thornber@btconnect.com on Tue, Oct 23, 2001 at 10:43:59AM +0100
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
Date: Fri Nov  2 09:40:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: Stephen Tweedie <sct@redhat.com>, Joe Thornber <thornber@btconnect.com>

Hi,

On Tue, Oct 23, 2001 at 10:43:59AM +0100, Joe Thornber wrote:
 
> You're not missing anything.  The correct thing to do (as pointed out
> by Andrea Arc.) is to hook b_end_io such that we can keep track of all
> 'in flight' io's, and only start moving once these have completed.

Precisely.

> This is implemented in the new device-mapper driver that we are
> switching to shortly.  I consider 'live' pvmove broken in the current
> LVM.

Just while we're on the subject, does anyone have a timescale for
fixing this?

Cheers,
 Stephen
