Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i23AAx822267
	for <linux-lvm@redhat.com>; Wed, 3 Mar 2004 05:10:59 -0500
Received: from mail.goldenhope.com.cn ([220.249.10.10])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i23AAwb02684
	for <linux-lvm@redhat.com>; Wed, 3 Mar 2004 05:10:58 -0500
Received: from lepton.goldenhope.com.cn (lepton.goldenhope.com.cn [192.168.1.138])
	by mail.goldenhope.com.cn (Postfix) with ESMTP id EAA04D28A
	for <linux-lvm@redhat.com>; Wed,  3 Mar 2004 18:10:40 +0800 (HKT)
From: lepton <lepton@mail.goldenhope.com.cn>
Message-ID: <20040303101044.GA16216@lepton.goldenhope.com.cn>
References: <20040302153451.GA13034@lepton.goldenhope.com.cn> <20040303075221.GA15698@lepton.goldenhope.com.cn>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20040303075221.GA15698@lepton.goldenhope.com.cn>
Subject: [linux-lvm] Re: Why can't I extend a LV after many times extends?
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Wed Mar  3 05:09:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Another problem after I change the buf size

1. After some lvextend operations.. when my lv size is about 48G

   my vg is lost suddently...

2. I think perhaps it has some relation about the default size
mempool size of "10*1024" is not big enough, I changed it to "200*1024"

      (lib/config/config.c line 88)

3. Now when I lvextend, it complains :

      VG amd64 metadata too large for circular buffer

      (lib/format_text/format_text.c line 363)

Any advice?

On Wed, Mar 03, 2004 at 03:52:21PM +0800, ���� wrote:
> Package: lvm2
> Version: 2.00.08-4
> 
> Ok , now I found the problem.
> 
> There is a limit in code of lvm2 tools.
> Author has seen it as a problem... but no one has fixed it yet.
> 
> 
> In lib/format_text/format-text.c ...
> 
> around line 309
> 
>   /* FIXME Essential fix! Make dynamic (realloc? pool?) */
>   char buf[65536];
>   int found = 0;
> 
> The buf size of 65536 is too small for me...
> 
> I change it to 655360 then everyting is ok.
> 
> The following is my quick patch, it can make things a little better.
> 
> 
> diff -urN lvm2-2.00.08/lib/format_text/format-text.c
> lvm2-2.00.08-new/lib/format_text/format-text.c
> --- lvm2-2.00.08/lib/format_text/format-text.c  2004-03-03
> 15:29:47.190121864 +0800
> +++ lvm2-2.00.08-new/lib/format_text/format-text.c      2004-03-03
> 15:15:18.720149368 +0800
> @@ -306,7 +306,7 @@
>         uint32_t new_wrap = 0, old_wrap = 0;
> 
>         /* FIXME Essential fix! Make dynamic (realloc? pool?) */
> -       char buf[65536];
> +       char buf[655360];
>         int found = 0;
> 
>         /* Ignore any mda on a PV outside the VG. vgsplit relies on this */
> 
> On Tue, Mar 02, 2004 at 11:34:51PM +0800, lepton wrote:
