From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] restoring a volume group?
Message-Id: <20020220161136.F1506@lynx.adilger.int>
References: <E16deQF-0003Mb-00@hermes.sistina.com>
    <002c01c1ba5d$0d813160$0300000a@pacbell.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <002c01c1ba5d$0d813160$0300000a@pacbell.net>; from e@arix.com
    on Wed, Feb 20, 2002 at 02:22:16PM -0800
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
Date: Wed Feb 20 17:11:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Erick Calder <e@arix.com>
Cc: linux-lvm@sistina.com

On Feb 20, 2002  14:22 -0800, Erick Calder wrote:
> recently I did something horrible to my system (was building an RPM with
> someone else's spec file which performed a "rm -rf /" (as root)) and as I
> have everything (/boot, /root, /usr, /etc, /lib... etc.) on a single
> partition (/dev/hda1) and seemed unable to restore from dumps on the live
> filesystem I was forced to install Linux on a different partition so I could
> mount /dev/hda1 without it being my root...  trouble was I didn't have a
> spare partition so I had to take /dev/hda3, one of the physical volumes in
> my volume group.
> 
> I thus installed Linux there blowing away what was there, did my restore,
> put the partition type back to LVM and then did a "pvcreate /dev/hda3"...
> however, I found I could not reload the volume... "vgchange -a y" reporting
> there were no volume groups found...
> 
> I therefore deleted /dev/LVM (my volume group) and its contents, and tried
> to recreate it:
> 
> 	# vgcreate /dev/LVM /dev/hda3 /dev/hdc
> 
> but this complained that /dev/hdc already belonged to the group LVM, so a:
> 
> 	# pvcreate -ff /dev/hdc
> 
> and I promptly blew away the data there, allowing me to start from
> scratch...

Ok, basically a series of wrong operations has gotten you into a hole...

The correct order of operations would have been:
- Don't use bad spec file (oops).
- Test your backup (yes, hindsight is golden).
- Use a rescue disk to boot and recover your data.
- As long as you are not reformatting, you could have reinstalled over the
  old root partition and it would have kept all of your data.

> now, after my long description (and thank you for taking the interest to
> read this far), my question is: was my data in /dev/hdc in any way
> recoverable?  given the circumstances, did I take the only steps I could
> have taken? and what can any of you suggest I could/should have done
> differently?

Now, as to the LVM part:
- You should have used vgcfgrestore to restore the LVM metadata to
  /dev/hda3, and all would have been well.
- Your data on /dev/hdc may still be recoverable, depending on what you
  have done in the meantime.  Try vgcfgrestore for both hda3 and hdc and
  you might get it back.
- If you have whole filesystems contained on /dev/hdc you can use something
  like gpart (or findsuper in the e2fsprogs source is best for ext2) to find
  the filesystem superblock and recover the whole fs.

> p.s. in the time I've been away from the list I've learnt a lot about
> building RPMs... so as I move forward I am still hopeful to make good on a
> promise to build RPMs for LVM... will be back with more on that.

Well, I don't think people will be rushing out to use your .spec files any
time soon ;-).

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
