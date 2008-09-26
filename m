Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8QHj2TL011587
	for <linux-lvm@redhat.com>; Fri, 26 Sep 2008 13:45:02 -0400
Received: from wr-out-0506.google.com (wr-out-0506.google.com [64.233.184.232])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m8QHihJi022601
	for <linux-lvm@redhat.com>; Fri, 26 Sep 2008 13:44:43 -0400
Received: by wr-out-0506.google.com with SMTP id c49so439781wra.19
	for <linux-lvm@redhat.com>; Fri, 26 Sep 2008 10:44:43 -0700 (PDT)
Message-ID: <db00b3d70809261037s3d01f436h71092ca658f8548@mail.gmail.com>
Date: Fri, 26 Sep 2008 19:37:05 +0200
From: "geert Geurts" <begeert@gmail.com>
Subject: Re: [linux-lvm] lvm over loop device
In-Reply-To: <48DCE54F.6060707@bmsi.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_4945_14022122.1222450625353"
References: <db00b3d70809260504j1754c205v9044f069c37e2c24@mail.gmail.com>
	<48DCE54F.6060707@bmsi.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

------=_Part_4945_14022122.1222450625353
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Ok, I'll try your snapshots idea.
Is it possible to mount such a snapshot like it's an image?


2008/9/26 Stuart D. Gathman <stuart@bmsi.com>

> geert Geurts wrote:
> > ps. for people interested, I'm trying to create a disk of allot of
> > small virtual disks so I can create a encrypted partition on for
> > instance gmailfs and minimalize up/download time on changes.
> > Pretty cool if it's possible no?
> I think a better solution might be to keep the encrypted fs on a single
> normal LV.  Take a snapshot and send to remote.  Keep the snapshot
> around.  On next upload, take a 2nd snapshot, and send the diff between
> the two snapshots.  The diff can be efficiently computed from the COW
> tables - accessible as dw-nn devices.  After sending the diff, delete
> the 1st snapshot and go back to "keep snapshot around".
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_4945_14022122.1222450625353
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div dir="ltr">Ok, I&#39;ll try your snapshots idea.<br>Is it possible to mount such a snapshot like it&#39;s an image?<br><br><br><div class="gmail_quote">2008/9/26 Stuart D. Gathman <span dir="ltr">&lt;<a href="mailto:stuart@bmsi.com">stuart@bmsi.com</a>&gt;</span><br>
<blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;"><div class="Ih2E3d">geert Geurts wrote:<br>
&gt; ps. for people interested, I&#39;m trying to create a disk of allot of<br>
&gt; small virtual disks so I can create a encrypted partition on for<br>
&gt; instance gmailfs and minimalize up/download time on changes.<br>
&gt; Pretty cool if it&#39;s possible no?<br>
</div>I think a better solution might be to keep the encrypted fs on a single<br>
normal LV. &nbsp;Take a snapshot and send to remote. &nbsp;Keep the snapshot<br>
around. &nbsp;On next upload, take a 2nd snapshot, and send the diff between<br>
the two snapshots. &nbsp;The diff can be efficiently computed from the COW<br>
tables - accessible as dw-nn devices. &nbsp;After sending the diff, delete<br>
the 1st snapshot and go back to &quot;keep snapshot around&quot;.<br>
<br>
<br>
<br>_______________________________________________<br>
linux-lvm mailing list<br>
<a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br></div>

------=_Part_4945_14022122.1222450625353--
