From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: Re[4]: [linux-lvm] pvmove with Bad bocks
Message-ID: <20011022012227.A2319@vestdata.no>
References: <55159047260.20011020155124@gmx.de> <20011021140746.B15468@vestdata.no> <20011021155622.A9367@btconnect.com> <7632207772.20011021193259@gmx.de> <20011021224416.B23544@vestdata.no> <5443942989.20011021224832@gmx.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5443942989.20011021224832@gmx.de>; from stonki@gmx.de on Sun, Oct 21, 2001 at 10:48:32PM +0200
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
Date: Sun Oct 21 18:20:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Sun, Oct 21, 2001 at 10:48:32PM +0200, Stonki wrote:
> RK> I fail to see why reducing the size will solve any problems if the =
cause
> RK> is a bad disk - I think you need the patch I mentioned earlier, or =
a
> RK> simular fix.
> Well, I need this patch for sure :-) But excuse me, but I didn't find
> the patch in the mailinglist. The only thing I found was a notice of
> Heinz to patch the latest RC for 1.0 in line 520. But I use a much
> older version...
>=20
> can you give me a helping hand ?

Look for a thread started 6th of september - subject "pv_move_pe() error
again".=20

My patch is available at:
http://vestinternett.no/~ragnark/download/LVM_ignore_read_errors.patch2

But like I explained in my original post, and others commented in the
said thread, the patch is not 100%. There was a suggested change later
in the same thread that was smaller than mine (it didn't change the
locking), and is much cleaner if it works. I'd try that first, if I were
you.





--=20
Ragnar Kj=F8rstad
Big Storage
