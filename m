Date: Mon, 8 Oct 2001 17:20:39 +0100
Subject: Re: [linux-lvm] LVM seems to be causing SCSI errors.
Message-ID: <20011008172039.A4196@btconnect.com>
References: <135135307.1002326338570.JavaMail.root@boots>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <135135307.1002326338570.JavaMail.root@boots>; from rmvzj001@sneakemail.com on Fri, Oct 05, 2001 at 07:52:50PM -0000
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

On Fri, Oct 05, 2001 at 07:52:50PM -0000, Karl wrote:
> > Well, if it is within the size of the drive, and you get a "bad noise"
> > when trying to access it, then it may be that you have a bad drive.  If
> > you are doing low-level formats of the drive, this may do bad block
> > relocation, and hide the fact that there are bad spots.
> 
> That's what I thought at first, but as I explained earlier, the errors
> ONLY occur when running under LVM and go away as soon as I use the raw
> disk. I went back and forth several times. I'm pretty sure it is an LVM
> thing, but no idea what it is.

The only thing I can think is that the SCSI device is not being
opened/initialised properly by LVM.  This certainly wasn't happening
before ~July when I put the open/close_pv() functions in.  But should
be working now.  Puzzled.  You really are using the new tools and not
old binaries in strange places ?  I've been caught a couple of times
by this ...

- Joe
