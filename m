Message-ID: <4E49035A.9090202@redhat.com>
Date: Mon, 15 Aug 2011 13:30:34 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <4E48E81C.9040504@tlinx.org>
In-Reply-To: <4E48E81C.9040504@tlinx.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] dmsetup -split is buggy
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
Cc: "Linda A. Walsh" <lvm@tlinx.org>

On 08/15/2011 11:34 AM +0100, Linda A. Walsh wrote:
> dmsetup splitname, should, I believe, know how to split
> names in the only 'supported' name format  i.e. /dev/VG/LV -- but
> instead, it's treating it as though it were under /dev/mapper and using that for
> decoding...

dmsetup splitname accepts a device-mapper name as an argument,
/dev/VG/LV is a "logical volume path" and is not supposed to be
decoded this way...

Peter
