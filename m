Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3MAmNvW014546
	for <linux-lvm@redhat.com>; Tue, 22 Apr 2008 06:48:23 -0400
Received: from exprod7og112.obsmtp.com (exprod7og112.obsmtp.com [64.18.2.177])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3MAllKC019310
	for <linux-lvm@redhat.com>; Tue, 22 Apr 2008 06:47:48 -0400
Received: from stephane by ant.artesyncp.com with local (Exim 4.69)
	(envelope-from <stephane@artesyncp.com>) id 1JoG2K-0004Bs-UF
	for linux-lvm@redhat.com; Tue, 22 Apr 2008 11:47:45 +0100
Date: Tue, 22 Apr 2008 11:47:44 +0100
From: Stephane Chazelas <stephane.chazelas@emerson.com>
Subject: Re: [linux-lvm] Snapshot question...
Message-ID: <chaz20080422104744.GI20413@artesyncp.com>
References: <480DBE54.1090406@Media-Brokers.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <480DBE54.1090406@Media-Brokers.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

2008-04-22 06:30:44 -0400, Charles Marcus:
[...]
> So, I have allocated 5GB of 'free space' in my volume group for snapshot 
> use.
>
> What I don't understand is... why am I mounting and then backing up the 
> newly created snapshot volume, if it only contains the *changes* to the 
> volume I really want to backup - which in my case is /var/virtual?
>
> If the snapshot volume is only 5GB, how, by backing up *this* volume, am I 
> backing up over 100GB of data that is in a different volume?
[...]

When you create a snapshot, LVM2 does 4 things:

- it allocates a normal (linear) storage COW (copy-on-write)
  volume of the specified size which you don't normally access directly.
- creates a "snapshot" volume which is a virtual volume that
  allows you to access the frozen version of the snaphost
  volume.

(if it hasn't been done before):
- it dupplicates the original volume as xxxx-real
- it changes the original volume to a be "snapshot-origin" type
  which refers to the "real" volume and the "COW" volume.

When you read from the "snapshot" volume (the one you're backing
up), data that hasn't been modified since the snapshot is read
from the "real" volume and from the "COW" volume otherwise.

When you read from your original volume (that has been changed
to be of "snapshot-origin" type), you actually read from the
"real" volume (the original version of the original volume), but
when you write to it, the system makes sure that unless it has
been done already, the block you're modifying are being copied
first from the "real" volume to COW volume before being modified
in the "real" volume.

So to sum up, the "snapshot" volume you are creating is a
"virtual" volume that is a front end to both the snapshot
storage volume ("COW") and the original real volume ("real").

Hope this clarifies a bit,
Stephane
