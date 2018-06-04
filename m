MIME-Version: 1.0
In-Reply-To: <CAANaKqdRgfcZvUZXUgwSX-WXaQ0K=yg6ubDGwRkMk8mU+bDpUw@mail.gmail.com>
References: <CAANaKqdnGfgxxHwQVA+L3uNDe5aMydssLius94wcp6LxA1-w+g@mail.gmail.com>
	<CAANaKqdPjq9sK=DvZjDDSm8Vd_28C1k2i2xLyTrkFzwVq69NZw@mail.gmail.com>
	<CAANaKqdRgfcZvUZXUgwSX-WXaQ0K=yg6ubDGwRkMk8mU+bDpUw@mail.gmail.com>
From: Patrick Mitchell <patricklmitchell9@gmail.com>
Date: Mon, 4 Jun 2018 02:54:21 -0400
Message-ID: <CA+2BD2dw6va+Wj9aKrv8JRbhF135b5M15Zu+4=VRb1W-FVUomw@mail.gmail.com>
Subject: Re: [linux-lvm] "write failed.. No space left", "Failed to write VG",
 and "Failed to write a MDA"
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
To: LVM general discussion and development <linux-lvm@redhat.com>, teigland@redhat.com, agk@redhat.com, ejt@redhat.com

On Sun, Jun 3, 2018 at 7:57 PM, Inbox <jimhaddad46@gmail.com> wrote:
...
> Ordinarily, I don't think this would be fatal.  If lvm works within
> the space it has, this just means not as many old copies of metadata
> will be kept.  But, the pvcreate bug left room for only 48,640 bytes
> of xml in mda1 vs 966,656 in mda1.  As my "lvm = {" xml is 20,624
> bytes, there's only room for 2 copies of the xml in mda1.
>
> It must be this combination of too small of an xml area in mda1, with
> a large "lvm = {" xml that doesn't allow LVM to work within such a
> confined space, and try to write past the end of the disk.
>
>
> The output way below below shows:
>
> * disk size is correct (pv_header.device_size 0x48aa3231e00 is
> 4993488985600, bytes reported by fdisk)
> * mda0 is located at 4096 bytes (pv_header.disk_areas.mda0.offset
> 0x1000 is 4096 bytes)
> * mda0 is size 1044480 bytes (pv_header.disk_areas.md0.size 0xff000)
> * mda1 is located at 4993488781312 bytes which is 204288 from last
> disk byte (pv_header.disk_areas.mda1.offset 0x48aa3200000)
> * mda1 is size 204288 bytes (pv_header.disk_areas.mda1.size 0x31e00)
> * the mda checksums are now different (0xf0662726 vs 0xb46ba552)
>
> So, it made mda1 to only be 19.5~% the size of mda0.
>
> mda0 has room for xml of 966656 bytes.  (starts at 0x14000, mda0 goes
> from 0x1000 for 0xff000 bytes, so to 0x100000 = EC000 available =
> 966656)
>
> md1 only has room for xml of 48640 bytes.  (starts at 0x48aa3226000,
> mda1 goes from 0x48aa3200000 for 0x31e00 bytes, so to 48AA3231E00 =
> BE00 available = 48640)
...

Correction here.

I thought the python script's addresses for metadata.value were at the
starting position for XML.  I was wrong about that.  I see now those
point to mda_header.start + mda.header_raw_locns0.offset.  locns[0]
I'm guessing must be for the most recent.

So, the XML area isn't shrunk down as badly like I was thinking.  mda1
is still smaller:

# pvck -t /dev/sdh3
  TEST MODE: Metadata will NOT be updated and volumes will not be (de)activated.
  Found label on /dev/sdh3, sector 1, type=LVM2 001
  Found text metadata area: offset=4096, size=1044480
  Found text metadata area: offset=4993488781312, size=204288

But, there is more room in mda1 than just 2 XML files.  It must have
just been the exact math on the mda1 size, the XML size, the rounding,
and the 2.02.177 algorithm, that made it try to write off the disk.
LVM isn't stuck trying to fit 2 XML's in the area.
