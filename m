From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] read_intr errors
Message-ID: <20011024101331.A2271@tykepenguin.com>
References: <20011018084219.A564@tykepenguin.com> <003001c15c42$f7faa4c0$0300000a@pacbell.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <003001c15c42$f7faa4c0$0300000a@pacbell.net>; from e@arix.com on Tue, Oct 23, 2001 at 09:18:44PM -0700
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
Date: Wed Oct 24 04:25:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Oct 23, 2001 at 09:18:44PM -0700, Erick Calder wrote:
> Patrick,
> 
> sorry for the delay, it takes 12 hours to back up this guy and another 12 to
> verify... and I had problems so I had to do it several times.
> 
> so if I get you correctly, I should be able to do badblock check (instead of
> a mke2fs with -c option as has been suggested) and get an evaluation for
> whether this drive has problems equally well, no?
> 
> here's what I did:
> 
> # df -k
> Filesystem           1k-blocks      Used Available Use% Mounted on
> /dev/hda1             38456308   2670876  33831932   8% /
> /dev/LVM/mp3z         29540436  13308716  14731152  48% /var/mp3z
> 
> # umount /dev/LVM/mp3z
> # vgchange -a n
> vgchange -- volume group "LVM" successfully deactivated
> 
> root@beowulf:/root # badblocks -s /dev/hdc 29540436
> Checking for bad blocks (read-only test): done

Well that looks OK
 
> as you can see, no errors.  Now, having said that, I've come to realise that
> the errors I get happen when accessing my tape drive (which is scsi) - at
> least I think that's what's happening... weird.  do you then think this is
> related to the problems others have had? and if so, was there a fix?

The thread about SCSI errors just stopped so I don't know what happened there.
There was some thought that maybe LVM was trying to access beyond the end of the
disk so you could check to see if the LV is using all the space on /dev/hdc and
back it off a little so see if that helps. It may also be worth upgrading to
LVM 1.0.1rc4.

If it is the SCSI tape drive interfering then that's really odd because SCSI
shouldnot interfere with IDE unles you have some interrupt clashes or perhaps
bad cabling causing signal noise.

Not very conclusive I'm afraid, but I did say I wasn't an IDE expert!

patrick
