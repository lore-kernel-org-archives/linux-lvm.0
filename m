Subject: Re: [linux-lvm] kernel: invalidate: busy buffer
Message-Id: <20020417014553.J27907@progsoc.uts.edu.au>
References: <3621.200.184.103.3.1018883627.squirrel@www.dokbua.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3621.200.184.103.3.1018883627.squirrel@www.dokbua.com>;
    from rene.madsen@webscorpion.com on Mon, Apr 15, 2002 at 12:13:47PM -0300
From: Anand Kumria <wildfire@progsoc.uts.edu.au>
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
Date: Tue Apr 16 10:50:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Apr 15, 2002 at 12:13:47PM -0300, Rene @ Webscorpion.com wrote:
> 
> I notice in my /var/log/messages that I get MILLIONS (really) of errors:
> kernel: invalidate: busy buffer

Apparently later kernel versions in 2.4.x output that message when
invalidate_buffers() is called too many times. I would get a few of
them on startup (2.4.16).

> What am I doing wrong? Is this error related to the missing kernel
> patching?

No, just the tools are calling this function too often as far as the
kernel is concerned. I'm not sure if it causes any specific harm though.

> How can I patch a standard kernel for both -ac and LVM ? As I understand
> it they both require a "clean" kernel to apply good?

Grab the clean kernel; apply LVM patches; apply redhat patches. Stephen
Tweddie was on here pointing out a patch that Redhat have done to the
kernel does buffer locking if you do pvmove -- so not all of the Redhat
patches may apply cleanly.

> Sorry for the perhaps stupid quiestions, but I am not a kernel guru - I
> only know just enough to get myself into trouble :-)  I *did* read the FAQ
> and I *did* search google (usenet) - didnt' find the answers tho...

I searched google for 'busy buffer linux' and the first hit is on the 
linux-lvm list from 2001

Anand

-- 
 `` We are shaped by our thoughts, we become what we think.
 When the mind is pure, joy follows like a shadow that never
 leaves. '' -- Buddha, The Dhammapada
