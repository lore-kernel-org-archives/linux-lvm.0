Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l62Im3m0016682
	for <linux-lvm@redhat.com>; Mon, 2 Jul 2007 14:48:03 -0400
Received: from mail.esperi.org.uk (user17731@41-052.adsl.zetnet.co.uk
	[194.247.41.52])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l62Im0D2017924
	for <linux-lvm@redhat.com>; Mon, 2 Jul 2007 14:48:01 -0400
Received: from esperi.org.uk (nix@hades.wkstn.nix [192.168.14.18])
	by mail.esperi.org.uk (8.12.11.20060614/8.12.11) with ESMTP id
	l62IlwRA013942
	for <linux-lvm@redhat.com>; Mon, 2 Jul 2007 19:47:58 +0100
Subject: Re: [linux-lvm] [PATCH]: don't use functions marked by SUSv3 as legacy
References: <200707011529.08381.arekm@maven.pl>
	<20070701144829.GI30047@agk.fab.redhat.com>
	<200707011658.00819.arekm@maven.pl> <87lke0ueg9.fsf@hades.wkstn.nix>
	<20070701203656.GL30047@agk.fab.redhat.com>
From: Nix <nix@esperi.org.uk>
Date: Mon, 02 Jul 2007 19:47:57 +0100
In-Reply-To: <20070701203656.GL30047@agk.fab.redhat.com> (Alasdair G. Kergon's
	message of "Sun, 1 Jul 2007 21:36:56 +0100")
Message-ID: <87k5tiabhe.fsf@hades.wkstn.nix>
MIME-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On 1 Jul 2007, Alasdair G. Kergon told this:

> On Sun, Jul 01, 2007 at 08:11:18PM +0100, Nix wrote:
>> There must be more to it than this. I've always built with -Wl,--as-needed
>> (wired into my GCC specs file), and I've never had a problem with LVM.
>  
> This is only changing 'fsadm' which is not enabled by default upstream
> as I don't yet consider it stable.

I build fsadm and I don't need this patch.

(However, without this patch, including -Wl,--as-needed in the LDFLAGS
won't link fsadm with --as-needed, so it is still beneficial. I just
don't see that it's making linking work where before it didn't.)

-- 
`... in the sense that dragons logically follow evolution so they would
 be able to wield metal.' --- Kenneth Eng's colourless green ideas sleep
 furiously
