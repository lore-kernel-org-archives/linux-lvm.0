Date: Mon, 21 Aug 2000 18:38:12 +0200
From: Jan Niehusmann <list039@gondor.com>
Subject: Re: [linux-lvm] lv_on_disk_size
Message-ID: <20000821183812.A6492@gondor.com>
Reply-To: jan@gondor.com
References: <20000819172739.A3218@gondor.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20000819172739.A3218@gondor.com>; from list039@gondor.com on Sat, Aug 19, 2000 at 05:27:39PM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Finally, I'm starting to reply to my own posts. I knew this would happen
one day ;-)

On Sat, Aug 19, 2000 at 05:27:39PM +0200, Jan Niehusmann wrote:
> In the BUGS file, one mentioned bug fix is the following:
> 
> > Please change the macro LVM_LV_DISK_OFFSET as below:
> > 
> > #define LVM_LV_DISK_OFFSET(a, b) ( (a)->lv_on_disk.base + \
> >                                    sizeof ( lv_disk_t) * b)
> > 

Additionally, I found that linux/lvm.h of linux-2.4-testX does contain 
the same line. In fact, linux/lvm.h is nearly identical to tools/lib/lvm.h.
I wonder if this code duplication is needed. Now that lvm is included with
the (development) kernel, linux/lvm.h should contain only things needed for
kernel compilation (IMHO).

Jan
