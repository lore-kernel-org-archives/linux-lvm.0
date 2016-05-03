Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u43D1cOV011765
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Tue, 3 May 2016 09:01:38 -0400
Received: from nm18-vm0.bullet.mail.ne1.yahoo.com
	(nm18-vm0.bullet.mail.ne1.yahoo.com [98.138.91.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 865FA78230
	for <linux-lvm@redhat.com>; Tue,  3 May 2016 13:01:32 +0000 (UTC)
Date: Tue, 3 May 2016 13:01:30 +0000 (UTC)
From: matthew patton <pattonme@yahoo.com>
Message-ID: <1614984310.1700582.1462280490763.JavaMail.yahoo@mail.yahoo.com>
MIME-Version: 1.0
References: <1614984310.1700582.1462280490763.JavaMail.yahoo.ref@mail.yahoo.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] thin handling of available space
Reply-To: matthew patton <pattonme@yahoo.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 5/2/16, Mark Mielke <mark.mielke@gmail.com> wrote:

<quote>
 very small use case in reality. I think large service
 providers would use Ceph or EMC or NetApp, or some such
 technology to provision large amounts of storage per
 customer, and LVM would be used more at the level of a
 single customer, or a single machine.
</quote>

Ceph?!? yeah I don't think so.

If you thin-provision an EMC/Netapp volume and the block device runs out of=
 blocks (aka Raid Group is full) all volumes on it will drop OFFLINE. They =
don't even go RO. Poof, they disappear. Why? Because there is no guarantee =
that every NFS client, every iSCSI client, every FC client is going to do t=
he right thing. The only reliable means of telling everyone "shit just brok=
e" is for the asset to disappear.

All in-flight writes to the volume that the array ACK'd are still good even=
 if they haven't been de-staged to the intended device thanks to NVRAM and =
the array's journal device.

<quote>
 In these cases, I
 would expect that LVM thin volumes should not be used across
 multiple customers without understanding the exact type of
 churn expected, to understand what the maximum allocation
 that would be required.
</quote>

sure, but that spells responsible sysadmin. Xen's post implied he didn't wa=
nt to be bothered to manage his block layer  that magically the FS' job was=
 to work closely with the block layer to suss out when it was safe to keep =
accepting writes. There's an answer to "works closely with block layer" - i=
t's spelled BTRFS and ZFS.

LVM has no obligation to protect careless sysadmins doing dangerous things =
from themselves. There is nothing wrong with using THIN every which way you=
 want just as long as you understand and handle the eventuality of extent e=
xhaustion. Even thin snaps go invalid if it needs to track a change and can=
't allocate space for the 'copy'.

Responsible usage has nothing to do with single vs multiple customers. Thou=
gh Xen broached the 'hosting' example and in the cut-rate hosting business =
over-provisioning is rampant. It's not a problem unless the syadmin drops t=
he ball.


> Amazon would make sure to have enough storage to meet my requirement if I=
 need them.

Yes, because Amazon is a RESPONSIBLE sysadmin and has put in place tools to=
 manage the fact they are thin-provisoning and to make damn sure they can c=
ash the checks they are writing.

 =C2=A0
> the nature of the block device, such as "how much space
> do you *really* have left?"

So you're going to write and then backport "second guess the block layer" c=
ode to all filesystems in common use and god knows how many versions back? =
Of course not. Just try to get on the EXT developer mailing list and ask th=
em to write "block layer second-guessing code (aka branch on device flag=3D=
thin)" because THINP will cause problems for the FS when it runs out of ext=
ents. To which the obvious and correct response will be "Don't use THINP if=
 you're not prepared to handle it's pre-requisites."

> you and the other people. You think the block storage should
> be as transparent as possible, as if the storage was not
> thin. Others, including me, think that this theory is
> impractical

Then by all means go ahead and retrofit all known filesystems with the extr=
a logic. ALL of the filesystems were written with the understanding that th=
e block layer is telling the truth and that any "white lie" was benign in s=
o much that it would be made good and thus could be assumed to be "truth" f=
or practical purpose.
