Date: Thu, 8 Jun 2000 01:47:35 +0100 (IST)
From: Paul Jakma <paul@clubi.ie>
Subject: Re: [linux-lvm] LVM 0.8final for 2.2.15/2.2.16?
In-Reply-To: <200006080022.CAA16063@e35.marxmeier.com>
Message-ID: <Pine.LNX.4.21.0006080135510.26807-100000@fogarty.jakma.org>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Marxmeier <mike@msede.com>
Cc: jan@gondor.com, ak@suse.de, linux-lvm@msede.com

On Thu, 8 Jun 2000, Michael Marxmeier wrote:

> IMHO when creating a snapshot LVM could simply sync all outstanding
> buffers for the block device vialog block_fsync() (not sure if this

to be 100% safe there must be no possibility that some fs code could
run between block_fsync() and the actual point of snapshot creation i
think. (right?)
 
> does a lock_kernel() is might even be sufficient.
> 
> Any reason why this is not suffiecient?
> 

if you can be sure that lvm-snapshot won't be intterrupted between
the sync and the actual snapshot, then it should be ok, shouldn't it?

> Michael
> 

regards,
-- 
Paul Jakma	paul@clubi.ie
PGP5 key: http://www.clubi.ie/jakma/publickey.txt
-------------------------------------------
Fortune:
The unfacts, did we have them, are too imprecisely few to warrant our certitude.
