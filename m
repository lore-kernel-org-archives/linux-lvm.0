Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id o96GHZEU028303
	for <linux-lvm@redhat.com>; Wed, 6 Oct 2010 12:17:35 -0400
Received: from web120712.mail.ne1.yahoo.com (web120712.mail.ne1.yahoo.com
	[98.138.82.219])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id o96GHNvm007799
	for <linux-lvm@redhat.com>; Wed, 6 Oct 2010 12:17:23 -0400
Message-ID: <11404.7696.qm@web120712.mail.ne1.yahoo.com>
References: <87363.97197.qm@web120701.mail.ne1.yahoo.com>
	<87y6adm5hs.fsf@twilight.int.mornfall.net.>
Date: Wed, 6 Oct 2010 08:50:41 -0700 (PDT)
From: Jay <jrharris19@yahoo.com>
In-Reply-To: <87y6adm5hs.fsf@twilight.int.mornfall.net.>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-399052783-1286380241=:7696"
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--0-399052783-1286380241=:7696
Content-Type: text/plain; charset=us-ascii

Hi Petr,

Thanks for the reply.  "Should continue to work.." leaves me with some doubt. 
 My intent for a mirror is for a datastore that has reliability at the expense 
of space.   In addition, when a large datastore is rebooted, there would be a 
period of time when the data is being mirrored, which leaves a window of 
peril. After I migrate my data off of lvm and onto an md device, I will test 
lvm. 

Test #1 will be start a huge write operation on a mirror that consists of 2 
mirrors and 1 log, all on seperate pvs.   While the write operation is 
happening, I will unplug the log drive and see if lvm switches in midstream to a 
memory log without loss.    

Test #2 will be to see if I can make lvm activate lvs or vgs in a certain order. 
  That way I could make the first 20 extents of every physical device part of a 
vg/lv that houses mirror logs.   These log lvs would be mirrored across all 
physical devices.   The log lvs would have memory logs, which would be ok since 
they will be so small.     The window of peril is reduced from hours to a few 
seconds. 

Anyways, thanks again for the answer!

Jason Harris



________________________________
From: Petr Rockai <prockai@redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Sent: Tue, October 5, 2010 1:02:55 AM
Subject: Re: [linux-lvm] LVM mirror questions

Jay <jrharris19@yahoo.com> writes:
> What happens to an lvm mirror if the disk log is lost?

The mirror should continue to work with a core (memory) log.

Yours,
   Petr.

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/



      
--0-399052783-1286380241=:7696
Content-Type: text/html; charset=us-ascii

<html><head><style type="text/css"><!-- DIV {margin:0px;} --></style></head><body><div style="font-family:'times new roman', 'new york', times, serif;font-size:12pt"><div>Hi Petr,</div><div><br></div><div>Thanks for the reply. &nbsp;"Should continue to work.." leaves me with some doubt. &nbsp;My intent for a mirror is for a datastore that has reliability at the expense of space. &nbsp; In addition, when a large datastore is rebooted, there would be a period of time when the data is being mirrored, which leaves a window of peril.&nbsp;After I migrate my data off of lvm and onto an md device, I will test lvm.&nbsp;</div><meta http-equiv="Content-Type" content="text/html;charset=UTF-8"><div><br></div><div>Test #1 will be start a huge write operation on a mirror that consists of 2 mirrors and 1 log, all on seperate pvs. &nbsp; While the write operation is happening, I will unplug the log drive and see if lvm switches in midstream to a memory log without
 loss. &nbsp; &nbsp;</div><div><br></div><div>Test #2 will be to see if I can make lvm activate lvs or vgs in a certain order. &nbsp; That way I could make the first 20 extents of every physical device part of a vg/lv that houses mirror logs. &nbsp; These log lvs would be mirrored across all physical devices. &nbsp; The log lvs would have memory logs, which would be ok since they will be so small. &nbsp; &nbsp; The window of peril is reduced from hours to a few seconds.&nbsp;</div><div><br></div><div>Anyways, thanks again for the answer!</div><div><br></div><div>Jason Harris</div><div style="font-family:times new roman, new york, times, serif;font-size:12pt"><br><div style="font-family:arial, helvetica, sans-serif;font-size:13px"><font size="2" face="Tahoma"><hr size="1"><b><span style="font-weight: bold;">From:</span></b> Petr Rockai &lt;prockai@redhat.com&gt;<br><b><span style="font-weight: bold;">To:</span></b> LVM general discussion and development
 &lt;linux-lvm@redhat.com&gt;<br><b><span style="font-weight: bold;">Sent:</span></b> Tue, October 5, 2010 1:02:55 AM<br><b><span style="font-weight: bold;">Subject:</span></b> Re: [linux-lvm] LVM mirror questions<br></font><br>
Jay &lt;<a ymailto="mailto:jrharris19@yahoo.com" href="mailto:jrharris19@yahoo.com">jrharris19@yahoo.com</a>&gt; writes:<br>&gt; What happens to an lvm mirror if the disk log is lost?<br><br>The mirror should continue to work with a core (memory) log.<br><br>Yours,<br>&nbsp;  Petr.<br><br>_______________________________________________<br>linux-lvm mailing list<br><a ymailto="mailto:linux-lvm@redhat.com" href="mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br><a href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br><span>read the LVM HOW-TO at <a target="_blank" href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a></span><br></div></div><div style="position:fixed"></div>


</div><br>

      </body></html>
--0-399052783-1286380241=:7696--
