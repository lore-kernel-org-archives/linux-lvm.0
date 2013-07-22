Message-ID: <51ED0243.3050003@redhat.com>
Date: Mon, 22 Jul 2013 10:58:27 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <1374438895.27222.9223372036855387565.0F08A743@webmail.messagingengine.com>
In-Reply-To: <1374438895.27222.9223372036855387565.0F08A743@webmail.messagingengine.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] resize of LV causing superblock corruption ( Bad
 magic number ). how to prevent/fix?
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
Cc: darx@sent.com

This is an fdisk rather than LVM2 problem.

Compare:

On 07/21/2013 09:34 PM, darx@sent.com wrote:
> 	fdisk -l /dev/VGTEST/test_root | grep Linux
> 		/dev/VGTEST/test_root1            2048     8388607    
                                                  ^^^^
> 		4193280   83  Linux

vs.:


> 	fdisk -l /dev/VGTEST/test_root | grep Linux
> 		/dev/VGTEST/test_root1              32    25165823   
                                                    ^^
> 		12582896   83  Linux

I.e. your fdisk program moved the start of the partition. That'll pretty
much break any file system that has fixed superblock locations.

Either use an fdisk that matches the defaults used when the partition
was first created or ensure you are using sector display units (looks
like you are - 2048 == 1MiB which is the default used by modern fdisks
from util-linux) and carefully match the start location when
deleting/re-adding.

Btw this is fixable as long as you can still find the correct starting
sector.

Regards,
Bryn.
