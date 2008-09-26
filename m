Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8QE3DAR001110
	for <linux-lvm@redhat.com>; Fri, 26 Sep 2008 10:03:14 -0400
Received: from rv-out-0506.google.com (rv-out-0506.google.com [209.85.198.231])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m8QE0fbR031478
	for <linux-lvm@redhat.com>; Fri, 26 Sep 2008 10:00:43 -0400
Received: by rv-out-0506.google.com with SMTP id f6so1010763rvb.51
	for <linux-lvm@redhat.com>; Fri, 26 Sep 2008 07:00:41 -0700 (PDT)
Message-ID: <1c748a490809260700w707f5315tc72949508742f17d@mail.gmail.com>
Date: Fri, 26 Sep 2008 07:00:40 -0700
From: "Larry Dickson" <ldickson@cuttedge.com>
Subject: Re: [linux-lvm] lvm over loop device
In-Reply-To: <48DCE54F.6060707@bmsi.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_16646_3246908.1222437640914"
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

------=_Part_16646_3246908.1222437640914
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

If I may come to Geert's defense, his approach is more transparent: the PVs
are accessible from user space and their content arrangement is clear by
looking up the maps. Using snapshots puts everything into kernel space and
deep into mystery land (unless there is some user space way of
hand-manipulating COWs by sector number). I'm on the dm-devel list and they
literally have dozens of patches a day... like raging ocean currents under
your little, simple ship.

Unfortunately, I can't answer Geert's practical questions. Anyone?

Larry Dickson
Cutting Edge Networked Storage

On 9/26/08, Stuart D. Gathman <stuart@bmsi.com> wrote:
>
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
>

------=_Part_16646_3246908.1222437640914
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>If I may come to Geert&#39;s defense, his approach is more transparent: the PVs are accessible from user space and their content arrangement&nbsp;is clear by looking up the maps. Using snapshots puts everything into kernel space and deep into mystery land&nbsp;(unless there is some user space way of hand-manipulating COWs by sector number). I&#39;m on the dm-devel list and they literally have dozens of patches a day... like raging ocean currents under your little, simple ship.</div>

<div>&nbsp;</div>
<div>Unfortunately, I can&#39;t answer Geert&#39;s practical questions. Anyone?</div>
<div>&nbsp;</div>
<div>Larry Dickson</div>
<div>Cutting Edge Networked Storage<br>&nbsp;</div>
<div><span class="gmail_quote">On 9/26/08, <b class="gmail_sendername">Stuart D. Gathman</b> &lt;<a href="mailto:stuart@bmsi.com">stuart@bmsi.com</a>&gt; wrote:</span>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">geert Geurts wrote:<br>&gt; ps. for people interested, I&#39;m trying to create a disk of allot of<br>&gt; small virtual disks so I can create a encrypted partition on for<br>
&gt; instance gmailfs and minimalize up/download time on changes.<br>&gt; Pretty cool if it&#39;s possible no?<br>I think a better solution might be to keep the encrypted fs on a single<br>normal LV.&nbsp;&nbsp;Take a snapshot and send to remote.&nbsp;&nbsp;Keep the snapshot<br>
around.&nbsp;&nbsp;On next upload, take a 2nd snapshot, and send the diff between<br>the two snapshots.&nbsp;&nbsp;The diff can be efficiently computed from the COW<br>tables - accessible as dw-nn devices.&nbsp;&nbsp;After sending the diff, delete<br>
the 1st snapshot and go back to &quot;keep snapshot around&quot;.<br><br><br><br>_______________________________________________<br>linux-lvm mailing list<br><a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
<br></blockquote></div><br>

------=_Part_16646_3246908.1222437640914--
