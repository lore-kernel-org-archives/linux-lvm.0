content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID: <C80380E6149238449E1AE20B159358620D9B4F@pinewood.ncl.ac.uk>
From: "C R Ritson" <C.R.Ritson@newcastle.ac.uk>
Subject: [linux-lvm] RE:LVM Snapshots for remote archiving.
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
Date: Wed Jan 28 04:35:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

>I want to use 24-hour snap shots as an archival tool.
>I have 2 identical file servers, one primary and one as an =
off-site=3D20
>mirror.  I'd like the primary system to generate a transaction=20
>log that=3D20
>rolls over every 24-hours and gets transmitted to the remote site.

I do something similar but with tapes, not a second server. Every
evening, about 15 minutes before the backups, I delete an old snapshot
and create a new one. As this snapshot is mounted and exported via NFS I
have to undo this first (which has caused slight problems,
occasionally). I then backup the newly created snapshot to tape using
amanda. Using the snapshot ensures that amanda and dump (even though
working at the block level) is guaranteed not to see a changing
filesystem, and the snapshot remains available for most of the next 24
hours for a user-initiated recovery of yesterday's version of a file.
Any longer than that, and we have to go to the tapes, but amanda's
indexing makes it quite easy to step back in time and see the filenames
that were previously on disk (though not change dates). Such as it is, I
can make the snapshot script available.

Chris Ritson (Computing Officer)

Rm 618, Claremont Bridge,       EMAIL: C.R.Ritson@newcastle.ac.uk
School of Computing Science,    PHONE: +44 191 222 8175
University of Newcastle,        FAX  : +44 191 222 8232
Newcastle on Tyne, UK NE1 7RU.  http://www.cs.ncl.ac.uk/~c.r.ritson/
