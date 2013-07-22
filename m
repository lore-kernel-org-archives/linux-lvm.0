Message-Id: <1374510573.9657.9223372036855715057.1974DA20@webmail.messagingengine.com>
From: darx@sent.com
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <51ED0243.3050003@redhat.com>
References: <1374438895.27222.9223372036855387565.0F08A743@webmail.messagingengine.com>
	<51ED0243.3050003@redhat.com>
Date: Mon, 22 Jul 2013 09:29:33 -0700
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
To: "Bryn M. Reeves" <bmr@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

Bryn,

On Mon, Jul 22, 2013, at 02:58 AM, Bryn M. Reeves wrote:
> I.e. your fdisk program moved the start of the partition. That'll pretty
> much break any file system that has fixed superblock locations.

I completely missed that, as I've never seen it happen before.  Thanks
for catching that.

I suspect my memory's of a procedure that used an older fdisk ... I'll
have to check exactly when the default/minimum became the 'modern' value
== 2048.

> Either use an fdisk that matches the defaults used when the partition
> was first created or ensure you are using sector display units (looks
> like you are - 2048 == 1MiB which is the default used by modern fdisks
> from util-linux) and carefully match the start location when
> deleting/re-adding.

Oddly, when I use 'my' fdisk to 1st create a new partition, it does
default to 2048 minimum sectors -- which, as you point out, is the value
used in my setup.

After the resizing, however, fdisk on the resized volume offers only a
minimum of 4096 sectors.  I.e., I'm unable to *match* the sector start
== 2048.

I've fixed the problem by cloning my source to a set of partitions that
start @4096.  Now, with fdisk on resize able to match the sector start,
my extended partition fsck's just find -- NO superblock issues.

I've no clue yet why fdisk changes its default from 2048->4096 before &
after the resizing.  But, for now I"m back in business.

Thanks for the help!

darx
