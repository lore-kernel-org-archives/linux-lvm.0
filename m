Received: from [10.34.32.13] (mazyland.brq.redhat.com [10.34.32.13])
	by pobox.stuttgart.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l2Q95fbf031271
	for <linux-lvm@redhat.com>; Mon, 26 Mar 2007 11:05:41 +0200
Message-ID: <46078CE5.5050001@redhat.com>
Date: Mon, 26 Mar 2007 11:05:41 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vg attributes (vg_attr) in vgs program don't seem
	to	match the man page
References: <200703251711.05482.benscott@nwlink.com>
In-Reply-To: <200703251711.05482.benscott@nwlink.com>
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


ben scott wrote:
> The explanation of the attribute bits printed by the program "vgs" in the man 
> page are as follows:
> 
> The vg_attr bits are:  (w)riteable, (r)ead only, resi(z)eable, e(x)ported, 
> (p)artial and (c)lustered.
> 
> However "vgs" on my debian Etch system prints out this way:
...

See lib/report/report.c in sources for exact description,

Short overview
(note that some attributes are used for hidden volumes only which are parts
of snapshot, mirror, etc...)

PV attributes
a-
|`- exported (vg) [x|-]
`-- allocatable [a|-]

VG attributes

wz--n-
|||||`- clustered [c|-]
||||`-- allocation policy (c)ontiguous,(C)ling,(n)ormal,(a)nywhere,(i)nherit
|||`--- partial vg [p|-]
||`---- exported vg [x|-]
|`----- resizeable vg [z|-]
`------ writable [w|r]

LV attributes

-wi-a-
|||||`- open [o|-]
||||`-- (s)uspended,(a)ctive,(i)nactive((d)without mapping table),
||||    (I)nvalid snapshot, invalid (S)uspended snapshot [s|a|i|d|S|I]
|||`--- fixed minor [m|-]
||`---- allocation policy (if locked ->capitalized) [c|C|n|a|i]
|`----- writable (in pvmove '-') [w|r|-]
`------ type: (p)vmoved, (m)irrored ((M) not synced), mirror (i)mage,(l)og,
                (v)irtual, snapshot (o)rigin/(s)cow [p|m|M|i|l|v|o|s|-]


Milan
--
mbroz@redhat.com
