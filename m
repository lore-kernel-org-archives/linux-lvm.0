Content-Type: text/plain; charset="us-ascii"
From: Adrian Head <ahead@bigpond.net.au>
References: <1010427293.29260.3.camel@UberGeek>
    <m3666ej5t2.fsf@shakti.rupa.com>
In-Reply-To: <m3666ej5t2.fsf@shakti.rupa.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E16NkOK-0006og-00@hermes.sistina.com>
Subject: [linux-lvm] Re: GRUB + LVM + XFS?
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
Date: Mon Jan  7 18:46:02 2002
List-Id: <linux-lvm.redhat.com>
To: Rupa Schomaker <rupa-list@rupa.com>, linux-xfs@oss.sgi.com
Cc: linux-lvm@sistina.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Tue, 8 Jan 2002 05:54, Rupa Schomaker wrote:
> I'm having toubles with the current CVS version of the XFS kernel.  I
> haven't had time to look at it completely, but... it could be:
>
> 1) mismatch between userspace and kernel (what LVM is in the XFS
>    kernel?  I'm using the debian lvm10 userspace).
>
> 2) bad config
>
> 3) ???
>
> A quick "bt" at boot in kdb shows that devfs is in the call path.  No,
> I haven't had time to write everything down. :(  Man, I wish there was
> an easy to dump the kdb info or an OOPs to disk...

Well all I do is for getting kdb output is to use a serial console and 
another computer - then cut and past then send  ;-).

It is very interesting that devfs is referenced - there was a LVM memory 
corruption problem and a patch for LVM/devfs - it can be found here:
http://marc.theaimsgroup.com/?l=linux-xfs&m=101031443221058&w=2

- From my experience it seems that LVM 1.0.1rc4(ish) is way more robust than 
the updated LVM 1.0.1 or even CVS LVM 1.0.1 yesterday.  However, not 
everything works as expected with either. You can find a results table for a 
few tests I have conducted here: (of course YMMV)
http://marc.theaimsgroup.com/?l=linux-lvm&m=100994364215110&w=2

I think you would be very interested in the discussions and activity that has 
been occuring on the linux-xfs & linux-lvm lists at the moment regarding XFS 
and LVM.  If you are seeing problems I would be very interested in finding 
out how your problems differ from mine.

- -- 
Adrian Head

(Public Key available on request.)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8OkHO8ZJI8OvSkAcRAsHkAJ9OlEWOQMxiXXsJ0OzsllI7icT8pQCeLfM2
95t821X+y25nYdf3WCDRg9k=
=rjIv
-----END PGP SIGNATURE-----
