From: "Arie Bant@mail.com" <abant@mail.com>
Subject: Re: [linux-lvm] performance comparison soft-hardware RAID + LVM: bad
Message-ID: <014f01c27563$478fe560$28bf18ac@abant.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20021016085753.20974.47952.Mailman@hermes.sistina.com>
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
Date: Wed Oct 16 22:47:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: 'Jon Bendtsen' <jon+lvm@silicide.dk>


 -----Original Message-----
Date:	Wed, 16 Oct 2002 10:34:41 +0200
From:	Jon Bendtsen <jon+lvm@silicide.dk>
	Organization: Silicide A/S
To:	linux-lvm@sistina.com
Subject:	Re: [linux-lvm] performance comparison soft-hardware RAID + LVM:
bad
	Reply-To: linux-lvm@sistina.com

You dont have enough disks, 2 disks might be a widely used common setup, but
other people use more disks, like 4, 8, ... especialy when using scsi, which
for some reason doesnt seem to contain as much as IDE disks.
Jon,

Availability of large SCSI hard disks has nothing to do with it.
Using more spindles is better for performance as a general rule (more
spindles can lead to less head movement, if properly configured, head
movement/rotational delay counts for most of the access time on hard disks.
Also, via SCSI, seeks can be done simultaneously and in overlap with I/O on
other hard disks and/or processor activity), hence you will find that in
SCSI configurations more disks are used for performance reasons.
For this reason only, I keep a stack of, now old, 1/2/4 GB drives to use as
dedicated swap devices and /tmp file systems.
Given the intrinsic limitations, all this is not possible when using IDE, so
the capacity than has to come from large disks, the performance will suffer
accordingly, especially in total system throughput.  One of a number of
reasons why you should always go with SCSI when you want performance.

Regards,

Arie Bant.
