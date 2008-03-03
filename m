Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m239DwBp024654
	for <linux-lvm@redhat.com>; Mon, 3 Mar 2008 04:13:58 -0500
Received: from cluster-d.mailcontrol.com (cluster-d.mailcontrol.com
	[217.69.20.190])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m239DG4f030995
	for <linux-lvm@redhat.com>; Mon, 3 Mar 2008 04:13:17 -0500
Received: from mx.zetex.com (mx.zetex.com [194.129.23.24] (may be forged))
	by rly10d.srv.mailcontrol.com (MailControl) with ESMTP id
	m239D8Lx020051
	for <linux-lvm@redhat.com>; Mon, 3 Mar 2008 09:13:08 GMT
Received: from zen.zetex.local (zen.zetex.com [192.168.230.14])
	by mx.zetex.com (8.9.3/8.9.3) with ESMTP id JAA11356
	for <linux-lvm@redhat.com>; Mon, 3 Mar 2008 09:21:26 GMT
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: Re: [linux-lvm] Snapshot of a Snapshot
Date: Mon, 3 Mar 2008 09:13:05 -0000
Message-ID: <A374F37068535C46BFCF8D48CF29AA7FA60102@zen.zetex.com>
From: "Karl Wagner" <kwagner@zetex.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Not quite, although this would also be nice. Maybe I should explain my
current setup better.

Firstly, I have a Xen DomU machine running several Dom0's. As each Dom0
is very similar, I started off with a Base install, then created
snapshots to modify to create each Dom0. This had the advantage of
allowing me to set up a new Dom0 very easily, while taking less physical
disk space (and also the side effect that it runs quicker, think that's
something to do with the block device cache being used for the origin,
but I'm no expert so it may not...)

What I would like to be able to do is:
(a) be able to take a snapshot of one of these snapshots in order to
make backups, or have a bookmark in time if I am doing something I am
not sure of (in this instance a 'revert to snapshot' would be nice too)
(b) if I need to restore a backup, it would be nice to just be able to
dd the image I took as backup onto the snapshot device, without it
copying on every write, only copying the sectors (or chunks, whatever
the allocation unit for the snapshot COW device is) which are different.

These would also be useful for the SAN I am putting together.

Both of these I can do manually, the first by creating a snapshot using
device-mapper, the second by comparing the sector between the current
and the backup before writing. Snapshot of a snapshot done this way is
very useful but a pain to set up, although I have written a script to do
this for me. Restoration of a snapshot this way is painfully slow
(although if functionality of this sort either is not going to be
implemented or will take a long time I will recode it in C to
(hopefully) speed things up, currently I am using a hack together of
bash and perl scripts, just to get it done quickly).

Regards
Karl

Date: Fri, 29 Feb 2008 06:39:50 -0800
From: "Dan Kegel" <dank@kegel.com>
Subject: Re: [linux-lvm] Snapshot of a Snapshot
To: "LVM general discussion and development" <linux-lvm@redhat.com>
Message-ID:
	<a71bd89a0802290639t34ee72e7q4379df51e392b900@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 29, 2008 at 3:27 AM, Karl Wagner <kwagner@zetex.com> wrote:
>  I was just wondering if there was a plan to add 'Snapshot of a
Snapshot'
>  functionality to LVM2? If so, is there any timescale on it?
>
>  This would be a very useful feature, especially in a Xen environment.
>
>  Also, is there an easy way to backup and restore a snapshot? My
scenario
>  is that I am running several Xen DomU's (Virtual machines, 4 of them
to
>  be precise) from snapshots of a base image. However, if one dies (eg
the
>  snapshot overflows, something which should not happen again but just
in
>  case...) and I recreate the snapshot and restore the backup image I
>  took, it fills the snapshot up.

It sounds like you could use a 'revert to snapshot' feature.
Is that right?
- Dan


_________________________________________________________

Zetex Semiconductors - Solutions for an analog world.

http://www.zetex.com
http://www.zetex.cn

E-MAILS are susceptible to interference.  You should not assume that
the contents originated from the sender or the Zetex Group or that they 
have been accurately reproduced from their original form.
Zetex accepts no responsibility for information, errors or omissions in
this e-mail nor for its use or misuse nor for any act committed or
omitted in connection with this communication.
If in doubt, please verify the authenticity with the sender.
_________________________________________________________

 
