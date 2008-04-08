Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m389u3X5028146
	for <linux-lvm@redhat.com>; Tue, 8 Apr 2008 05:56:03 -0400
Received: from cluster-f.mailcontrol.com (cluster-f.mailcontrol.com
	[85.119.2.190])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m389tbK1016603
	for <linux-lvm@redhat.com>; Tue, 8 Apr 2008 05:55:38 -0400
Received: from mx.zetex.com (mx.zetex.com [194.129.23.24] (may be forged))
	by rly26f.srv.mailcontrol.com (MailControl) with ESMTP id
	m389tUmO023227
	for <linux-lvm@redhat.com>; Tue, 8 Apr 2008 10:55:30 +0100
Received: from zen.zetex.local (zen.zetex.com [192.168.230.14])
	by mx.zetex.com (8.9.3/8.9.3) with ESMTP id LAA09175
	for <linux-lvm@redhat.com>; Tue, 8 Apr 2008 11:05:49 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] LVM mirroring questions...
Date: Tue, 8 Apr 2008 10:55:25 +0100
Message-ID: <A374F37068535C46BFCF8D48CF29AA7FB366F2@zen.zetex.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello.

Just wanted to point out quickly, although it doesn't actually answer
the question, linux software raid may be an option for you. Set both
partitions to Linux raid, then use mdadm to create a RAID 1 accross the
2 partitions.

I am currently running a similar setup, except I am using a raid5 across
4 partitions, with a raid1 and a raid10 earlier in the disk for OS, LVM
on the raid5, and an additional VG containing a mix of striped, linear
and mirrored volumes.

Mouse

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Jess Bromley
Sent: 08 April 2008 10:15
To: linux-lvm@redhat.com
Subject: [linux-lvm] LVM mirroring questions...

Hi all,

I've been trying to find out about LVM mirroring, but it's hard to
find much information in the documentation.

Is mirroring considered stable/ready for production use yet?  "man
lvcreate" and "man lvconvert" suggest that the current stable versions
support creating mirrored volumes, but the HOWTO has nothing to say
about it.

On a more detailed note, what sort of size does the physical volume
for the disk log need to be in relation to the size of the logical
volume to be mirrored, and is there any way to specify which physical
volume will hold the disk log (either using lvconvert or lvcreate)?

I've got a situation where I want to mirror only a partition of a
physical disk on to that of another physical disk, not the whole disk;
so software/hardware RAID isn't an option.

Thanks for your help,
J Bromley

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


 This has been checked by www.blackspider.com 


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

 
