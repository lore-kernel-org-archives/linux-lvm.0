Return-Path: <claudio@conectiva.com>
Date: Mon, 8 Jan 2001 21:40:55 -0200 (BRST)
From: Claudio Matsuoka <claudio@conectiva.com>
Subject: Re: [linux-lvm] Once again ... Kernel 2.4.0 - What can I do ?
In-Reply-To: <1504018708.20010108141026@lzer.net>
Message-ID: <Pine.LNX.4.21.0101082133180.32197-100000@scuzzlebutt.helllabs>
MIME-Version: 1.0
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
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, 8 Jan 2001, Jan Walzer wrote:

>   I'm currently using Kernel 2.4.0-test10 with LVM 0.8final ...
>   I have a 55Gig LVM-Partition (with reiserfs) and no backup ....
>   (Yes I know, but there's no money for a poor student to backup ...)

Even if you don't upgrade to 0.9, it's a very good idea to upgrade to 0.8.1
if you don't use a heavily patched 0.8final (I used it with 20 or so patches
provided by Andreas Dilger, Christopher Hellwig and others).

IIRC there was an especially nasty problem with the stock 0.8 regarding
extending volumes containing ReiserFS.


>   Now I want to use the final 2.4.0 and it is now a fact, that there
>   is v0.9 in it. (why it is, is another question...)
> 
>   I ask now, what I can do ...
>   It seems that they both are not compatible, as the vgscan under
>   2.4.0fin brings me a protocol error ...

You can use a wrapper scheme to transparently handle both IOP versions.
If you use an RPM-based distribution, you may want to check my packages
at http://distro.conectiva.com.br/experimental/lvm/. This way you can
have both versions of the userspace tools installed, and switch back
and forth between kernels with different IOPs.


>   can I convert the volume to 0.9 without data-loss ???

The on-disk data structures are compatible, you only need a set of
userspace tools with the same IOP as the kernel.


claudio
