From: Oliver Jovic <jovi@unixag-zw.fh-kl.de>
Subject: Re: [linux-lvm] offtopic but ...
In-Reply-To: <20020508082357.B18631@connectlive.com>
Message-Id: <Pine.LNX.4.33.0205081533090.3518-100000@diablo.unixag-zw.fh-kl.de>
MIME-Version: 1.0
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
Date: Wed May  8 09:11:04 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, 8 May 2002, Tim wrote:

> > Hehe Tim,
> >
> > that was fast, but as i told little bit lower in the email I dont want to
> > put everything in a RAID. The RAID controller isnt the problem if you buy
> > me a further 160GB Maxtor i will buy the RAID contoller or do
> > software-RAID. ;-)
>
> Fair enough.  Personally (having to do this at work) I feel like an IDE
> enclosure or a hardware RAID card is a relatively small investment in
> data security, but then again, the 500GB I have live right now is not
> content that I can tolerate data loss on.  We probably should not use
> IDE drives for it at all, except that it is replicated onto a whole
> steaming mess of SCSI drives, also RAIDed up...

I would also use RAID if i had important data to store. No doubt about
that. But the data i have isnt so important. If I lose it i can live with
it but well if i would lost only the data which was on the harddrive which
gave up would be better. ;)

>
> I think your requirements are different than the ones I am used to.
>

I think also. We have a couple of machines here with RAID5 for important
data.

>
> > The goal is simply to combine more diskspace+more security then just a
> > LVM+one logical unit (mountpoint/device where you dont have to care all
> > the time
> > how the data gets stored and where)+better usage of the diskspace (you
> > dont have on the one everything free and the other is halffull.
>
> Makes sense, but I'm not sure how one would dynamically reallocate
> parity information while everything is in-flight (eg. live).
>

I think its easy. Maybe i just didnt described it good enough.

>
> > Or just imagine you would like to have 500gb and have only 4x3,5 slots to
> > build the harddrives in and the maximum size is at the moment 160GB. How
> > would you do it and you would give up some security for the advantage to
> > have more space but not to lose everything if one drive fails.
> > And the idea i described in the email below is somehow between a RAID0/LVM
> > and a RAID5.
>
> Again, the difference between my requirements and the ones you're
> outlining is that I simply call a vendor and order another enclosure
> when I need another 500GB.

Hehe wait i am searching for my postal address where you can also send me
some 500GB. ;-)

>
> I think I am beginning to see what your idea is, but the logistics of
> having LVM take care of the metadata seem rather daunting.
>

Well the idea had nothing to do with LVM. Its something 'totaly'
different. I wouldnt need to use LVM at all if there would be such a
solution i described.

Take a look at this:


			   application
				|
+----------------------------------------------------------------------
|
|			virtual device
|
+----------------------------------------------------------------------
    |             |            |            |
+----------+ +----------+ +----------+ +----------+
|          | |          | |          | |          |
| /dev/hda | | /dev/hdb | | /dev/hdc | | /dev/hdd |
|   ext3   | | reiserfs | |   xfs    | |  ext2    |
+----------- +----------+ +----------+ +----------+
 index file == index file


The index file contain the dirstructure/dirtree. Its stored/updated on
/dev/hda and /dev/hdb simultaneous so have always the index. Should be
configurable where to put the index file. Maybe also on more then 2
drives, simply how and where the user wants it.

Lets imagine the virutal device would be totally empty (this would mean
all drives are also empty, but already with a filesystem which could
differ as you see) and already defined with the drives /dev/hd[a-b].

If you know would create now there lets say a dir called "pub" he would
create it on /dev/hda.
We would put/cp now some files in that "pub" dir. He should still put it
on /dev/hda:/pub (strange syntax but describes it ;)).
When i know would create on my virtual device (lets call it VD) in VD:/pub
a dir called "linux" he should put this dir "linux" on /dev/hdb:/linux.

If i would now ls VD:/ i would see just the dir "pub" like it should als
be. If i change into pub my VG would know through the index file that
"linux" is a subdir form "pub" and that "linux" is physicaly stored on
/dev/hdb:linux.

It would simply doenst matter on which harddisk and with which fs the
harddrive is formated with. The VD doesnt cares about this. It would make
ti to me totaly transparent like LVM also doenst shows me where it stores
what.

If now lets say /dev/hdb would fail i would still have the directorytree
because i have these data in the index file on /dev/hda. The dirtree would
be complete but all files which where on /dev/hdb would be lost but i
would still have all data on /dev/hda and it would still run. Maybe i had
to reboot coz the harddrive would stop the machine .. but well after i
removed the failed harddrive from the VG i would have the rest still
accessable. The VG could then remove the dirs out of the tree which where
on /dev/hdb or i could simply mount /dev/hda and see whats on it but a
little bit unsorted ;) so its maybe better to do it then over the VG.

Well thats my idea. I hope this time a little bit clearer.

OJ :)
