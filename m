Message-ID: <3B9A8880.4010507@st-peter.stw.uni-erlangen.de>
Date: Sat, 08 Sep 2001 23:07:12 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvcreate is segfaulting
References: <20010908204900.83459.qmail@web13908.mail.yahoo.com>
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

my mistake

have you tried
lvcreate -L6G -nnew -v test
and you did installed the tools and lib form the cvs tree

is there smth  in "demsg | ksymoops"

William Vadnais wrote:

>it was a typo on my part. The patch is installed
>correctly. I don't have a /proc/lvm/general, but here
>is /proc/lvm/global:
>
>[root@mp3gimp lvm]# ls /proc/lvm
>global  VGs
>[root@mp3gimp lvm]# cat /proc/lvm/global
>LVM driver LVM version CVS(CVS_DATE)
>
>Total:  1 VG  1 PV  0 LVs (0 LVs open)
>Global: 3167 bytes malloced   IOP version: 10  
>5:49:19 active
>
>VG:  test  [1 PV, 0 LV/0 open]  PE Size: 4096 KB
>  Usage [KB/PE]: 8949760 /2185 total  0 /0 used 
>8949760 /2185 free
>  PV:  [AA] sdb                    8949760 /2185      
>    0 /0        8949760 /2185
>    LVs: none
>[root@mp3gimp lvm]#
>
>
>--- svetljo <galia@st-peter.stw.uni-erlangen.de>
>wrote:
>
>>>
>>>dir then a cd /usr/src/linux and a patch < p1 using
>>>
>>that's a typo i couldn't be misstaken ?
>>
>>you could do
>>
>>.... ; cd PATCHES ;make ; cat lvm-CVS-2.4.9.patch |
>>patch -p1 -d 
>>/usr/src/linux
>>
>>and what tells  " cat /proc/lvm/general " , could
>>you attach it
>>
>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@sistina.com
>>http://lists.sistina.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at
>>
>http://www.sistina.com/lvm/Pages/howto.html
>
>
>__________________________________________________
>Do You Yahoo!?
>Get email alerts & NEW webcam video instant messaging with Yahoo! Messenger
>http://im.yahoo.com
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
