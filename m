Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m1TBSJUI017462
	for <linux-lvm@redhat.com>; Fri, 29 Feb 2008 06:28:19 -0500
Received: from cluster-d.mailcontrol.com (cluster-d.mailcontrol.com
	[217.69.20.190])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m1TBRh7S010263
	for <linux-lvm@redhat.com>; Fri, 29 Feb 2008 06:27:44 -0500
Received: from mx.zetex.com (mx.zetex.com [194.129.23.24] (may be forged))
	by rly20d.srv.mailcontrol.com (MailControl) with ESMTP id
	m1TBRYeB021648
	for <linux-lvm@redhat.com>; Fri, 29 Feb 2008 11:27:35 GMT
Received: from zen.zetex.local (zen.zetex.com [192.168.230.14])
	by mx.zetex.com (8.9.3/8.9.3) with ESMTP id LAA18145
	for <linux-lvm@redhat.com>; Fri, 29 Feb 2008 11:35:43 GMT
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Fri, 29 Feb 2008 11:27:32 -0000
Message-ID: <A374F37068535C46BFCF8D48CF29AA7FA60045@zen.zetex.com>
From: "Karl Wagner" <kwagner@zetex.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Snapshot of a Snapshot
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

Hi

I was just wondering if there was a plan to add 'Snapshot of a Snapshot'
functionality to LVM2? If so, is there any timescale on it?

This would be a very useful feature, especially in a Xen environment.

Also, is there an easy way to backup and restore a snapshot? My scenario
is that I am running several Xen DomU's (Virtual machines, 4 of them to
be precise) from snapshots of a base image. However, if one dies (eg the
snapshot overflows, something which should not happen again but just in
case...) and I recreate the snapshot and restore the backup image I
took, it fills the snapshot up. It doesn't seem to check if the data
being written to the snapshot is the same as on the origin volume, just
adds the data to the snapshot anyway. Is there any way round this (apart
from the very slow script I currently have which checks each sector
before writing)?

Cheers in advance


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

 
