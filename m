Subject: Re: [linux-lvm] Re: What really works?
Message-ID: <20011023104359.B385@btconnect.com>
References: <E15vISM-0005YX-00.2001-10-21-14-15-58@mail5.svr.pol.co.uk> <002501c15a66$34f8d010$836788cf@industry> <20011022230524.B4212@redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011022230524.B4212@redhat.com>; from sct@redhat.com on Mon, Oct 22, 2001 at 11:05:24PM +0100
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
Date: Tue Oct 23 04:42:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Stephen,

On Mon, Oct 22, 2001 at 11:05:24PM +0100, Stephen C. Tweedie wrote:
> LVM folks, am I missing something here?  I can't see how you can
> assert that the device is truly quiescent after the LOCK_PE has been
> set.  

You're not missing anything.  The correct thing to do (as pointed out
by Andrea Arc.) is to hook b_end_io such that we can keep track of all
'in flight' io's, and only start moving once these have completed.
This is implemented in the new device-mapper driver that we are
switching to shortly.  I consider 'live' pvmove broken in the current
LVM.

- Joe
