Message-ID: <1063980768.3f6b0ee01a7f6@secure.st-peter.stw.uni-erlangen.de>
From: Svetoslav Slavtchev <galia@st-peter.stw.uni-erlangen.de>
Subject: Re: [linux-lvm] LVM with Mandrake 9.1
References: <009401c37df0$79525dd0$b1034ec0@PASKY>
In-Reply-To: <009401c37df0$79525dd0$b1034ec0@PASKY>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Date: Fri Sep 19 09:14:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Quoting ESPINEL Pascal <pespinel@appia.fr>:

> HI,
> 
> I want to install Mandrake Linux 9.1 on my disks ( 3 disk with RAID5 
> 16 Go ) with the LVM structure. I' am already very familiar using LVM with
> HP-Ux 
> but i can't find the way to create a vg and it's lv to attach my mount points
> in 
> the Mandrake installation procedure.
> 
> Thank's
>  
> Cordialement 

bug Pixel, the author of diskdrake, the partioning tool,
it won't let you to install with "/" on lvm

you need a normal /boot partition for raid, for lvm you must use "/" on 
normal partition( or supported raid) and ise the lv's for "/usr" and the other
stuff.

svetljo 
