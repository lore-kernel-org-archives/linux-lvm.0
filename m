Date: Thu, 26 Aug 1999 18:28:59 -0400 (EDT)
From: Shane Shrybman <shane@zeke.yi.org>
Subject: [linux-lvm] Revised petition WAS: LVM in stock kernel!?
Message-ID: <Pine.LNX.3.96.990826175120.22041A-100000@zeke.sympatico.ca>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm mailing list <linux-lvm@msede.com>


I have added a few more points that I gleaned from this list. I have also
taken the liberty of adding a SUPPORTERS section with people's names and
email addresses. Please let me know if you have names to add or delete.

We need more SUPPORTERS! 

Please tell me explicitly if you would like to be added to the list, ( I
don't feel comfortable adding names to a petition otherwise).

PROS
- LVM is almost a necessity when managing large amounts of storage.
- it is one of the key enablers to open enterprise doors.
- Many unix people think that storage layout is one of the most difficult
  aspects of maintaining a system. LVM simply makes storage management
  much more flexible by allowing storage to be reallocated easily at
  anytime.
- Folks coming to Linux from other UNIXes which use an LVM (HP, AIX,
  Solaris, IRIX etc..) will be familiar and comfortable with LVM concepts
  and will more readily embrace the penguin.
- The "out of storage space" is a very common problem for users especially
  new users. LVM makes resizing allocated space easier. This is perhaps
  the most common problem I here about from new users.
- LVM is not a new concept and has been proven to be indispensible in
  other OSes, (ie. It is not just some hair-brained scheme that just makes
  things harder to learn and more complicated).
- LVM provides the information to check i/o bottlenecks in a more fine
  grained manner and enables the user to solve them.
- its implementation doesn't add much complexity to the
  block i/o layer (compared to for eg. MD) and therefore avoids
  instabilities.
- Opens the door for storage management GUIs that would make storage
  management easier for all users.
- Integration with IBM's ADSM backup allows Linux machines to be backed up
  "snapshot" style by simply syncing volumes and grabbing volume data.
- The ability to add a sort of volume log allows almost instant volume
  resyncing while maintaining an active data volume.
- The (unique) ability to use either physical disks or partitions (and
  even flat files via the loopback device) allows for a
  very flexible Volume Group makeup (e.g. I don't get stuck having to
  allocate all of that 18GB drive to a volume when I only
  need 4GB of it, etc.).  NOTE:  This does add some cons when it comes to
  deporting (exporting) volumes and migrating disks,
  but it should be easy enough to overcome.

CONS
- Using LVM is by definition adding a another logical layer for storage.
  Users not already familiar with an LVM will have to do some learning, or
  not use LVM.
- some cost in performance since there's an additional layer of
  translation before you get to the actual disk blocks....


SUPPORTERS
------------------------------------------------------------------
Heinz Mauelshagen	mauelsha@ez-darmstadt.telekom.de
S. Ryan Quick		ryan@phaedo.com
Shane Shrybman		shane@zeke.yi.org
Mike Manocchio		manocc@iname.com
Ernie Lim		elim@ern-e.org
Marcus Ruehmann		m.ruehmann@mail.isis.de
James Pattinson		jamesp@aethos.co.uk
Fernando Dammous	ferdam@internetcom.com.br
Pascal			pamvdam@ramoth.xs4all.nl
Ulrik De Bie		winmute@atlantique.venturi.net
Klaus Strebel		stb@ep-ag.com
Mark Adams		madams@jewels.com
Drew Smith		drew@winterland.mainland.ab.ca
Luca Berra		bluca@comedia.it
Jonny B.		brassow@lcse.umn.edu
Mats Wichmann		mats@laplaza.org
Mark Kolb		mkolb@srhs.org


Comments ?

Please feel free to edit and add your own points!

Shane
