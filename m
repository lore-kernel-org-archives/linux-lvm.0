Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6KGPfdn022056
	for <linux-lvm@redhat.com>; Sun, 20 Jul 2008 12:25:41 -0400
Received: from fk-out-0910.google.com (fk-out-0910.google.com [209.85.128.190])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m6KGPUjj001830
	for <linux-lvm@redhat.com>; Sun, 20 Jul 2008 12:25:31 -0400
Received: by fk-out-0910.google.com with SMTP id e30so800574fke.3
	for <linux-lvm@redhat.com>; Sun, 20 Jul 2008 09:25:29 -0700 (PDT)
Message-ID: <bf6f43f40807200925p5bb2d9a2xc22a7ff323ced6ce@mail.gmail.com>
Date: Sun, 20 Jul 2008 13:25:28 -0300
From: "Levy Abinajm Melero Sant'Anna" <levy.santanna@gmail.com>
Sender: log.todos@gmail.com
Subject: Re: [linux-lvm] Re: Split LV mirror or something
In-Reply-To: <Pine.LNX.4.44.0807161020330.715-100000@bmsred.bmsi.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_41315_29215758.1216571129033"
References: <bf6f43f40807160121j27df33c5o5135e1fb9fdd16f1@mail.gmail.com>
	<Pine.LNX.4.44.0807161020330.715-100000@bmsred.bmsi.com>
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

------=_Part_41315_29215758.1216571129033
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Dear Stuart and list,

I was thinking about snapshot and copy, but it looks like "less
professional" than split a LV mirror.
I can explain: When I copy is difficult to say that I kept the same
permissions and ownership; Different of a mirror, that the process really
guarantee by itself that the data is still with the same characteristic.

Thank you all,
-- 
Lewis/Iceman/Levy

Google Talk! levy.santanna@gmail.com
ICQ 12913566
MSN levy.santanna@gmail.com
Meebo lewisgodus

On Wed, Jul 16, 2008 at 11:21 AM, Stuart D. Gathman <stuart@bmsi.com> wrote:

> On Wed, 16 Jul 2008, Levy Abinajm Melero Sant'Anna wrote:
>
> > > I have one LV with some critical data, and want to make a safe copy
> with
> > > less time possible of downtime. Could I make one mirror on a new PV
> > > (lvconvert -m1) and split this copy into a new LV or/and maybe split
> the VG
> > > into a new VG?
>
> Why not take a snapshot, and copy that to an LV on new VG ?
>
> --
>              Stuart D. Gathman <stuart@bmsi.com>
>

------=_Part_41315_29215758.1216571129033
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div dir="ltr">Dear Stuart and list,<br><br>I was thinking about snapshot and copy, but it looks like &quot;less professional&quot; than split a LV mirror.<br>I can explain: When I copy is difficult to say that I kept the same permissions and ownership; Different of a mirror, that the process really guarantee by itself that the data is still with the same characteristic.<br>
<br>Thank you all,<br>-- <br>Lewis/Iceman/Levy<br><br>Google Talk! <a href="mailto:levy.santanna@gmail.com">levy.santanna@gmail.com</a><br>ICQ 12913566<br>MSN <a href="mailto:levy.santanna@gmail.com">levy.santanna@gmail.com</a><br>
Meebo lewisgodus
<br><br><div class="gmail_quote">On Wed, Jul 16, 2008 at 11:21 AM, Stuart D. Gathman &lt;<a href="mailto:stuart@bmsi.com">stuart@bmsi.com</a>&gt; wrote:<br><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
<div class="Ih2E3d">On Wed, 16 Jul 2008, Levy Abinajm Melero Sant&#39;Anna wrote:<br>
<br>
&gt; &gt; I have one LV with some critical data, and want to make a safe copy with<br>
&gt; &gt; less time possible of downtime. Could I make one mirror on a new PV<br>
&gt; &gt; (lvconvert -m1) and split this copy into a new LV or/and maybe split the VG<br>
&gt; &gt; into a new VG?<br>
<br>
</div>Why not take a snapshot, and copy that to an LV on new VG ?<br>
<br>
--<br>
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Stuart D. Gathman &lt;<a href="mailto:stuart@bmsi.com">stuart@bmsi.com</a>&gt;<br>
 </blockquote></div><br></div>

------=_Part_41315_29215758.1216571129033--
