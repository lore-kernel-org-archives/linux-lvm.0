Date: Sun, 1 Jul 2007 21:36:56 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] [PATCH]: don't use functions marked by SUSv3 as legacy
Message-ID: <20070701203656.GL30047@agk.fab.redhat.com>
References: <200707011529.08381.arekm@maven.pl>
	<20070701144829.GI30047@agk.fab.redhat.com>
	<200707011658.00819.arekm@maven.pl>
	<87lke0ueg9.fsf@hades.wkstn.nix>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87lke0ueg9.fsf@hades.wkstn.nix>
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
To: Nix <nix@esperi.org.uk>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, Jul 01, 2007 at 08:11:18PM +0100, Nix wrote:
> There must be more to it than this. I've always built with -Wl,--as-needed
> (wired into my GCC specs file), and I've never had a problem with LVM.
 
This is only changing 'fsadm' which is not enabled by default upstream
as I don't yet consider it stable.

Alasdair
-- 
agk@redhat.com
