From: "Erick Calder" <e@arix.com>
Subject: RE: [linux-lvm] read_intr errors
Message-ID: <003001c15c42$f7faa4c0$0300000a@pacbell.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20011018084219.A564@tykepenguin.com>
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
Date: Tue Oct 23 23:19:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Patrick,

sorry for the delay, it takes 12 hours to back up this guy and another 12 to
verify... and I had problems so I had to do it several times.

so if I get you correctly, I should be able to do badblock check (instead of
a mke2fs with -c option as has been suggested) and get an evaluation for
whether this drive has problems equally well, no?

here's what I did:

# df -k
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/hda1             38456308   2670876  33831932   8% /
/dev/LVM/mp3z         29540436  13308716  14731152  48% /var/mp3z

# umount /dev/LVM/mp3z
# vgchange -a n
vgchange -- volume group "LVM" successfully deactivated

root@beowulf:/root # badblocks -s /dev/hdc 29540436
Checking for bad blocks (read-only test): done

as you can see, no errors.  Now, having said that, I've come to realise that
the errors I get happen when accessing my tape drive (which is scsi) - at
least I think that's what's happening... weird.  do you then think this is
related to the problems others have had? and if so, was there a fix?

- e r i c k

-----Original Message-----
From:	linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com] On
Behalf Of Patrick Caulfield
Sent:	Thursday, October 18, 2001 12:42 AM
To:	linux-lvm@sistina.com
Subject:	Re: [linux-lvm] read_intr errors

On Wed, Oct 17, 2001 at 01:08:30PM -0700, Erick Calder wrote:
> Patrick,
>
> > I'm afraid they look a lot like hardware errors to me. It might just be
> that it
> > doesn't like MULTI_MODE though. I'm not an IDE expert.
>
> I turned MULTI_MODE on at a suggestion aimed to fix these very problems...
> they certainly are hardware errors but as we know anecdotally from other
> postings, the hardware can be perfectly ok and the errors still persist.
as
> my drive is brand new and I had no such errors before installing a PV on
it,
> it seems reasonable to think it's not the drive.
>
> is my data at risk of corruption?  I've slowly been checking the integrity
> of files but I'm concerned about backing up bad data!

Just because the drive is new doesn't mean it's not bust(!).

I would do as someone suggested and run badblocks on the disk and if it
gives
errors then take it back. If not then it may be related to some reports we
saw
a while ago about LVM reading past the end of a SCSI disk - you can easily
verify this by making a filesystem on the PV rather that using LVM (If
you're
happy with your backups that is...).

patrick


_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
