Message-ID: <4017E80E.4050500@gene.concordia.ca>
From: Chris Beck <cbeck@gene.concordia.ca>
MIME-Version: 1.0
Subject: Re: [linux-lvm] RE:LVM Snapshots for remote archiving.
References: <C80380E6149238449E1AE20B159358620D9B4F@pinewood.ncl.ac.uk>
In-Reply-To: <C80380E6149238449E1AE20B159358620D9B4F@pinewood.ncl.ac.uk>
Content-Transfer-Encoding: quoted-printable
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
Date: Wed Jan 28 11:50:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@sistina.com

Yah, that works, but I can't really archive the whole thing to tape on a=20
regular basis - I've got scads of large image files and other sundries=20
that will very quickly go above the capacity of convenient taping.

I guess I'm not being clear ... I don't want the snapshot volume, I want=20
the set of writes that are stored somewhere while the snapshot is in=20
existance.

It is whispered that C R Ritson was heard, on or about 1/28/2004 4:30 AM=20
to say:

>>I want to use 24-hour snap shots as an archival tool.
>>I have 2 identical file servers, one primary and one as an off-site=3D2=
0
>>mirror.  I'd like the primary system to generate a transaction=20
>>log that=3D20
>>rolls over every 24-hours and gets transmitted to the remote site.
>>   =20
>>
>
>I do something similar but with tapes, not a second server. Every
>evening, about 15 minutes before the backups, I delete an old snapshot
>and create a new one. As this snapshot is mounted and exported via NFS I
>have to undo this first (which has caused slight problems,
>occasionally). I then backup the newly created snapshot to tape using
>amanda. Using the snapshot ensures that amanda and dump (even though
>working at the block level) is guaranteed not to see a changing
>filesystem, and the snapshot remains available for most of the next 24
>hours for a user-initiated recovery of yesterday's version of a file.
>Any longer than that, and we have to go to the tapes, but amanda's
>indexing makes it quite easy to step back in time and see the filenames
>that were previously on disk (though not change dates). Such as it is, I
>can make the snapshot script available.
>
>Chris Ritson (Computing Officer)
> =20
>

--=20
Chris Beck / Y.A.B.A. / Fungal Genomics
CFSG / Concordia University
"La loi dans sa majestueuse =E9galit=E9, interdit =E0 tous, aux riches co=
mme
aux pauvres de dormir sous les ponts, de coucher dans la rue et de voler
du pain." -- Anatole France (Les Lys Rouge - 1894)
