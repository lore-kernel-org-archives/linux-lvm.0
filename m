References: <4b4d346e-9ace-9091-f24e-c9342ed68ad5@mglug.de>
From: Peter Rajnoha <prajnoha@redhat.com>
Message-ID: <c244050a-d5c7-1382-d115-77a1a4fc2959@redhat.com>
Date: Mon, 14 Aug 2017 08:59:22 +0200
MIME-Version: 1.0
In-Reply-To: <4b4d346e-9ace-9091-f24e-c9342ed68ad5@mglug.de>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] logical "and" connection of lvm-tags?
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
To: Oliver Rath <rath@mglug.de>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 08/13/2017 09:44 AM, Oliver Rath wrote:
> Hi list,
> 
> Im playing around with lvm-Tags and would find it quite useful for
> sorting lvms.
> 
> Now I tried the following
> 
> root@w541:~# lvchange --addtag @foo levg/t1
>   Logical volume levg/t1 changed.
> root@w541:~# lvchange --addtag @foo levg/t3
>   Logical volume levg/t3 changed.
> root@w541:~# lvchange --addtag @bar levg/t2
>   Logical volume levg/t2 changed.
> root@w541:~# lvchange --addtag @bar levg/t3
>   Logical volume levg/t3 changed.
> root@w541:~# lvs -o lv_name @foo
>   LV 
>   t1 
>   t3 
> root@w541:~# lvs -o lv_name @bar
>   LV 
>   t2 
>   t3 
> root@w541:~# lvs -o lv_name @foo @bar
>   LV 
>   t1 
>   t2 
>   t3 
> root@w541:~# lvs -o lv_name @foo \& @bar
>   LV 
>   t1 
>   t2 
>   t3 
> root@w541:~# lvs -o lv_name @foo and @bar
>   LV 
>   t1 
>   t2 
>   t3 
> 
> You see, i want to list all lvms which have @foo *and* @bar tags
> included. Is this possible? I didnt found anything about combining in
> the man pages.

Hi,

you can use -S|--select option:

  lvs -o lv_name -S 'tags=[foo,bar]'

See also "man 7 lvmreport" and the "Selection" section there for more
info, there also a help on how to use selection with string lists.

-- 
Peter
