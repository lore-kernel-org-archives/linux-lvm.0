From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] LVM on Raid 5 Performance?
Message-ID: <58750000.1053839527@[192.168.200.4]>
In-Reply-To: <200305182148.27901.jason@oes.co.th>
References: <92091C60D5E2B74CB77C1FDB84F5FA76F079@s99mail02.okdhs.org>
 <200305182148.27901.jason@oes.co.th>
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
Date: Sat May 24 19:11:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


-- "Jason H. Smith" <jason@oes.co.th>

> I don't know if this answers your question, but maybe search the archives
> for my posts a few months ago.  On 2.4, there's a misfeature when using
> LVM with RAID5.  Basically, the two will cause your system not to cache
> any data, and to sync to disk immediately, once you create a snapshot
> volume.  Apparently, this will be addressed in 2.6.
>
> So if you want RAID5 and LVM, consider hardware acceleration.

I'm having perfectly good luck with a DAC960 and 4 x IBM
160MB devices. The LVM issues pretty much drop out since
the drives are grouped into one "device" at the hardware
level. Striping the filesystem (ext2) helps (see the stride
option of mkfs.ext2), so does turning on write caching.



--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 888 359 3508
