Message-ID: <38F2C2BB.BE0AD186@twc.de>
Date: Tue, 11 Apr 2000 08:14:19 +0200
From: Ulf Bartelt <ulf@twc.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm'ing root fs
References: <E3A1ACFEDE71D3118C000020352285A03882E5@nbsjexm2.nbtel.nb.ca> <20000410204358.C20168@lenin.nu> <20000410212132.C21194@lenin.nu> <20000411072415.B22002@pclab.ifg.uni-kiel.de>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Torsten Landschoff wrote:
>    (cd /source/directory && tar cf - . ) | (cd /dest/directory && tar xvfp -)

I use:

tar clCf sourcedir - . | tar xvpCf destdir -

...at least with gnu tar...

...will skip mounted filesystems due to the "l" option...
...will chdir to sourcedir/destdir due to the "C" option...


...or did i miss something?


Bye!
	Ulf.
