Message-Id: <1889.200.184.103.3.1018973242.squirrel@www.dokbua.com>
Subject: Re: [linux-lvm] kernel: invalidate: busy buffer
From: "Rene @ Webscorpion.com" <rene.madsen@webscorpion.com>
In-Reply-To: <20020417014553.J27907@progsoc.uts.edu.au>
References: <20020417014553.J27907@progsoc.uts.edu.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Date: Tue Apr 16 11:06:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

later kernel versions in 2.4.x output that message when
> invalidate_buffers() is called too many times. I would get a few of
> them on startup (2.4.16).

I run LVM on a non-AC 2.4.17 Kernel without problems so somehow it must be
related to the -ac hacks.


>> How can I patch a standard kernel for both -ac and LVM ? As I
>> understand it they both require a "clean" kernel to apply good?
>
> Grab the clean kernel; apply LVM patches; apply redhat patches. Stephen
> Tweddie was on here pointing out a patch that Redhat have done to the
> kernel does buffer locking if you do pvmove -- so not all of the Redhat
> patches may apply cleanly.

Just to make sure I understand correctly: Is "RH patches" and "AC patches"
the same thing?

How can I apply RH patches if some of them fail?  Dont they somehow depend
on each other?

>> Sorry for the perhaps stupid quiestions, but I am not a kernel guru -
>> I only know just enough to get myself into trouble :-)  I *did* read
>> the FAQ and I *did* search google (usenet) - didnt' find the answers
>> tho...
>
> I searched google for 'busy buffer linux' and the first hit is on the
> linux-lvm list from 2001

Yes I saw that, but it wasn't the answer.
