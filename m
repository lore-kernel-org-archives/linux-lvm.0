Message-ID: <20010908204900.83459.qmail@web13908.mail.yahoo.com>
Date: Sat, 8 Sep 2001 13:49:00 -0700 (PDT)
From: William Vadnais <giordanobruno@yahoo.com>
Subject: Re: [linux-lvm] lvcreate is segfaulting
In-Reply-To: <3B9A80DF.5040600@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

it was a typo on my part. The patch is installed
correctly. I don't have a /proc/lvm/general, but here
is /proc/lvm/global:

[root@mp3gimp lvm]# ls /proc/lvm
global  VGs
[root@mp3gimp lvm]# cat /proc/lvm/global
LVM driver LVM version CVS(CVS_DATE)

Total:  1 VG  1 PV  0 LVs (0 LVs open)
Global: 3167 bytes malloced   IOP version: 10  
5:49:19 active

VG:  test  [1 PV, 0 LV/0 open]  PE Size: 4096 KB
  Usage [KB/PE]: 8949760 /2185 total  0 /0 used 
8949760 /2185 free
  PV:  [AA] sdb                    8949760 /2185      
    0 /0        8949760 /2185
    LVs: none
[root@mp3gimp lvm]#


--- svetljo <galia@st-peter.stw.uni-erlangen.de>
wrote:
> >
> >
> >dir then a cd /usr/src/linux and a patch < p1 using
> >
> that's a typo i couldn't be misstaken ?
> 
> you could do
> 
> .... ; cd PATCHES ;make ; cat lvm-CVS-2.4.9.patch |
> patch -p1 -d 
> /usr/src/linux
> 
> and what tells  " cat /proc/lvm/general " , could
> you attach it
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at
http://www.sistina.com/lvm/Pages/howto.html


__________________________________________________
Do You Yahoo!?
Get email alerts & NEW webcam video instant messaging with Yahoo! Messenger
http://im.yahoo.com
