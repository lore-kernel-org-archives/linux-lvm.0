From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] LV's above 2TB, PV's above 1TB, LBD?
Message-ID: <20021118175142.D30589@vestdata.no>
References: <3DD3AEF2.5040900@grc.nasa.gov> <20021118163728.C5567@uk.sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20021118163728.C5567@uk.sistina.com>; from agk@uk.sistina.com on Mon, Nov 18, 2002 at 04:37:28PM +0000
Content-Transfer-Encoding: quoted-printable
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
Date: Mon Nov 18 10:52:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Mon, Nov 18, 2002 at 04:37:28PM +0000, Alasdair G Kergon wrote:
> > Aside from this, now that the 2.5 kernel supports LBD's, can the limi=
t
> > on LV's be raised to 16 TB?
> For the *new* format of metadata (in beta 4 released today), yes:=20
> for now, I've knocked out the LV size restriction in CVS.  Further
> tweaks to the tools may also be required. Please try it and let us
> know whether it works, or what else needs changing.

Is the new metdata format really required?
Isn't the unit used in the metadata PEs? So should it not work with the
old format if only the PEs are large enough?



--=20
Ragnar Kj=F8rstad
Big Storage
