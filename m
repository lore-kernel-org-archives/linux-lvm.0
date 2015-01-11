Date: Sun, 11 Jan 2015 17:33:36 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20150111173336.GA19834@agk-dp.fab.redhat.com>
References: <2368A3FCF9F7214298E53C823B0A48EC042ECF3F@AMSPEX01CL02.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2368A3FCF9F7214298E53C823B0A48EC042ECF3F@AMSPEX01CL02.citrite.net>
Subject: Re: [linux-lvm] deleted LV recovery: understanding metadata
	format	and determining LV extents
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
To: Thanos Makatos <thanos.makatos@citrix.com>
Cc: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

On Sat, Jan 10, 2015 at 06:12:03PM +0000, Thanos Makatos wrote:
> Hi, I'm working on a case where a bunch of logical volumes were deleted but now we need them back. We have disabled archives and back ups in lvm.conf. They way I am trying to approach the problem is to examine LVM's metadata (the first MB of the block device) and determine whether the extents used by these logical volumes have been assigned to other logical volumes.
 
So start by looking at the contents of the metadata areas and see if they still
contain backups you can extract.
They are circular buffers so look for the seqno field which is incremented
each time the metadata is changed.

lvmdump -m can grab the metadata.
'pvck -v $device' contains the beginnings of code to extract the backups

Alasdair
