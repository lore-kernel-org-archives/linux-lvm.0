Message-ID: <3D6159EA.1070406@birddog.com>
From: "Kirby C. Bohling" <kbohling@birddog.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] accidently formatted a physical volume...
References: <20020819192319.GB25631@grimlock> <284650000.1029786116@[192.168.200.4]> <1265620671.20020819224124@tnonline.net> <20020819205005.GA26781@grimlock>
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
Date: Mon Aug 19 15:58:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Start by using dd or something to get an original image of the drive 
before anything else bad is done to it.  Copy it off to another drive, 
copy to tape.  Personally, I'd copy it to a big filesystem (if it 
supports bigger then 2 GB), and see if you can mount it loopback.  I 
know I read on the LKML a guy mounted several filesytems that way that 
were considerablely larger then 2GB.

With the backup, when something goes wrong you can always start over 
fresh without worring about the undoing your original attempts.

I'd imagine that doing a vgcfgrestore to the device, followed by 
mounting the filesystem without fsck'ing it will get you some data. 
Running fsck on it afterwards and see what else you can get.  Do *_NOT_* 
try that without a backup of the original media.  Your big problem is 
that you're going to have superblocks and inode tables written right in 
the middle of your drive other then that, everything should be on the 
disk right where you left it.

I had a friend who just lost an ext2 drive due to a power surge the 
other day, fscking it was destorying the filesystem, just mounting it 
and running tar got us 90% of the data.  Fortuantely the other 10% came 
off a RH CD so it was no problem.

	Thanks,
		Kirby

Adam McDaniel wrote:
> On Mon, Aug 19, 2002 at 10:41:24PM +0200, Anders Widman wrote:
> 
>>>>Or, is there any way that I can fix/restore the formatted drive?
>>>
>>>Not at the *NIX level. If the data were SERIOUSLY valuable
>>>it can be recovered by physical means. Short of that I'd
>>>say it's time to reach for your tapes...
>>
> 
> The unfortunate thing was that timing couldn't have been worse. The
> last backup I made before the incident would only contain a fraction
> of the info that I actually need. Partly my fault, I know, but being
> able to restore the drive would be the goal.
> 
> 
>>Are you sure? The data should be there in the co-worker did not make a
>>"full" (zeroing blocks) format. Is it not possible to restore the LVM
>>headers (or what it is called) on that drive?
> 
> 
> I do know that it was a straight simple format, literally
> 'mkfs.ext2 /dev/hdb', so I know the info is still there. My experience
> in this is rather limited, so I'm not sure of the best way to fish it
> out.
> 
