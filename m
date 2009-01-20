Message-ID: <1c748a490901200843i1cf9a6ean4ff622c59e75843@mail.gmail.com>
Date: Tue, 20 Jan 2009 08:43:49 -0800
From: "Larry Dickson" <ldickson@cuttedge.com>
Subject: Re: [linux-lvm] 2GB limit
In-Reply-To: <4975B1A6.3090902@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_27963_17253580.1232469829949"
References: <4975932A.6090902@bortal.de> <4975B1A6.3090902@redhat.com>
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
To: bmr@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

------=_Part_27963_17253580.1232469829949
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

We have considerable experience getting parted to work. Basically, the
distinction between primary and extended partitions is not needed, nor are
partition types. There are other subtle differences too. Very annoyingly,
SOME versions of parted interpret megabytes and even kilobytes (but not
sectors) as decimal only. For these you have to use unit B (bytes) to regain
control. Experiment a little, to see what uses counting from 1 or counting
from 0, and what uses last-index or total-size, as these off-by-1 errors can
be killer.

Larry Dickson
Cutting Edge Networked Storage

On 1/20/09, Bryn M. Reeves <bmr@redhat.com> wrote:
>
> ml@bortal.de wrote:
>
>> Hello List,
>>
>> i have a 32bit Linux box with a 3Ware Raidcontroller and 4x 1TB disks.
>> After installing Debian Etch i had to find out that i am running into some
>> limits.
>>
>> Is there a way to use a Partition >2GB with 32Linux/LVM?
>>
>
> You mean 2TiB? Partitions greater than 2GiB (but less than 2TiB) should
> "just work".
>
> If that's the case, you need to use a real partition table as the
> traditional MSDOS partitioning scheme is limited to 2TiB partitions or
> devices (it can't address disk locations beyond this point).
>
> The GPT partition format is widely used on ia64 and does not have this
> limitation. It's supported by parted and most distribution installers (even
> for non-Itanium systems).
>
> Regards,
> Bryn.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_27963_17253580.1232469829949
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>We have considerable experience getting parted to work. Basically, the distinction between primary and extended partitions is not needed, nor are partition&nbsp;types. There are other subtle differences too.&nbsp;Very annoyingly, SOME versions of parted interpret megabytes and even kilobytes (but not sectors) as decimal only. For these&nbsp;you have to use unit B (bytes) to regain control.&nbsp;Experiment a little, to see what uses counting from 1 or counting from 0, and what uses last-index or total-size, as these off-by-1 errors can be killer.</div>

<div>&nbsp;</div>
<div>Larry Dickson<br>Cutting Edge Networked Storage<br>&nbsp;</div>
<div><span class="gmail_quote">On 1/20/09, <b class="gmail_sendername">Bryn M. Reeves</b> &lt;<a href="mailto:bmr@redhat.com">bmr@redhat.com</a>&gt; wrote:</span>
<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid"><span class="q"><a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:ml@bortal.de" target="_blank">ml@bortal.de</a> wrote:<br>

<blockquote class="gmail_quote" style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">Hello List,<br><br>i have a 32bit Linux box with a 3Ware Raidcontroller and 4x 1TB disks. After installing Debian Etch i had to find out that i am running into some limits.<br>
<br>Is there a way to use a Partition &gt;2GB with 32Linux/LVM?<br></blockquote><br></span>You mean 2TiB? Partitions greater than 2GiB (but less than 2TiB) should &quot;just work&quot;.<br><br>If that&#39;s the case, you need to use a real partition table as the traditional MSDOS partitioning scheme is limited to 2TiB partitions or devices (it can&#39;t address disk locations beyond this point).<br>
<br>The GPT partition format is widely used on ia64 and does not have this limitation. It&#39;s supported by parted and most distribution installers (even for non-Itanium systems).<br><br>Regards,<br><span class="sg">Bryn.</span> 
<div><span class="e" id="q_11ef3be5f8ab5395_3"><br><br>_______________________________________________<br>linux-lvm mailing list<br><a onclick="return top.js.OpenExtLink(window,event,this)" href="mailto:linux-lvm@redhat.com" target="_blank">linux-lvm@redhat.com</a><br>
<a onclick="return top.js.OpenExtLink(window,event,this)" href="https://www.redhat.com/mailman/listinfo/linux-lvm" target="_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a onclick="return top.js.OpenExtLink(window,event,this)" href="http://tldp.org/HOWTO/LVM-HOWTO/" target="_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</span></div></blockquote></div><br>

------=_Part_27963_17253580.1232469829949--
