Date: Fri, 1 Sep 2000 14:33:09 +0200
From: Jan Niehusmann <jan@gondor.com>
Subject: Re: [linux-lvm] LVM and sw RAID1
Message-ID: <20000901143309.A7745@gondor.com>
References: <20000823162957.B8398@gospelcom.net> <20000825203944.E5159@gospelcom.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20000825203944.E5159@gospelcom.net>; from pcg@gospelcom.net on Fri, Aug 25, 2000 at 08:39:44PM -0400
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Green <pcg@gospelcom.net>
Cc: linux-lvm@msede.com

On Fri, Aug 25, 2000 at 08:39:44PM -0400, Peter Green wrote:
> Just as a followup, with the exact same system BUT using the SuSE lvm tools
> (lvm-0.8-70; see rpmfind.net), everything seems to work. (The Mandrake RPM
> at rpmfind did *not* work.)

could you please try it again with lvm-0.8final-0.2mdk.i586.rpm? It's available
from http://www.hitnet.rwth-aachen.de/~jan/lvm/lvm-0.8final-0.2mdk.i586.rpm

I added some fixes to version -0.1mdk, and IIRC one of them had something
to do with md scanning. (As I don't use RAID myself, it am not so sure...)

Note that it's not an official mandrake rpm.

> I would be interested in seeing what SuSE has done to the source for the
> tools. I'm sure the developers here ought to be as well. :)

The source is here:
http://www.hitnet.rwth-aachen.de/~jan/lvm/lvm-0.8final-0.2mdk.src.rpm

Jan
