From: Peter <pk@q-leap.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <16228.26968.804811.803799@gargle.gargle.HOWL>
Subject: [linux-lvm] lvm and a dead disk
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
Date: Mon Sep 15 06:49:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello,

using lvm under Debian woody with packages 
lvm-common v1.5.5 and lvm10 v1.04-5 and linux 2.4.21 I once had a
volume group vg0 with three physical volumes:

/dev/scsi/host0/bus0/target5/lun0/part1
/dev/scsi/host0/bus0/target3/lun0/part1
/dev/scsi/host0/bus0/target4/lun0/part6

Unfortunately the first disk failed, but while Linux was still up I
could still access some of the files.  That obviously changed after I
rebooted the system as the first disk was hopelessly broken and vg0
could no longer be activated.

Now as there still are two pv's left and I can see the data on them
(only with grep or strings), I was wondering if there is any way to
activate the volume group in some sort of broken mode?  Just to access
the files that are still there as it was before the reboot?

I already tried to vgcfgrestore the data to a newly created pv
actually with success:

/dev/ide/host0/bus0/target0/lun0/part2
/dev/scsi/host0/bus0/target3/lun0/part1
/dev/scsi/host0/bus0/target4/lun0/part6

(replaced the SCSI disk with an IDE) but I don't seem to be able to do
any useful (like mounting) with it.  I understand that the filesystem
is missing a lot of data in order to start up.  I just thought I ask
here before I finally overwrite the remaining partitions.

Before you ask why I don't restore the data from the backup I have to
admit that the last backup is almost a year old, and please don't ask
why :/

Thanks a lot in advance,

    Peter

--
.signature: No such file or directory.
