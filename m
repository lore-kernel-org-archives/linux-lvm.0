Message-ID: <3BBD6084.70106@st-peter.stw.uni-erlangen.de>
Date: Fri, 05 Oct 2001 09:25:56 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] More Segfaults with LVM 1.0.1rc3
References: <20011004223343.A868@balu.kawo2.rwth-aachen.de> <20011005090810.B1245@sistina.com>
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

is gcc-3.0.1 safe, or i should also use "-o0"


Heinz J . Mauelshagen wrote:

>Markus,
>
>go without optimization "-O0" rather than "-O2" in LVMs configure stript
>*or* with gcc 2.95.2.
>
>On Thu, Oct 04, 2001 at 10:33:43PM +0200, Markus Dobel wrote:
>
>>Hi,
>>
>>vgextend, vgreduce and lvextend segfaulted for me today, too. I'm using 
>>
>>  gcc version 2.96 20000731 (Red Hat Linux 7.1 2.96-95)
>>
>>which I guess is the reason for those problems.
>>
>>For vgextend/vgreduce gdb told me, that in vg_extend_reduce "vg_name"
>>pointed to 0x1. So i did a little debugging and therefore also
>>inserting the line:
>>
>>int vg_extend ( char *vg_name, pv_t *pv, vg_t *vg) {
>>   printf("VG Name is %s\n",vg_name ); // this one
>>   return vg_extend_reduce ( vg_name, pv, vg, VG_EXTEND);
>>}
>>
>>in vg_extend_reduce.c, the same in vg_reduce(). Without changing
>>anything else, vgextend and vgreduce work for me now.
>>
>>
>>Similar in lv_extend_reduce.c:
>>
>>int lv_extend ( vg_t *vg, lv_t *lv, char *lv_name) {
>>   printf("Extending %s\n", lv_name); // added this line.
>>   return lv_extend_reduce ( vg, lv, lv_name, LV_EXTEND);
>>}
>>
>>I don't speak C too fluently, and I don't know if printf() does some
>>implicit casting or something or if it's gcc 2.96, but maybe this
>>information helps a bit in finding the mistake.
>>
>>Regards, Markus
>>
>>-- 
>>Spiegel-Leser wissen mehr. Fuer ein Semester-Abo!
>>http://www.kawo2.rwth-aachen.de/~mdobel/semesterabo.html
>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@sistina.com
>>http://lists.sistina.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>>
>
