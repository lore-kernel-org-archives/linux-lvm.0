Date: Tue, 10 Apr 2018 16:05:59 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
Message-ID: <20180410150559.GF2787@redhat.com>
References: <20180410084730.GA9920@redhat.com>
	<20180410140016.GB9920@redhat.com>
	<54d81d24-576e-17d4-8092-aa3d99eb69ff@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <54d81d24-576e-17d4-8092-aa3d99eb69ff@redhat.com>
Subject: Re: [linux-lvm] "Data alignment must not exceed device size."
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
Content-Transfer-Encoding: 7bit
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: linux-lvm@redhat.com


This turns out to be a bug in qemu 2.12-rc1.

It is fixed by this commit already upstream:

commit 37c51741892a89cf5710f5ac231091fb0a6352c7
Author: Fam Zheng <famz@redhat.com>
Date:   Wed Mar 28 00:41:41 2018 +0800

    scsi-disk: Don't enlarge min_io_size to max_io_size
    
    Some backends report big max_io_sectors. Making min_io_size the same
    value in this case will make it impossible for guest to align memory,
    therefore the disk may not be usable at all.
    
    Do not enlarge them when they are zero.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-df lists disk usage of guests without needing to install any
software inside the virtual machine.  Supports Linux and Windows.
http://people.redhat.com/~rjones/virt-df/
