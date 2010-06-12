Message-ID: <4C135347.4030605@redhat.com>
Date: Sat, 12 Jun 2010 11:28:39 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
References: <4C126A55.6C149CB5@biochem.uthscsa.edu>
In-Reply-To: <4C126A55.6C149CB5@biochem.uthscsa.edu>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] unable to mount encrypted LVM volume
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: "Gary S. Trujillo" <vm@biochem.uthscsa.edu>

On 06/11/2010 06:57 PM, Gary S. Trujillo wrote:
...
> It appears that the installer touched something on the 500GB drive

Hi,

I just mention general principles here regarding the problem,
the mail so long that I lost in it, sorry:-)

From the log, you posted, it is not clear which layout was exactly
used. (sda6 is LUKS device and on top of that is LVM or vice versa?)

Anyway, recovering such layout (partitions/LVM/LUKS) is always
bottom-up approach - you have to be sure that underlying layer is ok
before moving upwards.

In principle, overwriting some part of device can corrupt various parts
of metadata needed to activate another level of such layout:

1) partition table
it can be easily recovered/recreated
you can even scan for FS/LVM PV/LUKS offsets or guess offset&check (see e.g. gpart)

2) for LVM metadata (PV header + metadata area describing Logical Volumes)
with metadata backup you can recover almost everything,
you can usually ever get text metadata from disk itself, even if some
part is partially overwritten
(it is not always easy, but usually possible)

3) LUKS & encryption (LUKS metadata area)

LUKS is basically only trivial key management implementation,
specific area of disk (keyslots, located at the start of encrypted block device)
contains obfuscated encrypted key, passphrase just unlocks this area.
(IOW passphrase in not enough to recover.)

You must have valid keyslot contents to get volume key to activate device,
and even one bit change in that area makes kesyslot unusable, loss of one sector
(here unexpected installer write) means losing the whole keyslot data
(without a chance to recovery, even using brute force)

Read http://code.google.com/p/cryptsetup/wiki/FrequentlyAskedQuestions#5._Backup_and_Data_Recovery

(Everyone should use backup of LUKS metadata as part of some backup plan,
read above, it is easy to use luksHeaderBackup with cryptsetup 1.1)


So the conclusion is: it depends if the problem is 1) or 2) you can probably solve it.
If you have corrupted LUKS area (3) and no backup of LUKS metadata, you probably lost the data
on the encrypted disk.

Milan
