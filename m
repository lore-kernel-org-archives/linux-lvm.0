Date: Tue, 11 Apr 2000 07:22:22 +0200
From: Torsten Landschoff <torsten@pclab.ifg.uni-kiel.de>
Subject: Re: [linux-lvm] lvm'ing root fs
Message-ID: <20000411072222.A22002@pclab.ifg.uni-kiel.de>
References: <E3A1ACFEDE71D3118C000020352285A03882E5@nbsjexm2.nbtel.nb.ca>
Mime-Version: 1.0
In-Reply-To: <E3A1ACFEDE71D3118C000020352285A03882E5@nbsjexm2.nbtel.nb.ca>; from marco.shaw@nbtel.nb.ca on Mon, Apr 10, 2000 at 09:59:11PM -0300
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Shaw, Marco" <marco.shaw@nbtel.nb.ca>
Cc: linux-lvm@msede.com

On Mon, Apr 10, 2000 at 09:59:11PM -0300, Shaw, Marco wrote:
> # cd /
> # cp -a * /mnt/root_vg
> cp: /mnt/root_vg/proc/kcore_elf: Invalid argument
> cp: proc/sys/net/ipv4/route/flush: Invalid argument

Use cp -ax to stay in the same filesystem.

cu
	Torsten
