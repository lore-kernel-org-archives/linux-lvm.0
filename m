From: Tom Brown <thecap@mail.utexas.edu>
Subject: Re: [linux-lvm] loop devices?
Message-ID: <20011212135855.D32365@cream.ece.utexas.edu>
References: <E16EEuF-0005u6-00@hermes.sistina.com> <200112121953.fBCJr6g15595@ecdl.ecdl.hut.fi>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200112121953.fBCJr6g15595@ecdl.ecdl.hut.fi>; from Mika.Lansirinne@ecdl.hut.fi on Wed, Dec 12, 2001 at 09:53:05PM +0200
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
Date: Wed Dec 12 13:57:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I too tried to make a pv on a loop device when I first downloaded lvm
and ran into a stone wall. Stepping through the code that Mika pasted
the debugging output from suggested it was not supported but I didn't
know how to fix it.

On Wed, Dec 12, 2001 at 09:53:05PM +0200, Mika Lansirinne wrote:
> Harri Haataja wrote:
> > On Wed, Dec 12, 2001 at 06:16:31PM +0200, Mika Lansirinne wrote:
> > > I was trying to use a loop device(s) for LVM. In the pvcreate man-page it 
> is 
> > > said that a PV can also be a loopback file. That also seem to work 
> correct. 
> > > But when I try to create a VG on that I get:
> > > 
> > > [root@arthur /tmp]# vgcreate tmpvg /dev/loop0
> > > vgcreate -- no valid physical volumes in command line
> > 
> > I didnt bother to look deep into those messages but first though that
> > came into my mind is that you didn't mention losetup. You did this?
> 
> Sorry, probably should have mentioned that to be complete. I indeed did use 
> losetup first. (And I can create filesystem to that and can mount that. No 
> problem with the loop device itself).
> 
> These are the steps I have done:
> dd if=/dev/zero of=lvm-file bs=1M count=XX
> losetup /dev/loop0 lvm-file
> pvcreate /dev/loop0
> => pvcreate -- physical volume "/dev/loop0" successfully created
> vgcreate tmpvg /dev/loop0
> => vgcreate -- no valid physical volumes in command line
> 
-- 
mailto:thecap@usa.net
http://www.ece.utexas.edu/~thecap/
28 70 20 71 2C 65 29 61 9C B1 36 3D D4 69 CE 62 4A 22 8B 0E DC 3E
