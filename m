Message-ID: <461A6EAE.5040008@ce.jp.nec.com>
Date: Mon, 09 Apr 2007 12:49:50 -0400
From: "Jun'ichi Nomura" <j-nomura@ce.jp.nec.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] bug in lvs reporting -- version  2.02.07 Debian
References: <200704082223.42433.benscott@nwlink.com>
In-Reply-To: <200704082223.42433.benscott@nwlink.com>
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
To: benscott@nwlink.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

ben scott wrote:
> I have found a couple of times in testing that lvs will sometimes report the 
> same logical volume 2 or more times when output options are used. It seems to 
> happen with volumes that are a large percentage of the total group size. 
> Below I give an example. Notice how "lvs" with no options works fine but with 
> options doesn't.

lvs reports per-lv by default.
However, depending on the specified fields, it reports per-segments
as if '--segments' are given, for the fields are per-segment info.

# lvs
  LV    VG   Attr   LSize  Origin Snap%  Move Log Copy% 
  lvol4 mvg  -wi-a- 21.88G                

# lvs --segments
  LV    VG   Attr   #Str Type   SSize  
  lvol4 mvg  -wi-a-    1 linear  7.45G 
  lvol4 mvg  -wi-a-    1 linear  7.44G 
  lvol4 mvg  -wi-a-    1 linear  6.99G 

In this case, mvg/lvol4 consists of 3 segments.

# dmsetup table mvg-lvol4
0 15613952 linear 8:33 8576
15613952 15605760 linear 8:35 16768
31219712 14655488 linear 8:34 164224

With combination of LVM2 2.02.20 or newer and device-mapper 1.02.16
or newer, you can see which field belongs to which category by
'lvs -o help'.

Thanks,
-- 
Jun'ichi Nomura, NEC Corporation of America
