Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jASK9RV09853
	for <linux-lvm@redhat.com>; Mon, 28 Nov 2005 15:09:27 -0500
Received: from cichlid.com (dsl3-63-249-91-37.cruzio.com [63.249.91.37])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jASK93Pu030791
	for <linux-lvm@redhat.com>; Mon, 28 Nov 2005 15:09:09 -0500
Received: from cichlid.com (cichlid.com [127.0.0.1])
	by cichlid.com (8.13.1/8.12.5) with ESMTP id jASK8ktp002770
	for <linux-lvm@redhat.com>; Mon, 28 Nov 2005 12:08:52 -0800
Date: Mon, 28 Nov 2005 12:08:43 -0800
From: Andrew Burgess <aab@cichlid.com>
Message-Id: <200511282008.jASK8hgF002611@cichlid.com>
Subject: [linux-lvm] Re: One of 8 PVs dead - Trying to rescue data from
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

..
>the general
>question about recovering data from a single LVM drive. In my 2 drive
>system it wouldn't work. Any other ideas? I would assume that if one
>drive failed it should be trivial to be able to access the information
>on the remaining drive. If not, then I would be a lot safer going back
>to a non-LVM system using the two drives as distinct partitions.

The only way I can think of to do it automatically is to use the repair tool
for the filesystem. You would probably have to create another PV to replace the
failed one, (zero it first) give it the same UID and recreate the volume with
the new PV in the correct place. Then let e2fsck (if an ext2 filesystem) find
whatever it can. It would be nice to make copies of the good PVs in case this
doesn't work satisfactorily if you have the space. Or would a snapshot help here?

You might ask on the filesystem specific mailing list if this has any chance.

HTH
