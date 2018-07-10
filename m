Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E94A5C20D
	for <linux-lvm@redhat.com>; Tue, 10 Jul 2018 07:55:24 +0000 (UTC)
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7121D308FBA0
	for <linux-lvm@redhat.com>; Tue, 10 Jul 2018 07:55:13 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id c6-v6so40938911oiy.0
	for <linux-lvm@redhat.com>; Tue, 10 Jul 2018 00:55:13 -0700 (PDT)
MIME-Version: 1.0
References: <d2fad779-7d58-85e8-87f9-bd9ba657ec05@mglug.de>
In-Reply-To: <d2fad779-7d58-85e8-87f9-bd9ba657ec05@mglug.de>
From: Damon Wang <damon.devops@gmail.com>
Date: Tue, 10 Jul 2018 15:55:00 +0800
Message-ID: <CABZYMH5S=QMu5Ekr6+cEyPzVY7+pQSOXCyxyC72YX5bdgBRz2g@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Error on RegEx with lv_tags-fields
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

I have meet same problem, now I use grep :-D

Damon


Oliver Rath <rath@mglug.de> 于2018年7月9日周一 下午8:33写道：
>
> Hi list,
>
> Im trying to sort some output with lvs using a regex "=~", which results
> in an error:
>
> # lvs -o lv_name,lv_tags -S 'lv_tags=~mac1'
>   dm_report: incompatible comparison type for selection field lv_tags
>
> Otherwise, using the =~ operator on lv_names works well:
>
> # lvs -o lv_name -S 'lv_name=~z'
>   LV
>   z1
>   z2
>   z3
>
> If I see right, I can use the selection type "string list" here, but no
> regex. Is this right? Is there a way to use regex on tags? Im looking
> for a way doing
>
>   "show me all lv's with tags beginning with "abc.."
>
> TfH!
>
> Oliver
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
