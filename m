Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jATKnOV03373
	for <linux-lvm@redhat.com>; Tue, 29 Nov 2005 15:49:24 -0500
Received: from mail.gist.net.au (mail.gist.net.au [203.20.102.8])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jATKnHmq006902
	for <linux-lvm@redhat.com>; Tue, 29 Nov 2005 15:49:18 -0500
Received: from localhost (mail [127.0.0.1])
	by mail.gist.net.au (Postfix) with ESMTP id 1EC131E142A
	for <linux-lvm@redhat.com>; Wed, 30 Nov 2005 07:20:25 +1030 (CST)
Received: from mail.gist.net.au ([127.0.0.1])
	by localhost (mail.gist.net.au [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 16022-01 for <linux-lvm@redhat.com>;
	Wed, 30 Nov 2005 07:20:24 +1030 (CST)
Received: from wespac.com.au (pwf.my.cool.net.au [203.20.102.241])
	by mail.gist.net.au (Postfix) with ESMTP id 8AB581E1429
	for <linux-lvm@redhat.com>; Wed, 30 Nov 2005 07:20:24 +1030 (CST)
MIME-Version: 1.0
Content-class: urn:content-classes:message
Subject: RE: [linux-lvm] Enterprise Backup Software with good support for LVM
Date: Wed, 30 Nov 2005 07:19:12 +1030
Message-ID: <EC70EFBFB6977A478BEB386684E8A74217AE5C@pwfsbs01.pwf.local>
From: "Allen Bolderoff" <allen@gist.net.au>
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
To: LVM general discussion and development <linux-lvm@redhat.com>



> -----Original Message-----
> From: linux-lvm-bounces@redhat.com
[mailto:linux-lvm-bounces@redhat.com]
> On Behalf Of David Brown
> Sent: Wednesday, 30 November 2005 5:49 AM
> To: LVM general discussion and development
> Subject: Re: [linux-lvm] Enterprise Backup Software with good support
for
> LVM
> 
> On Tue, Nov 29, 2005 at 01:43:17PM -0500, Steffen Plotner wrote:
> 
> > I would like to add that creating backups of LVM snapshots is
sensible,
> > as the data is in a crash-consistent state. Today's operating
systems
> > can definitely handle this type of state. I have developed scripts
that
> > effectively netcat contents from LVM snapshots to a remote machine
> > (either into another logical volume or simply a file).
> 
> One other thing to point out.  Any backup utility that is based on
> timestamps, as opposed to a file database, is going to occasionally
miss
> changes made between the creation of the snapshot and the invocation
of
> the
> backup.

Not necessarily LVM specific, However, I am sure it will work with
snapshots, we have great success with backuppc - uses tar and/or rsync
and some clever compression/hardlinking to create easy to restore
backups with archiving all onto one partition.

If you haven't already, then check it out.
http://backuppc.sourceforge.net/

Allen Bolderoff
