Date: Tue, 26 Sep 2000 07:44:40 -0700 (PDT)
From: Tim Pepper <tpepper@opensales.com>
Subject: Re: [linux-lvm] lv not persistent across reboot?
In-Reply-To: <20000926125708.A6231@gondor.com>
Message-ID: <Pine.LNX.4.21.0009260744030.29722-100000@tp.sf.opensales.com>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Niehusmann <jan@gondor.com>
Cc: Mauelshagen@Sistina.com, linux-lvm@msede.com

On Tue, 26 Sep 2000, Jan Niehusmann wrote:

> It's easily fixed if you comment out the last two lines of drivers/block/sd.c,
> or correctly fixed in later test9-preX-Kernels. 

Is that drivers/scsi/sd.c or did it get moved between test8 and test9-preX?

--
*********************************************************
*  tim.pepper@opensales dot com     * Venimus, Vidimus, *
*  http://www.opensales.com         * Dolavimus         *
*********************************************************
