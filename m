From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] lvm-1.0.1 not working with DAC960/2.2.20
Message-ID: <20011128091727.P730@lynx.no>
References: <wvbshoy54w.fsf@freeze.oslo.dnmi.no> <20011127111424.A8179@sistina.com> <20011127102808.A730@lynx.no> <20011128080052.B434@btconnect.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011128080052.B434@btconnect.com>; from thornber@btconnect.com on Wed, Nov 28, 2001 at 08:00:52AM +0000
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
Date: Wed Nov 28 10:15:04 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Nov 28, 2001  08:00 +0000, Joe Thornber wrote:
> On Tue, Nov 27, 2001 at 10:28:08AM -0700, Andreas Dilger wrote:
> > Note that this will break other things, because you also need to update
> > the LVM_DEVICE_TYPE_<foo> defines when you change this array (it was
> > Joe or Alistair that wrote it this way, not me).
> 
> No, Stefan Bader wrote it that way.

OK, sorry.  It was my impression that one of you had gone through and
re-done the whole device cache and identification code.  In any case,
it doesn't really matter - the problem is fixed.

Any objection to me digging out my changes to pv_read_all_pv_of_vg()
and friends and cleaning that lot up?  That was the source of the
other problem that Lars had, and it has been nasty for a long time.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
