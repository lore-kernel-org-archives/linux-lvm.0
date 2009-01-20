Message-ID: <1c748a490901201015t2a075b93x4a7801fa0c269b07@mail.gmail.com>
Date: Tue, 20 Jan 2009 10:15:17 -0800
From: "Larry Dickson" <ldickson@cuttedge.com>
Subject: Re: [linux-lvm] 2GB limit
In-Reply-To: <4976024E.4030508@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_28766_18955035.1232475317800"
References: <4975932A.6090902@bortal.de> <4975B1A6.3090902@redhat.com>
	<1c748a490901200843i1cf9a6ean4ff622c59e75843@mail.gmail.com>
	<4976024E.4030508@redhat.com>
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
To: bmr@redhat.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>

------=_Part_28766_18955035.1232475317800
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 1/20/09, Bryn M. Reeves <bmr@redhat.com> wrote:
>
> Larry Dickson wrote:
>
>> We have considerable experience getting parted to work. Basically, the
>> distinction between primary and extended partitions is not needed, nor are
>> partition types. There are other subtle differences too. Very annoyingly,
>>
>
> Correct.
>
> SOME versions of parted interpret megabytes and even kilobytes (but not
>>
>
> Older versions, right?


1.6.19-1.EL had "standard" binary kB and mB.

1.8.1-17.el5 (CentOS 5.2), presumably a newer version, went to the
decimal-only kB and mB. There were a lot of other format changes in output,
too. We are on top of them, but decimal-only kB and mB is really a bad idea,
since it's inconsistent with all previous practice and also with sectors.

Larry Dickson

 sectors) as decimal only. For these you have to use unit B (bytes) to
>> regain
>> control. Experiment a little, to see what uses counting from 1 or counting
>> from 0, and what uses last-index or total-size, as these off-by-1 errors
>> can
>> be killer.
>>
>
> If you find problems like this with recent versions then please let us know
> via the parted mailing lists:
>
> http://www.gnu.org/software/parted/lists.shtml
>
> Ironing out the UI inconsistencies in parted is one of the areas that we
> are keen to improve at the moment so if you hit issues like this, we would
> very much like to hear about them.
>
> Regards,
> Bryn.
>
>
>

------=_Part_28766_18955035.1232475317800
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<br><br>
<div><span class="gmail_quote">On 1/20/09, <b class="gmail_sendername">Bryn M. Reeves</b> &lt;<a href="mailto:bmr@redhat.com">bmr@redhat.com</a>&gt; wrote:</span>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid"><span class="q">Larry Dickson wrote:<br>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">We have considerable experience getting parted to work. Basically, the<br>distinction between primary and extended partitions is not needed, nor are<br>
partition types. There are other subtle differences too. Very annoyingly,<br></blockquote><br></span>Correct.<span class="q"><br><br>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">SOME versions of parted interpret megabytes and even kilobytes (but not<br></blockquote><br></span>Older versions, right?</blockquote>

<div>&nbsp;</div>
<div>1.6.19-1.EL had &quot;standard&quot; binary kB and mB.</div>
<div>&nbsp;</div>
<div>1.8.1-17.el5 (CentOS 5.2), presumably a newer version, went to the decimal-only kB and mB. There were a lot of other format changes in output, too. We are on top of them, but decimal-only kB and mB is really a bad idea, since it&#39;s inconsistent with all previous practice and also with sectors.</div>

<div>&nbsp;</div>
<div>Larry Dickson</div><br>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid"><span class="q">
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">sectors) as decimal only. For these you have to use unit B (bytes) to regain<br>control. Experiment a little, to see what uses counting from 1 or counting<br>
from 0, and what uses last-index or total-size, as these off-by-1 errors can<br>be killer.<br></blockquote><br></span>If you find problems like this with recent versions then please let us know via the parted mailing lists:<br>
<br><a onclick="return top.js.OpenExtLink(window,event,this)" href="http://www.gnu.org/software/parted/lists.shtml" target="_blank">http://www.gnu.org/software/parted/lists.shtml</a><br><br>Ironing out the UI inconsistencies in parted is one of the areas that we are keen to improve at the moment so if you hit issues like this, we would very much like to hear about them.<br>
<br>Regards,<br><span class="sg">Bryn.<br><br><br></span></blockquote></div><br>

------=_Part_28766_18955035.1232475317800--
