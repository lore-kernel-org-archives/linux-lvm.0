From: Harri Haataja <harri.haataja@smilehouse.com>
Subject: Re: [linux-lvm] loop devices?
Message-ID: <20011212183449.B3564@tolppa.smilehouse.com>
References: <200112121616.fBCGGWg14769@ecdl.ecdl.hut.fi>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200112121616.fBCGGWg14769@ecdl.ecdl.hut.fi>; from Mika.Lansirinne@ecdl.hut.fi on Wed, Dec 12, 2001 at 06:16:31PM +0200
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
Date: Wed Dec 12 10:53:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Dec 12, 2001 at 06:16:31PM +0200, Mika Lansirinne wrote:
> I was trying to use a loop device(s) for LVM. In the pvcreate man-page it is 
> said that a PV can also be a loopback file. That also seem to work correct. 
> But when I try to create a VG on that I get:
> 
> [root@arthur /tmp]# vgcreate tmpvg /dev/loop0
> vgcreate -- no valid physical volumes in command line

I didnt bother to look deep into those messages but first though that
came into my mind is that you didn't mention losetup. You did this?

-- 
Do not meddle in the affairs of gurus,
for they can make your life miserable by doing nothing.
	-- .sig of Joe Zeff
