Date: Tue, 11 Apr 2000 07:24:15 +0200
From: Torsten Landschoff <torsten@pclab.ifg.uni-kiel.de>
Subject: Re: [linux-lvm] lvm'ing root fs
Message-ID: <20000411072415.B22002@pclab.ifg.uni-kiel.de>
References: <E3A1ACFEDE71D3118C000020352285A03882E5@nbsjexm2.nbtel.nb.ca> <20000410204358.C20168@lenin.nu> <20000410212132.C21194@lenin.nu>
Mime-Version: 1.0
In-Reply-To: <20000410212132.C21194@lenin.nu>; from spacey@lenin.nu on Mon, Apr 10, 2000 at 09:21:32PM -0700
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Peter C. Norton" <spacey@lenin.nu>
Cc: "Shaw, Marco" <marco.shaw@nbtel.nb.ca>, linux-lvm@msede.com

On Mon, Apr 10, 2000 at 09:21:32PM -0700, Peter C. Norton wrote:
> Looking at that a second time, you may be better off adding the "-type f"
> flag to find so you don't include /usr, etc.
> 
> On Mon, Apr 10, 2000 at 08:43:58PM -0700, Peter C. Norton wrote:
> > You may want to do the following:
> > 
> > cd /; find . -xdev -print | xargs tar -cf - | (cd /mnt/root_vg; tar -xf -)

If you want to use tar the easiest way is to use is probably in the Tips-HOWTO:

2.6.  Moving directories between filesystems. Alan Cox, A.Cox@swansea.ac.uk 

    Quick way to move an entire tree of files from one disk to another

   (cd /source/directory && tar cf - . ) | (cd /dest/directory && tar xvfp -)

HTH

	Torsten
