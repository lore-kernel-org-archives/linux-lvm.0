MIME-Version: 1.0
In-Reply-To: <537DA245.3090002@redhat.com>
References: <CAA-yaus6NpUkJYr3k9FSJ9KOiPQt2E+KdhK1D-dht7zgewAezQ@mail.gmail.com>
	<537AFE2A.50704@redhat.com>
	<CAA-yautpYCJ3GkHdDkovoMm+m-6JOo=2L9CUFdF+EY0HPdaLNw@mail.gmail.com>
	<537DA245.3090002@redhat.com>
From: David Wittman <dwittman@gmail.com>
Date: Thu, 22 May 2014 16:37:18 -0500
Message-ID: <CAA-yauvd2tD=JNyhz80Sf64-dCJjbEGXybczh68Qeh59Kmq_HQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary=bcaec508f4760812bf04fa03ecdf
Subject: Re: [linux-lvm] Setting readahead for Logical Volumes via udev
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
To: Marian Csontos <mcsontos@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

--bcaec508f4760812bf04fa03ecdf
Content-Type: text/plain; charset=UTF-8

Oh, well that makes more sense than using udev. I wasn't aware that -r
would set the readahead value persistently in the LV metadata. That makes
my life easy.

Thank you both.


On Thu, May 22, 2014 at 2:07 AM, Marian Csontos <mcsontos@redhat.com> wrote:

> On 05/20/2014 05:37 PM, David Wittman wrote:
>
>> Hey Peter,
>>
>> Thanks for the response. I've previously tried the "change" action, and
>> adding the specifier for the DM_ACTIVATION environment variable had no
>> effect. I'm also aware of the capability to set the readahead on a
>> per-volume basis, but I'm looking for a solution which handles setting
>> these values at boot time and/or volume creation time.
>>
>
> Hi David, may be I do not understand your requirements but the
> `--readahead` option does set the parameter at volume creation time and
> during boot time.
>
> Seeing you use star in the rules, looks like you want to change default
> when new LV is created: there is `readahead` setting in the lvm.conf file
> to do that.
>
> -- Martian
>
>

--bcaec508f4760812bf04fa03ecdf
Content-Type: text/html; charset=UTF-8

<div dir="ltr">Oh, well that makes more sense than using udev. I wasn&#39;t aware that -r would set the readahead value persistently in the LV metadata. That makes my life easy.<div><br></div><div>Thank you both.</div></div>

<div class="gmail_extra"><br><br><div class="gmail_quote">On Thu, May 22, 2014 at 2:07 AM, Marian Csontos <span dir="ltr">&lt;<a href="mailto:mcsontos@redhat.com" target="_blank">mcsontos@redhat.com</a>&gt;</span> wrote:<br>

<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class="">On 05/20/2014 05:37 PM, David Wittman wrote:<br>
<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Hey Peter,<br>
<br>
Thanks for the response. I&#39;ve previously tried the &quot;change&quot; action, and<br>
adding the specifier for the DM_ACTIVATION environment variable had no<br>
effect. I&#39;m also aware of the capability to set the readahead on a<br>
per-volume basis, but I&#39;m looking for a solution which handles setting<br>
these values at boot time and/or volume creation time.<br>
</blockquote>
<br></div>
Hi David, may be I do not understand your requirements but the `--readahead` option does set the parameter at volume creation time and during boot time.<br>
<br>
Seeing you use star in the rules, looks like you want to change default when new LV is created: there is `readahead` setting in the lvm.conf file to do that.<br>
<br>
-- Martian<br>
<br>
</blockquote></div><br></div>

--bcaec508f4760812bf04fa03ecdf--
