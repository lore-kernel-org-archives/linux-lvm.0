Subject: Re: [linux-lvm] Mandrake 8.1 and LVM
Message-ID: <20011201150916.GX26712@pc.ilinx>
References: <20011129181708.B16013@colombina.comedia.it> <NBBBKLKHMJHIJLHOGAOJOEDFJCAA.steve.wray@the.net.nz> <20011130093008.B18867@colombina.comedia.it>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011130093008.B18867@colombina.comedia.it>
From: "Brian J. Murrell" <lvm@interlinx.bc.ca>
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
Date: Sat Dec  1 10:58:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Nov 30, 2001 at 09:30:08AM +0100, Luca Berra wrote:
> 
> what i'll do next is fixing mkinitrd to understand lvm root.

I have the current Mandrake Cooker mkinitrd RPM patched to know how to
do lvm root.  I actually have also made (almost) all of the changes to
the Mandrake installer to install on an lvm root.  I got stumped by
one bit of perl (my perl5 sucks) that was causing the device to be
determined as /dev/dev/volgroup/root when it came time to doing the
LILO/Grub configuration.

I have not gotten back to it yet because my perl5 is no better than it
was when I got stumped.  I do have a big fat per5 book now though.
:-)

b.

-- 
Brian J. Murrell
