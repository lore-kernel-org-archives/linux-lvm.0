Date: Tue, 26 Sep 2000 12:57:08 +0200
From: Jan Niehusmann <jan@gondor.com>
Subject: Re: [linux-lvm] lv not persistent across reboot?
Message-ID: <20000926125708.A6231@gondor.com>
References: <Pine.LNX.4.21.0009251623060.25906-100000@tp.sf.opensales.com> <20000926113521.C17132@srv.t-online.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20000926113521.C17132@srv.t-online.de>; from Heinz.Mauelshagen@t-online.de on Tue, Sep 26, 2000 at 11:35:21AM +0000
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauelshagen@Sistina.com
Cc: Tim Pepper <tpepper@opensales.com>, linux-lvm@msede.com

On Tue, Sep 26, 2000 at 11:35:21AM +0000, Heinz J. Mauelshagen wrote:
> Just recently i faced the efect with 2.4.0-test8, that devices where
> exposed multiple times. For eg. /dev/sdb and /dev/sdf accessed the same drive.

It's easily fixed if you comment out the last two lines of drivers/block/sd.c,
or correctly fixed in later test9-preX-Kernels. 
(if you comment out the lines in sd.c, please remember to uncomment them if
you patch your kernel up to a newer version)

Jan
