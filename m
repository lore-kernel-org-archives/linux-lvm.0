Message-ID: <3BA5C08D.3090103@st-peter.stw.uni-erlangen.de>
Date: Mon, 17 Sep 2001 11:21:17 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: [linux-lvm] Re: [linux-lvm] 
	=?ISO-8859-1?Q?Verst=E4ndnis?= von Stripes bei LVM
References: <4C45858D148AD411A8B800A024B36E5009F4C994@granada.fhm.de> <20010914121333.A11814@dragon.blacknet.de> <20010914095230.S1541@turbolinux.com> <20010917105426.A16318@dragon.blacknet.de>
Content-Transfer-Encoding: 7bit
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

well you could do it with soft RAID-5 too i think
you save some money from the hardware RAID ,
you lose a bit performance -- soft RAID overhead
the hard RAID has RAM and CPU( or smth of the kind ) -- no CPU or mem 
overhead
but if you have a mothern CPU and a bit more RAM there is no problem
redundancy - the same
 

Goetz Bock wrote:

>>[ ... ] There are several problems with stipes:
>>
>>- if you have problems with ANY disk, you have lost ALL of your data
>>
>If any disk of my VG dies I'm in trouble. With the help of the LVM guis
>I might be able to "fake" the broken disk BUT for most people a broken
>disk means loos of all data in the WHOLE VG.
>
>... that's why I use LVM over RAID5 (hardware).
>
