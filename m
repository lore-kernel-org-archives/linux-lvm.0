Message-ID: <3BC04AD9.9080300@st-peter.stw.uni-erlangen.de>
Date: Sun, 07 Oct 2001 14:30:17 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] More Segfaults with LVM 1.0.1rc3
References: <20011004223343.A868@balu.kawo2.rwth-aachen.de> <20011005090810.B1245@sistina.com> <3BBD6084.70106@st-peter.stw.uni-erlangen.de> <20011005095737.A1460@sistina.com> <3BBD6C17.8090405@st-peter.stw.uni-erlangen.de>
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

>
> Heinz J . Mauelshagen wrote:
>
>> On Fri, Oct 05, 2001 at 09:25:56AM +0200, svetljo wrote:
>>
>>> is gcc-3.0.1 safe, or i should also use "-o0"
>>>
>>
>> Don't have a report for this :-(
>> Please try it.
>>
> it's seems to work
>
> xxscan xxdiplay lvcreate lvremove lvrename lvextend lvreduce work 
> without pb
> but i tried yesterday to install 2.4.11-pre2-xfs-cvs lvm-cvs
> and vgscan from the initrd segfaults , i can not boot to my LV's with it
> probbably it's some other trouble, i'll try with 2.4.11-pre3-xfs
> i think it's not relevant but all my VG's are over softRAIDs
>
it works with 2.4.11-pre4-xfs-cvs and lvm-cvs from today
i couldn't test vgcreate and vgremove .. ( because i have no spare PV's)
but the other tools work without complaining
