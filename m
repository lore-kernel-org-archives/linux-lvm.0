Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o96Fr8E1020306
	for <linux-lvm@redhat.com>; Wed, 6 Oct 2010 11:53:08 -0400
Received: from web120714.mail.ne1.yahoo.com (web120714.mail.ne1.yahoo.com
	[98.138.82.221])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id o96Fqrsw011242
	for <linux-lvm@redhat.com>; Wed, 6 Oct 2010 11:52:53 -0400
Message-ID: <86106.13599.qm@web120714.mail.ne1.yahoo.com>
References: <87363.97197.qm@web120701.mail.ne1.yahoo.com>
	<4CAB46FE.9050309@cfl.rr.com>
Date: Wed, 6 Oct 2010 08:26:10 -0700 (PDT)
From: Jay <jrharris19@yahoo.com>
In-Reply-To: <4CAB46FE.9050309@cfl.rr.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-508540680-1286378770=:13599"
Subject: Re: [linux-lvm] LVM mirror questions
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
To: Phillip Susi <psusi@cfl.rr.com>, LVM general discussion and development <linux-lvm@redhat.com>

--0-508540680-1286378770=:13599
Content-Type: text/plain; charset=us-ascii

Phillip, 

Thank you for your answer and advice.  How unfortunate about lvm mirroring being 
broken.  I like your suggestion about how it SHOULD work.   In fact, long ago in 
a different age when I was working with rs6000s, I believe that is how reliable 
mirroring was accomplished with the ibm lvm.  Either that or it was that the 
metadata/log block was stored on multiple disks with a quorum needed to be 
functional.

I will convert to md mirror device.    If I had more skill, I would contribute 
somehow to the development effort.    As it is, I will lurk on the list to see I 
can be helpful to someone else.    Again, I appreciate your help.

Regards,
Jason Harris

 



________________________________
From: Phillip Susi <psusi@cfl.rr.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Jay <jrharris19@yahoo.com>
Sent: Tue, October 5, 2010 8:40:46 AM
Subject: Re: [linux-lvm] LVM mirror questions

On 10/4/2010 7:55 PM, Jay wrote:
> the other disk and lvcovert.    But it wouldn't work, saying I needed to
> add space on yet a third device for the log.   Either that, or I could
> keep the mirror log in memory.  Lvm would have to rebuild a 1TB mirror
> every time the system was rebooted if the log was left in memory.   That
> doesn't sound efficient.   So.   Put the log on disk.   I couldn't find
> an answer in man pages, but if the log is lost, then is the whole mirror
> lost ?   That would mean to have the benefits of a mirror, the log would
> have to be at least as reliable as the mirror itself (or
> inconsequential).  
> 
> So, another mirror would have to be built of tiny size to hold the log,
> then lvconvert can be given something like -log disk /dev/vghuh/lvtiny,
> etc..

As you have noticed, LVM mirror support is basically broken or not fully
implemented yet.  The mirror log SHOULD be stored on both legs of the
mirror in a block allocated automatically in the metadata area by lvm,
but isn't.  If you want to mirror, you should do so using mdadm and then
use the md device as an lvm pv.



      
--0-508540680-1286378770=:13599
Content-Type: text/html; charset=us-ascii

<html><head><style type="text/css"><!-- DIV {margin:0px;} --></style></head><body><div style="font-family:'times new roman', 'new york', times, serif;font-size:12pt"><div>Phillip,&nbsp;</div><div><br></div><div>Thank you for your answer and advice. &nbsp;How unfortunate about lvm mirroring being broken. &nbsp;I like your suggestion about how it SHOULD work. &nbsp; In fact, long ago in a different age when I was working with rs6000s, I believe that is how reliable mirroring was accomplished with the ibm lvm. &nbsp;Either that or it was that the metadata/log block was stored on multiple disks with a quorum needed to be functional.</div><div><br></div><div>I will convert to md mirror device. &nbsp; &nbsp;If I had more skill, I would contribute somehow to the development effort. &nbsp; &nbsp;As it is, I will lurk on the list to see I can be helpful to someone else. &nbsp; &nbsp;Again, I appreciate your help.</div><div><br></div><div>Regards,</div><div>Jason
 Harris</div><div><br></div><div>&nbsp;</div><div style="font-family:times new roman, new york, times, serif;font-size:12pt"><br><div style="font-family:arial, helvetica, sans-serif;font-size:13px"><font size="2" face="Tahoma"><hr size="1"><b><span style="font-weight: bold;">From:</span></b> Phillip Susi &lt;psusi@cfl.rr.com&gt;<br><b><span style="font-weight: bold;">To:</span></b> LVM general discussion and development &lt;linux-lvm@redhat.com&gt;<br><b><span style="font-weight: bold;">Cc:</span></b> Jay &lt;jrharris19@yahoo.com&gt;<br><b><span style="font-weight: bold;">Sent:</span></b> Tue, October 5, 2010 8:40:46 AM<br><b><span style="font-weight: bold;">Subject:</span></b> Re: [linux-lvm] LVM mirror questions<br></font><br>
On 10/4/2010 7:55 PM, Jay wrote:<br>&gt; the other disk and lvcovert.&nbsp; &nbsp; But it wouldn't work, saying I needed to<br>&gt; add space on yet a third device for the log.&nbsp;  Either that, or I could<br>&gt; keep the mirror log in memory.&nbsp; Lvm would have to rebuild a 1TB mirror<br>&gt; every time the system was rebooted if the log was left in memory.&nbsp;  That<br>&gt; doesn't sound efficient.&nbsp;  So.&nbsp;  Put the log on disk.&nbsp;  I couldn't find<br>&gt; an answer in man pages, but if the log is lost, then is the whole mirror<br>&gt; lost ?&nbsp;  That would mean to have the benefits of a mirror, the log would<br>&gt; have to be at least as reliable as the mirror itself (or<br>&gt; inconsequential).&nbsp;  <br>&gt; <br>&gt; So, another mirror would have to be built of tiny size to hold the log,<br>&gt; then lvconvert can be given something like -log disk /dev/vghuh/lvtiny,<br>&gt; etc..<br><br>As you have noticed, LVM mirror support
 is basically broken or not fully<br>implemented yet.&nbsp; The mirror log SHOULD be stored on both legs of the<br>mirror in a block allocated automatically in the metadata area by lvm,<br>but isn't.&nbsp; If you want to mirror, you should do so using mdadm and then<br>use the md device as an lvm pv.<br></div></div><div style="position:fixed"></div>


</div><br>

      </body></html>
--0-508540680-1286378770=:13599--
