Date: Tue, 26 Sep 2000 17:26:30 +0200
From: Jan Niehusmann <jan@gondor.com>
Subject: Re: [linux-lvm] lv not persistent across reboot?
Message-ID: <20000926172630.A16866@gondor.com>
References: <20000926125708.A6231@gondor.com> <Pine.LNX.4.21.0009260744030.29722-100000@tp.sf.opensales.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0009260744030.29722-100000@tp.sf.opensales.com>; from tpepper@opensales.com on Tue, Sep 26, 2000 at 07:44:40AM -0700
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Pepper <tpepper@opensales.com>
Cc: Mauelshagen@Sistina.com, linux-lvm@msede.com

On Tue, Sep 26, 2000 at 07:44:40AM -0700, Tim Pepper wrote:
> On Tue, 26 Sep 2000, Jan Niehusmann wrote:
> 
> > It's easily fixed if you comment out the last two lines of drivers/block/sd.c,
> > or correctly fixed in later test9-preX-Kernels. 
> 
> Is that drivers/scsi/sd.c or did it get moved between test8 and test9-preX?

Of course drivers/scsi/sd.c, I'v been confused by the lvm.c move in test9-preX
:-)

Jan
