Message-ID: <3BA00574.FC62E674@carolina.rr.com>
Date: Wed, 12 Sep 2001 21:01:40 -0400
From: Jason Edgecombe <jedgecombe@carolina.rr.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM
References: <NBBBJHKIOKPKOGOEPEDPMEDPDNAA.stuart@bh90210.net>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: stuart@bh90210.net
Cc: linux-lvm@sistina.com

hi,

  according to reiserfs's FAQ:
http://www.reiserfs.org/faq.html#ReiserFS-as-root

you need the notail option on the /boot partition.
the fstab might look as follows:
/dev/hda1    /boot   reiserfs    defaults,notail  0 0
/dev/hda2    /   reiserfs    defaults  0 0

if there isn't the word "notail" in the fourth column of your root fstab
entry, then you ARE booting with tails.

according the lilo changelog:
ftp://brun.dyndns.org/pub/linux/lilo/CHANGES

lilo has been able to boot from a reiserfs partition with tail support
since version 21.6 (Oct. 1, 2000)

*under an rpm-based distro such as redhat or mandrake, "rpm -qi lilo"
should give you the version. (assuming you haven't downloaded lilo as a
tarball and compiled it.)

Both were last modified in August 2001, I don't know which to believe.
For safety sake, I made my /boot ext2. Most recent computers (within the
past two years) can boot from a partition after the 1024 boundary. I
just like to make a separate /boot at the beginning of the drive as a
precaution.

as for the matter of initrd's, this is the way that I understand it:
in a non-lvm root fs, your root fs type must either be compiled in or in
the initrd image.
in a lvm root, you MUST have an initrd even if lvm is compiled into the
kernel (not as a module) because you need to run a vgchange -ay and you
need your lvm config files in the initrd.

as for having /boot (booting the kernel) straight in an lvm fs, I have
no idea.


If I am wrong, someone please correct me.

Sincerely,
Jason Edgecombe

"IT3 Stuart B. Tener, USNR-R" wrote:
>         I am curious what version of lilo in fact supports ReiserFS tails. I am running Mandrake 8.0, and using the lilo supplied therewith, and have been booting a / partition as ReiserFS (with tails I believe, how do I check?).
