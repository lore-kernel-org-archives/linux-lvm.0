Date: Sun, 20 Feb 2000 11:55:15 +0100
From: "Andi Kleen" <ak@suse.de>
Subject: Re: [linux-lvm] With 2.3.46 lvm patch invalid i/o protocol version...
Message-ID: <20000220115515.A17875@gruyere.muc.suse.de>
References: <38AFBC54.9BFD748E@libertysurf.fr>
Mime-Version: 1.0
In-Reply-To: <38AFBC54.9BFD748E@libertysurf.fr>; from francis.souyri@libertysurf.fr on Sun, Feb 20, 2000 at 11:05:08AM +0100
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: francis-souyri@altavista.net
Cc: lvm <linux-lvm@msede.com>

On Sun, Feb 20, 2000 at 11:05:08AM +0100, Francis SOUYRI wrote:
> Hi,
> 
>     I installed the 'patch-2.3.46-LVM-0.8final.gz' on my 2.3.46 kernel
> (in the 2.3.46 kernel the devfs patch is now included, this is great,
> but with this kernel I can't use the ramdisk because there is or I have
> a bug), when I use the 'lvm_0.8-pre02.10.1999.tar.gz' tools I receive
> the message 'invalid i/o protocol version'.
> 
> Do you know if there is a tools package compatible with the 2.3.46 lvm
> kernel patch or can I modify the lvm kernel patch to
> set the ' LVM_DRIVER_IOP_VERSION' from 6 to 5 like the
> 'LVM_LIB_IOP_VERSION' or vice versa.

Try ftp.suse.com:/pub/people/andrea/kernel.org/lvm/aa-20000119/lvm-tools-*


-Andi
