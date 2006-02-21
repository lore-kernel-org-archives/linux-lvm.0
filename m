Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1LALI126146
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2006 05:21:18 -0500
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.183])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1LALCFI006610
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2006 05:21:13 -0500
Message-ID: <43FAE99A.4060609@gmx.net>
Date: Tue, 21 Feb 2006 11:21:14 +0100
From: Klaus Strebel <klaus.strebel@gmx.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Using LVM to snapshot Oracle
References: <E8AFFEFDBE97C94E9297963F0527A07B485D23@pmi00exf00.us.packetmotion.com>	<20060220220531.GA16484@percy.comedia.it>
	<20060220221114.GB16484@percy.comedia.it>
In-Reply-To: <20060220221114.GB16484@percy.comedia.it>
Content-Transfer-Encoding: quoted-printable
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Luca Berra schrieb:
> On Mon, Feb 20, 2006 at 11:05:32PM +0100, Luca Berra wrote:
> to clarify:
>> you can do hot backup, but you will need to tell oracle you are doing
>> so:
>>
>> you will need to have oracle in archive log mode
>>
>> you will need to manually set all tablespaces in backup mode:
>> alter tablespace XXX begin backup; (for all tablespaces)
>> alter system switch logfile;
> the snapshot creation part goes here
>=20
> NO >do your backup including the archive logs
>=20
>> alter tablespace XXX end backup; (for all tablespaces)
>=20
> do your backup here including the archive logs
> destroy the snapshot here.
>=20
>> it is a simple sql script to code
>>
>=20
Hi Mitchell, hi Luca,

well, despite i prefer using RMAN ( since 9iR2 it's once configured and=20
then you can always do your backup with a simple 'backup database' ) but=20
you need your database running in archived mode, which brings additional=20
space and backup needs.

The way Luca describes for a online-backup is the usual way that's=20
working since Oracle 7 ( or even 6, but just work with Oracle since 7.0=20
;-) ), but i think, if all ( really all !) files are on the same=20
snapshout and the snapshot is big enough( ;-) ), you should make a=20
logswitch, create a readonly snapshot, copy all the files ( including=20
control-files, and redo-logs ) and remove the snapshot. You can then=20
carefully try to use these files to restore the database. If you have=20
enough diskspace, you can shutdown your instance, rename all the files (=20
again incl. control-files and redo-logs ), restore the copies from the=20
snapshot and start the database carefully ( startup nomount; alter=20
database mount; select file#, name, status from v$datafile; -> all file=20
should be in status system or online ; alter database open; -> up again ).
I have nither the time nor the resources to test this on my own. But you=20
can share your results with us :-)

Ciao
Klaus


--=20
Mit freundlichen Gr=EF=BF=BDssen / best regards

Klaus Strebel, Dipl.-Inform. (FH), mailto:klaus.strebel@gmx.net

/"\
\ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
/ \
