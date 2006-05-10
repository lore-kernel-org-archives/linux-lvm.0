From: Kevin Corry <kevcorry@us.ibm.com>
Subject: Re: [Evms-devel] Re: [linux-lvm] [BUG] Spaces in LVM1 LV names =>
	*deep trouble* when converting to LVM2
Date: Wed, 10 May 2006 16:20:28 -0500
References: <44624C66.4050600@idealx.com>
	<20060510203626.GW16180@agk.surrey.redhat.com>
In-Reply-To: <20060510203626.GW16180@agk.surrey.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200605101620.29326.kevcorry@us.ibm.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: evms-devel@lists.sourceforge.net
Cc: pierre.machard@idealx.com, Benoit Picaud <benoit@idealx.com>, 'Mathias BROSSARD' <mbrossard@idealx.com>, Alasdair G Kergon <agk@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

On Wed May 10 2006 3:36 pm, Alasdair G Kergon wrote:
> On Wed, May 10, 2006 at 10:26:14PM +0200, Dominique Quatravaux wrote:
> > Hi, I encountered a very serious bug with LVM today. I'm using
> > lvm2-2.01.04-5 from Debian stable, kernel 2.6.17-rc3
> > # lvm version
> >   LVM version:     2.01.04 (2005-02-09)
> >   Library version: 1.01.00-ioctl (2005-01-17)
> >   Driver version:  4.6.0
> > What I did:
> >     * created a LV in an LVM1 VG using EVMS (yeah, I know) with a
> >       space in the name (yeah, yeah, I know, I know :-));
>
> LVs are not permitted to have spaces in their names.
> EVMS should have prevented you from doing that!

Hmm...looks like the lvm2 format plugin in EVMS does check for spaces when 
creating a new VG or LV, but the lvm1 format plugin does not. I've added a 
patch to fix the lvm1 plugin. Sorry for the trouble. :(  I guess this case is 
sufficiently unusual that no one has hit before, or at least not mentioned it 
to me before.

-- 
Kevin Corry
kevcorry@us.ibm.com
http://www.ibm.com/linux/
http://evms.sourceforge.net/
