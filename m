Date: Tue, 13 Jun 2000 17:28:13 +0200
From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] How can activate the LVM in start (fwd)
Message-ID: <20000613172813.C16892@vestdata.no>
References: <Pine.LNX.4.21.0005160142010.1987-100000@fogarty.spin.ie>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.21.0005160142010.1987-100000@fogarty.spin.ie>; from Paul Jakma on Tue, May 16, 2000 at 01:43:09AM +0100
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Jakma <paul@clubi.ie>
Cc: Linux LVM list <linux-lvm@msede.com>

On Tue, May 16, 2000 at 01:43:09AM +0100, Paul Jakma wrote:
> the rc.sysinit stuff got stripped from my last message. here it is
> again, minus a few square brackets and hash symbols.
> 
> ---------- Forwarded message ----------
> ## LVM
> #scan for VGs and create /dev entries.
> if [ -x /sbin/vgscan -a -f /proc/lvm ]; then
>        action "LVM: Scanning for Volume Groups" /sbin/vgscan
> fi
> #activate all VGs
> if [ -x /sbin/vgchange -a -f /proc/lvm ]; then
>        action "LVM: Activating Volume Groups" /sbin/vgchange -ay
> fi
> ## End LVM

Hi.

Another way is to do it from conf.modules:

alias block-major-58      lvm-mod
alias char-major-109      lvm-mod
post-install lvm-mod vgscan && vgchange -a y

It saves checking that lvm got loaded. 


-- 
Ragnar Kjorstad
