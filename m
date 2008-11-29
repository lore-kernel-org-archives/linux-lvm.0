Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mAT3LvU1020645
	for <linux-lvm@redhat.com>; Fri, 28 Nov 2008 22:21:57 -0500
Received: from ug-out-1314.google.com (ug-out-1314.google.com [66.249.92.173])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mAT3KqYY015508
	for <linux-lvm@redhat.com>; Fri, 28 Nov 2008 22:20:53 -0500
Received: by ug-out-1314.google.com with SMTP id j30so2133826ugc.13
	for <linux-lvm@redhat.com>; Fri, 28 Nov 2008 19:20:52 -0800 (PST)
Message-ID: <614f37be0811281920nd3cef6bg7728dfd31d023a91@mail.gmail.com>
Date: Fri, 28 Nov 2008 22:20:52 -0500
From: "Gary Desrochers" <garybrenda@comcast.net>
Sender: garyfdes@gmail.com
Subject: Re: [linux-lvm] Let's try again with the lvm mirror failure.
In-Reply-To: <49307CD4.9010705@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_56349_28536003.1227928852300"
References: <614f37be0811281309gb115861yea65f65979e48951@mail.gmail.com>
	<49307CD4.9010705@redhat.com>
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

------=_Part_56349_28536003.1227928852300
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Nov 28, 2008 at 6:20 PM, Jaroslav Stava <jstava@redhat.com> wrote:

> Hi,
>
> Gary Desrochers wrote:
>
>> I will try one more time. Can someone please tell me if it is possible to
>> recover a mirrored drive?  If not then why are so many people using mirrors
>> out there?
>>
> Some info:
> man vgreduce (see --removemissing)
> man lvm (see --partial activation)


I did try that after reading about it.  It removed both the one that was
missing and the one that was not missing before.  The partition is still
there and I can get it to be seen but now I have to somehow get back the
logical volume as well.  It no longer show up.  Well, it got reduced I
guess?


>
>
> Btw. it's a good idea to state your lvm version.
>
Sorry if I did not in my previous post.   Most of the lvm tools say:
  LVM version:     2.02.28 (2007-08-24)
  Library version: 1.02.22 (2007-08-21)
  Driver version:  4.12.0


>
>  > So how do you fix up from a crashed primary mirror?
>>
> To make the VG consistent again you use "vgreduce --removemissing VG".
> That will remove any LVs that were (even partially) on any missing PV.
> When mirror legs are lost this way then mirror get downconverted.
> You may want to use it with --test first, to see what you would loose.


I had used --test and it looked like the only loss was that LV.


>
> (And you may try --mirrorsonly, it should fail when anything except mirror
> legs would be lost. Without guarantee, depends on version.)


Oh, so what you explained above that must be why the LV is gone now?  So how
do I go from the LV that is now gone to an LV with only that one partition?
 I cannot even see the volume group anymore since that seems to be now,
"reduced"? :-)


>
>
>
>> As a second question, I know the extents and such.  Is there a way to copy
>> off the data into a non-lvm partition?  At this point I will even take that.
>>  I just want to get to the data.
>>
> Partial activation: "vgchange -ay -P". Doesn't make much sense
> if you only lost a mirror leg.
>
>
> Btw. when you need realtime response to your problem,
> there is an irc channel #lvm on freenode (ask question and wait).


No thank you, at the moment I don't need real time response.  Any response
is a help.  I had posted twice before this from last Saturday and this is my
only response.  I was not even sure I was getting through to the group since
I did not get any of the messages I posted previously.


>
>
> Regards,
> Jaroslav Stava
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


I do appreciate your response.  Any help you can give me I am grateful for.
Gary

------=_Part_56349_28536003.1227928852300
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div class="gmail_quote">On Fri, Nov 28, 2008 at 6:20 PM, Jaroslav Stava <span dir="ltr">&lt;<a href="mailto:jstava@redhat.com">jstava@redhat.com</a>&gt;</span> wrote:<br><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
Hi,<div class="Ih2E3d"><br>
<br>
Gary Desrochers wrote:<br>
<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
I will try one more time. Can someone please tell me if it is possible to recover a mirrored drive? &nbsp;If not then why are so many people using mirrors out there?<br>
</blockquote></div>
Some info:<br>
man vgreduce (see --removemissing)<br>
man lvm (see --partial activation)</blockquote><div><br></div><div>I did try that after reading about it. &nbsp;It removed both the one that was missing and the one that was not missing before. &nbsp;The partition is still there and I can get it to be seen but now I have to somehow get back the logical volume as well. &nbsp;It no longer show up. &nbsp;Well, it got reduced I guess?</div>
<div>&nbsp;</div><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;"><br>
<br>
Btw. it&#39;s a good idea to state your lvm version.<div class="Ih2E3d"></div></blockquote><div>Sorry if I did not in my previous post. &nbsp; Most of the lvm tools say:</div><div><div>&nbsp;&nbsp;LVM version: &nbsp; &nbsp; 2.02.28 (2007-08-24)</div>
<div>&nbsp;&nbsp;Library version: 1.02.22 (2007-08-21)</div><div>&nbsp;&nbsp;Driver version: &nbsp;4.12.0</div><div><br></div></div><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;"><div class="Ih2E3d">
<br>
<br>
<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
&gt; So how do you fix up from a crashed primary mirror?<br>
</blockquote></div>
To make the VG consistent again you use &quot;vgreduce --removemissing VG&quot;.<br>
That will remove any LVs that were (even partially) on any missing PV.<br>
When mirror legs are lost this way then mirror get downconverted.<br>
You may want to use it with --test first, to see what you would loose.</blockquote><div><br></div><div>I had used --test and it looked like the only loss was that LV.</div><div>&nbsp;</div><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
<br>
(And you may try --mirrorsonly, it should fail when anything except mirror<br>
legs would be lost. Without guarantee, depends on version.)</blockquote><div><br></div><div>Oh, so what you explained above that must be why the LV is gone now? &nbsp;So how do I go from the LV that is now gone to an LV with only that one partition? &nbsp;I cannot even see the volume group anymore since that seems to be now, &quot;reduced&quot;? :-)</div>
<div>&nbsp;</div><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;"><div class="Ih2E3d"><br>
<br>
<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
As a second question, I know the extents and such. &nbsp;Is there a way to copy off the data into a non-lvm partition? &nbsp;At this point I will even take that. &nbsp;I just want to get to the data.<br>
</blockquote></div>
Partial activation: &quot;vgchange -ay -P&quot;. Doesn&#39;t make much sense<br>
if you only lost a mirror leg.<br>
<br>
<br>
Btw. when you need realtime response to your problem,<br>
there is an irc channel #lvm on freenode (ask question and wait).</blockquote><div>&nbsp;</div><div>No thank you, at the moment I don&#39;t need real time response. &nbsp;Any response is a help. &nbsp;I had posted twice before this from last Saturday and this is my only response. &nbsp;I was not even sure I was getting through to the group since I did not get any of the messages I posted previously.</div>
<div>&nbsp;</div><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;"><br>
<br>
Regards,<br>
Jaroslav Stava<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href="mailto:linux-lvm@redhat.com" target="_blank">linux-lvm@redhat.com</a><br>
<a href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a></blockquote><div>&nbsp;</div></div>I do appreciate your response. &nbsp;Any help you can give me I am&nbsp;grateful&nbsp;for.<div>
<div><br></div><div>Gary</div></div>

------=_Part_56349_28536003.1227928852300--
