Message-ID: <46C09EA6.9060701@ce.jp.nec.com>
Date: Mon, 13 Aug 2007 14:10:46 -0400
From: "Jun'ichi Nomura" <j-nomura@ce.jp.nec.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Some questions on "Mirrors cannot be resized while
	active yet"
References: <1187015794.2799.11.camel@localhost>
	<330CCC1A-5400-472C-8DCE-59CCE61E739C@redhat.com>
In-Reply-To: <330CCC1A-5400-472C-8DCE-59CCE61E739C@redhat.com>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Jonathan Brassow wrote:
> I don't remember all the reasons, but I *think* two of them were:
> 1) 186304 - potential to spoil redundancy
> 2) cluster mirroring needed ability to hold to identical logs for a
> short period

Maybe not a reason why it's disabled, but I think kernel code
needs to change to allow LVM mirror resizing.

LVM2 uses 'noflush' option for suspending mirror maps.

OTOH, currently you need full (flushing) suspend to resize device.
http://lkml.org/lkml/2007/1/19/136

Thanks,
-- 
Jun'ichi Nomura, NEC Corporation of America
