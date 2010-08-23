Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o7NG08Kc006239
	for <linux-lvm@redhat.com>; Mon, 23 Aug 2010 12:00:08 -0400
Received: from rd-fe01.sohu-rd.com (smtp.sohu-rd.com [202.106.180.43])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o7NFxvf0012527
	for <linux-lvm@redhat.com>; Mon, 23 Aug 2010 11:59:58 -0400
From: "Kirby Zhou" <kirbyzhou@sohu-rd.com>
References: <0ef301cb427a$1c5d9710$5518c530$@com> <4C727C5A.4010701@redhat.com>
In-Reply-To: <4C727C5A.4010701@redhat.com>
Date: Mon, 23 Aug 2010 23:59:53 +0800
Message-ID: <00a201cb42dc$39f3fa00$addbee00$@com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Language: zh-cn
Subject: Re: [linux-lvm] Is there any help for external locking of LVM?
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

Thanks, and could you please think about my second question.

> If I just put locking_dir on a NFS volume with locking_type=1, can I use
LVM
> to share a storage across machine?

I see that file_locking do not provide query_resource function, is it safe
for me to do pvmove with NFS based locking file? And what does
query_resource should do?



  Regards
  Kirby Zhou


-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On
Behalf Of Christine Caulfield
Sent: Monday, August 23, 2010 9:49 PM
To: linux-lvm@redhat.com
Subject: Re: [linux-lvm] Is there any help for external locking of LVM?

Hiya

There's no documentation on writing locking plugins but it's fairly 
straightforward, in principle at least ;-)

Have a look at LVM2/lib/locking/no_locking.c and add your custom locking 
parts in there. You DO need to call the lvm libraries parts or nothing 
will happen.

If your locking library is generally useful I hope you will share it 
with the community.

Chrissie


On 23/08/10 05:17, Kirby Zhou wrote:
> I am working for getting a alternative of built-in clustered locking.
> clvmd cannot support large size cluster well, and cannot across VLAN.
> In my opinion, a centralized locking mechanism is more suitable for
> large-scale cluster.
>
> If I just put locking_dir on a NFS volume with locking_type=1, can I use
LVM
> to share a storage across machine?
> Or is there any document can guide me to write a new locking plug-in?
>
> Regards,
>     Kirby Zhou
>     from   SOHU-RD   +86-10-6272-8261
>

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
