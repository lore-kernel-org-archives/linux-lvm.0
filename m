Date: Fri, 12 Oct 2001 20:45:09 -0600
Subject: Re: [linux-lvm] pv recovery after trashing partition table.
Message-ID: <20011012.204509.-448365.0.james.cromie@juno.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Jim N Cromie <james.cromie@juno.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: adilger@turbolabs.com
Cc: linux-lvm@sistina.com

thanks Andreas,

to my supposition:

> 2) IS IT POSSIBLE THAT DESPITE MY SUCCESS MOUNTING hda 1-3,
particularly
> hda3, since thats ext2, (ie a real filesystem, with a real fsck).  Ive
> somehow got the partitions wrong, and thus pvdata is looking in the
wrong
> disk sector for its meta-data  ?

you wrote:
 
Correct.  It is possible that hda3 is larger than it should be, and is
stealing the beginning of hda4.  What you really want to have is "gpart"
which _should_ find the partition tables for you automatically.
 
Failing that, you could look at "dumpe2fs -h /dev/hda3" to find the
previous size of the filesystem there so you know how big to make it.
 

so following your suggestions,,

gpart.linux is telling me unexpected results:

hda1 data matches, allowing for the -1 offset of cylinder numbers, wrt
fdisk.
hda2 is reported as 94Mb DOS, not  Linux swap.
hda3-4 are un-recognized. (reported as zeros)


dumpe2fs is closer to expected.
dumpe2fs /dev/hda2 shows nothing - which is good, since this is a swap
partition.

dumpe2fs /dev/hda3 shows
Block-ct = 8032, Block-size = 1024

fdisk shows same partition having 16065 512 byte blocks, ie different by
1 block.
So I tried this new size - one less block. gpart.linux now finds 0
partitions.

fsck -V /dev/hda3 works, but doesnt really seem to check much.  No errors
reported, and
if the earlier partition table was correct, then this is silently wrong,
but...

Any suggestions on what this all means ?



Separately, is there an LVM PV super-block pattern that I could look for
?

I believe I caould take a representative od -x output fragment, replace
varying fields
with periods, and use it as a perl regular-expression to test against my
own od-x output.
If this works, then the block offset should be evident from the matching
addresses.

Am I half baked here ?




what does a 
