From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Patching Kernel 2.4.13 (with LVM patch 1.0.1.rc4 and XFS 1.0.1)
Message-ID: <20011031113810.C634@tykepenguin.com>
References: <20011031112833.A6615@sky.net> <NEBBKOJLIGMCKNCJJACPCEPHGHAA.joost@e-cube.nl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <NEBBKOJLIGMCKNCJJACPCEPHGHAA.joost@e-cube.nl>; from joost@e-cube.nl on Wed, Oct 31, 2001 at 12:23:40PM +0100
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
Date: Wed Oct 31 05:58:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Oct 31, 2001 at 12:23:40PM +0100, Joost van der Locht wrote:
> Thanks, I looked in to it. But can you tell me how to respond on the
> question:
> Reversed (or previously applied) patch detected! Assume -R? [n]
> And what follows then? What to do with the several rej files?
> 

I did the following:

Untar 2.4.13
Patch with XFS
Build LVM patch
Apply LVM Patch

That gives the "Reversed (or previously applied) patch detected! Assume -R"
question on the Makefile, so just say No to that and No to "apply anyway".

You can also ignore the reject file.

What has happened is that a new file "lvm-fs.c" was added to LVM after beta2
(which is what is in the kernel) and is included in the XFS patch (beta6) as
well as RC4. So when you apply the XFS patch it updates the Makefile to include
it.

The LVM patch generator doesn't know that has happened so it tries to add lvm-fs
to the Makefile again

Incidentally I used the xfs-2001-10-27 patch rather than 1.0.1 because I
couldn't get it to patch cleanly onto 2.4.13, but that's an XFS (or my) problem
rather than an LVM one.

patrick
