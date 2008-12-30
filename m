Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mBUIamRA014488
	for <linux-lvm@redhat.com>; Tue, 30 Dec 2008 13:36:54 -0500
Received: from mu-out-0910.google.com (mu-out-0910.google.com [209.85.134.187])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mBUIER3m015958
	for <linux-lvm@redhat.com>; Tue, 30 Dec 2008 13:15:22 -0500
Received: by mu-out-0910.google.com with SMTP id g7so2130902muf.1
	for <linux-lvm@redhat.com>; Tue, 30 Dec 2008 10:14:26 -0800 (PST)
Message-ID: <8c87cb5a0812301014w6b3f92c9p33e1a6d2699edb4d@mail.gmail.com>
Date: Tue, 30 Dec 2008 13:14:26 -0500
From: "Doug Eubanks" <admin@dougware.net>
In-Reply-To: <8c87cb5a0812291854w2b56cb6cr3a14932442cfa80e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_133309_16792961.1230660866581"
References: <8c87cb5a0812291854w2b56cb6cr3a14932442cfa80e@mail.gmail.com>
Subject: [linux-lvm] Re: Convert a non-striped LV to a striped LV without
	data loss?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

------=_Part_133309_16792961.1230660866581
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I've been giving this a lot of thought, and I still can't find any
documented way to do this.

Would it be possible to extend the linear lv onto a striped lv area, move
the data to the new extents and then remove the old lv area using lvreduce
perhaps?

Sincerely,
Doug Eubanks
admin@dougware.net


On Mon, Dec 29, 2008 at 9:54 PM, Doug Eubanks <admin@dougware.net> wrote:

> Is it possible to convert a logical volume that's only on one physical
> volume to a striped logical volume without data loss, and preferably online?
>
> Thanks
> Doug Eubanks
> admin@dougware.net
>

------=_Part_133309_16792961.1230660866581
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I&#39;ve been giving this a lot of thought, and I still can&#39;t find any documented way to do this.<br><br>Would it be possible to extend the linear lv onto a striped lv area, move the data to the new extents and then remove the old lv area using lvreduce perhaps?<br>
<br clear="all">Sincerely,<br>Doug Eubanks<br><a href="mailto:admin@dougware.net">admin@dougware.net</a><br>
<br><br><div class="gmail_quote">On Mon, Dec 29, 2008 at 9:54 PM, Doug Eubanks <span dir="ltr">&lt;<a href="mailto:admin@dougware.net">admin@dougware.net</a>&gt;</span> wrote:<br><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
Is it possible to convert a logical volume that&#39;s only on one physical volume to a striped logical volume without data loss, and preferably online?<br><br>Thanks<br clear="all"><font color="#888888">Doug Eubanks<br><a href="mailto:admin@dougware.net" target="_blank">admin@dougware.net</a><br>


</font></blockquote></div><br>

------=_Part_133309_16792961.1230660866581--
