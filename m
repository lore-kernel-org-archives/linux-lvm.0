Return-Path: <harvell@nortelnetworks.com>
Message-ID: <3B0EE3FA.6CD4E1ED@americasm01.nt.com>
Date: Fri, 25 May 2001 18:00:10 -0500
From: "Joe Harvell" <harvell@nortelnetworks.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm_chr_ioctl
References: <200105251946.f4PJkXpg000560@webber.adilger.int> <004901c0e56b$1e8d1e00$5300000a@cavecreek.net>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Justin:

I saw this exact same message (either when doing a vgscan or vgchange -a
y).  Well, I'm not 100% sure about the number reported in the error message,
but it looks the same.

In my case it was because i was running the beta2 version of the kernel code
and the beta7 version of the user-space software.  I had recompiled my
kernel and forgotten to re-apply the kernel patch.  I fixed the problem by
patching the kernel code up to the beta 7 version.

Justin Booth wrote:

> I seem to be getting some errors for
> lvm_chr_ioctl: unknown command 4004fe0a
>
> When I do a vgcreate. I also noticed that if a partition is under heavy
> strain and I take a snapshot, the snapshot seg. faults, and all subseqent
> lvscans will also until I lvremove the volume and re-create it.
>
> Should I be worried about the lvm_chr_ioctl???
>
> Thanks in advance, Justin Booth
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
