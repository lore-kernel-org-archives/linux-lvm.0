Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m63FWI3Y005547
	for <linux-lvm@redhat.com>; Thu, 3 Jul 2008 11:32:18 -0400
Received: from fg-out-1718.google.com (fg-out-1718.google.com [72.14.220.153])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m63FW4tx027219
	for <linux-lvm@redhat.com>; Thu, 3 Jul 2008 11:32:04 -0400
Received: by fg-out-1718.google.com with SMTP id e21so432106fga.7
	for <linux-lvm@redhat.com>; Thu, 03 Jul 2008 08:32:03 -0700 (PDT)
Message-ID: <1c748a490807030832w2723fdedp9c647f60d92b4c61@mail.gmail.com>
Date: Thu, 3 Jul 2008 08:32:03 -0700
From: "Larry Dickson" <ldickson@cuttedge.com>
Subject: Re: [linux-lvm] Is it possible to stripe part of a LV?
In-Reply-To: <20080702202600.GH22522@agk.fab.redhat.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_7304_18567369.1215099123382"
References: <1c748a490807021318l6761d917r27489e2de71c87c0@mail.gmail.com>
	<20080702202600.GH22522@agk.fab.redhat.com>
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

------=_Part_7304_18567369.1215099123382
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Thank you, Alasdair. It worked like a charm: 8TB, and 832MB/s raw speed in
the striped part (two 8-disk 3ware cards with RAID5s).

Larry

On 7/2/08, Alasdair G Kergon <agk@redhat.com> wrote:
>
> lvcreate first part
> lvextend -i to add next part
>
> Alasdair
> --
> agk@redhat.com
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_7304_18567369.1215099123382
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>Thank you, Alasdair. It worked like a charm: 8TB, and 832MB/s raw speed in the striped part (two 8-disk 3ware cards with RAID5s).</div>
<div>&nbsp;</div>
<div>Larry<br>&nbsp;</div>
<div><span class="gmail_quote">On 7/2/08, <b class="gmail_sendername">Alasdair G Kergon</b> &lt;<a href="mailto:agk@redhat.com">agk@redhat.com</a>&gt; wrote:</span>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">lvcreate first part<br>lvextend -i to add next part<br><br>Alasdair<br>--<br><a href="mailto:agk@redhat.com">agk@redhat.com</a><br>
<br>_______________________________________________<br>linux-lvm mailing list<br><a href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br><a href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br>

------=_Part_7304_18567369.1215099123382--
