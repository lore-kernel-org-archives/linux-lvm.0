Message-ID: <3F2B1A3E.7060906@opendreams.net>
From: Jesse Molina <jesse@opendreams.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Performance question
References: <BD9F7FC07AAE534CAFF3DCC5DD395D6E046D85C0@uspto-is-111.uspto.gov>
In-Reply-To: <BD9F7FC07AAE534CAFF3DCC5DD395D6E046D85C0@uspto-is-111.uspto.gov>
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Fri Aug  1 20:57:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hi!

With what you are doing;  probably not.

Why are you using LVM in the first place?  Sticking something between 
your data and the physical device is probably only going to slow stuff 
down.  You are already stripping with your RAID 0 controller.  Having 
LVM strip is not going to do anything because LVM sees only one device.

This is like an analogy of making my car faster by putting a spoiler on 
it.  LVM = features, not speed.  If you don't need LVMs features, get 
rid of it!

If you want more speed, try solid state drives, tuning your controller 
to stripe efficiently, adding controller cache, configuring Oracle to 
use the raw storage device instead of an underlaying filesystem, or add 
more drives to your array.

The obvious is the answer.

Remember that you can't fix it if you don't know what to fix.  If you 
don't know exactly where your bottleneck is, you can't resolve it.

I really hope that data isn't important since you don't seem to have any 
redundancy there.

Do some Bonnie++ on there and let us know how it goes if you try your 
solution.

Have fun!  Good luck in your project.



Griffin, Michael (PEC) wrote:

> I have a Dell 4600 with a PERC quad channel raid controller attached to
> an external disk array (14 disks).  I am running Oracle 9i on Red Hat
> Linux.  I am running an import from an Oracle 8i database and
> normalizing the data.  My 3 import files are between 2-4GB each
> compressed, but grow to between 25-40GB each uncompressed.  It takes
> approximately 10 hours to import these into my database.  I currently
> have three disk arrays set up in RAID 0 to achieve as much speed as
> possible (so far).  
> 
> My question is, would it help my performance if I were to turn off RAID
> on the controller(s) and use LVM?  Any suggested configs would be
> helpful.
> 
> Thank you,
> 
> Michael
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 
# Jesse Molina
# Mail = jesse@opendreams.net
# Page = page-jesse@opendreams.net
# Cell = 1.407.970.0280
# Web  = http://www.opendreams.net/jesse/
