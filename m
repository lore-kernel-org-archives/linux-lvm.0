Date: Wed, 11 Dec 2013 14:19:11 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20131211141911.GF4894@agk-dp.fab.redhat.com>
References: <CA+Q0qhddVT+JH9__r7cnONZmr7EE9mFnV8ax-e=ObyNc8hAong@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+Q0qhddVT+JH9__r7cnONZmr7EE9mFnV8ax-e=ObyNc8hAong@mail.gmail.com>
Subject: Re: [linux-lvm] How to place LVM2 metadata to other disks
	which	don't belong to any volume group?
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
Content-Type: text/plain; charset="utf-8"
To: George Brian <biangw@gmail.com>
Cc: linux-lvm@redhat.com

On Wed, Dec 11, 2013 at 03:06:13PM +0800, George Brian wrote:
> Instead of storing metadata on PV metadata areas, now I want to store it to
> other disks which don't belong to any volume group, just common disk.
 
This can indeed be done but because it is not a configuration that receives
much testing you should check the things you want to do work for you in
your particular circumstances.

LVM needs to use one 512-byte sector on the device to label it as a PV
and store its UUID.  By default the 2nd sector is used as this is normally
free.  Read about --labelsector in 'man pvcreate' and use --pvmetadatacopies 0.

Then read about the 'dirs' setting in the 'metadata' section in 'man lvm.conf':

        dirs  — List of directories holding live copies of LVM2 metadata
        as text files.  These directories must not be  on  logical  vol‐
        umes.   It  is possible to use LVM2 with a couple of directories
        here, preferably on different  (non-logical-volume)  filesystems
        and  with  no  other  on-disk  metadata,  pvmetadatacopies  = 0.
        Alternatively these directories can be in addition  to  the  on-
        disk metadata areas.  This feature was created during the devel‐
        opment of the LVM2 metadata  before  the  new  on-disk  metadata
        areas  were  designed and no longer gets tested.  It is not sup‐
        ported under low-memory conditions, and it is important never to
        edit these metadata files unless you fully understand how things
        work: to make changes you should always use the tools as normal,
        or else vgcfgbackup, edit backup, vgcfgrestore.

Alasdair
