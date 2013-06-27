In-Reply-To: <51C80174.1000005@redhat.com>
References: <16dd71d1.f00b.13f3e5336d3.Coremail.magazine.lihuiba@163.com>
	<51BB351E.4020707@alteeve.ca> <51C3F636.6030900@redhat.com>
	<285a5112.4df2.13f7172e2eb.Coremail.magazine.lihuiba@163.com>
	<51C80174.1000005@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----0WM6E5OTXV8O4ON99B1QTJNQUYQRMG"
From: Huiba Li <magazine.lihuiba@163.com>
Date: Thu, 27 Jun 2013 11:19:32 +0800
Message-ID: <2b5b9196-f426-4182-bb13-cee81e788632@email.android.com>
Subject: Re: [linux-lvm] LVM high availability
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>
Cc: Digimer <lists@alteeve.ca>, Marian Csontos <mcsontos@redhat.com>

------0WM6E5OTXV8O4ON99B1QTJNQUYQRMG
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Is there a release schedule？ I' looking forward to this feathure.

Zdenek Kabelac <zkabelac@redhat.com>写到：
>Dne 23.6.2013 16:32, lihuiba napsal(a):
>>
>>>>> 3) how about thin pool and volumes?
>>>>
>>>
>>>Thin-pool may be active on single-node only. In cluster only
>exclusive
>>>activation is allowed and can not be activated elsewhere even
>"read-only".
>>>
>>>It should work fine without cluster locking while read-only
>everywhere,
>>>except you can not enforce read-only on the pool. (There is a bug for
>that.)
>>>
>>>Attempting to write to pool active elsewhere, may render the pool's
>view
>>>corrupted on other nodes. So when writing to pool, you should at
>least
>>>deactivate the pool and all thin volumes on all other nodes, and
>>>reactivate afterwards.
>>
>> I don't think out why thin volumes can not be active on multiple
>nodes even read-only.
>>
>> It is intuitive that activating thin volumes in read-only mode will
>neither change it's own
>>
>> meta-data nor the pool's.
>>
>> If I "force" the thin volumes to be active by, for example, changing
>the source code,
>>
>> what errors will occur?
>
>
>lvm2 code currently doesn't support activation of all thin pool related
>LVs in 
>read-only mode - there is some work being done in this area - but still
>not 
>finished.
>
>Zdenek
>
>
>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 
抱歉暂时无法详细说明。这份邮件是使用安装有K-9 Mail的Android移动设备发送的。
------0WM6E5OTXV8O4ON99B1QTJNQUYQRMG
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html><head></head><body>Is there a release schedule？ I&#39; looking forward to this feathure.<br><br><div class="gmail_quote">Zdenek Kabelac &lt;zkabelac@redhat.com&gt;写到：<blockquote class="gmail_quote" style="margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<pre class="k9mail">Dne 23.6.2013 16:32, lihuiba napsal(a):<br /><blockquote class="gmail_quote" style="margin: 0pt 0pt 1ex 0.8ex; border-left: 1px solid #729fcf; padding-left: 1ex;"><br /><blockquote class="gmail_quote" style="margin: 0pt 0pt 1ex 0.8ex; border-left: 1px solid #ad7fa8; padding-left: 1ex;"><blockquote class="gmail_quote" style="margin: 0pt 0pt 1ex 0.8ex; border-left: 1px solid #8ae234; padding-left: 1ex;"><blockquote class="gmail_quote" style="margin: 0pt 0pt 1ex 0.8ex; border-left: 1px solid #fcaf3e; padding-left: 1ex;"> 3) how about thin pool and volumes?<br /></blockquote><br /></blockquote><br />Thin-pool may be active on single-node only. In cluster only exclusive<br />activation is allowed and can not be activated elsewhere even "read-only".<br /><br />It should work fine without cluster locking while read-only everywhere,<br />except you can not enforce read-only on the pool. (There is a bug for that.)<br /><br />Attempting to write to pool active else!
 where,
may render the pool's view<br />corrupted on other nodes. So when writing to pool, you should at least<br />deactivate the pool and all thin volumes on all other nodes, and<br />reactivate afterwards.<br /></blockquote><br /> I don't think out why thin volumes can not be active on multiple nodes even read-only.<br /><br /> It is intuitive that activating thin volumes in read-only mode will neither change it's own<br /><br /> meta-data nor the pool's.<br /><br /> If I "force" the thin volumes to be active by, for example, changing the source code,<br /><br /> what errors will occur?<br /></blockquote><br /><br />lvm2 code currently doesn't support activation of all thin pool related LVs in <br />read-only mode - there is some work being done in this area - but still not <br />finished.<br /><br />Zdenek<br /><br /><br /><br /><br /><hr /><br />linux-lvm mailing list<br />linux-lvm@redhat.com<br /><a
href="https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br />read the LVM HOW-TO at <a href="http://tldp.org/HOWTO/LVM-HOWTO">http://tldp.org/HOWTO/LVM-HOWTO</a>/<br /></pre></blockquote></div><br>
-- <br>
抱歉暂时无法详细说明。这份邮件是使用安装有K-9 Mail的Android移动设备发送的。</body></html>
------0WM6E5OTXV8O4ON99B1QTJNQUYQRMG--
