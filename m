From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: Re: [linux-lvm] How to best use LVM?
Message-ID: <407900000.1029507090@[192.168.200.4]>
In-Reply-To: <Pine.LNX.4.43.0208160835550.7662-100000@beo>
References: <Pine.LNX.4.43.0208160835550.7662-100000@beo>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Fri Aug 16 09:08:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


> "For "reliability of data" I was thinking of using either ext3 or
> reiserfs across a RAID set."
>
> I have had some bad experience with ReiserFS but it was probably caused
> by a low kernel version (2.4.16). Otherwise ReiserFS rocks when it comes
> to resizing filesystems etc.
> I would go with ext3 if I were you, I migrated to ext3 because of my
> problems (kernel crash).
> Don't use ReiserFS with kernels below version (and including) 2.4.16
>
> I would have tested ReiserFS if I had the chance on a newer kernel but I
> was not able (for several reasons) to upgrade to 2.4.18 or 2.4.19

Watching the ext3 mailing list, and with my own experiments,
it seems to have problems under really high loads. ext2 is a
neat idea but is probably less reliable than ext2 at this
point. If you're bothering to go with RAID for the underlying
hardware then the only system, ext2 is the only file system
equally reliable as the hardware right now.

--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
