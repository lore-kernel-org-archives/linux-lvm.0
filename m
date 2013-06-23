Date: Sun, 23 Jun 2013 22:32:02 +0800 (CST)
From: lihuiba  <magazine.lihuiba@163.com>
In-Reply-To: <51C3F636.6030900@redhat.com>
References: <16dd71d1.f00b.13f3e5336d3.Coremail.magazine.lihuiba@163.com>
	<51BB351E.4020707@alteeve.ca> <51C3F636.6030900@redhat.com>
Content-Type: multipart/alternative; 
	boundary="----=_Part_74583_1079341080.1371997922027"
MIME-Version: 1.0
Message-ID: <285a5112.4df2.13f7172e2eb.Coremail.magazine.lihuiba@163.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Digimer <lists@alteeve.ca>, Marian Csontos <mcsontos@redhat.com>

------=_Part_74583_1079341080.1371997922027
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: 7bit

>>> 3) how about thin pool and volumes?
>>
>
>Thin-pool may be active on single-node only. In cluster only exclusive 
>activation is allowed and can not be activated elsewhere even "read-only".
>
>It should work fine without cluster locking while read-only everywhere, 
>except you can not enforce read-only on the pool. (There is a bug for that.)
>
>Attempting to write to pool active elsewhere, may render the pool's view 
>corrupted on other nodes. So when writing to pool, you should at least 
>deactivate the pool and all thin volumes on all other nodes, and 
>reactivate afterwards.

I don't think out why thin volumes can not be active on multiple nodes even read-only.It is intuitive that activating thin volumes in read-only mode will neither change it's ownmeta-data nor the pool's.If I "force" the thin volumes to be active by, for example, changing the source code, what errors will occur?



------=_Part_74583_1079341080.1371997922027
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: 7bit

<div style="line-height:1.7;color:#000000;font-size:14px;font-family:arial"><pre>

<pre>&gt;&gt;&gt;&nbsp;3)&nbsp;how&nbsp;about&nbsp;thin&nbsp;pool&nbsp;and&nbsp;volumes?
&gt;&gt;
&gt;
&gt;Thin-pool&nbsp;may&nbsp;be&nbsp;active&nbsp;on&nbsp;single-node&nbsp;only.&nbsp;In&nbsp;cluster&nbsp;only&nbsp;exclusive&nbsp;
&gt;activation&nbsp;is&nbsp;allowed&nbsp;and&nbsp;can&nbsp;not&nbsp;be&nbsp;activated&nbsp;elsewhere&nbsp;even&nbsp;"read-only".
&gt;
&gt;It&nbsp;should&nbsp;work&nbsp;fine&nbsp;without&nbsp;cluster&nbsp;locking&nbsp;while&nbsp;read-only&nbsp;everywhere,&nbsp;
&gt;except&nbsp;you&nbsp;can&nbsp;not&nbsp;enforce&nbsp;read-only&nbsp;on&nbsp;the&nbsp;pool.&nbsp;(There&nbsp;is&nbsp;a&nbsp;bug&nbsp;for&nbsp;that.)
&gt;
&gt;Attempting&nbsp;to&nbsp;write&nbsp;to&nbsp;pool&nbsp;active&nbsp;elsewhere,&nbsp;may&nbsp;render&nbsp;the&nbsp;pool's&nbsp;view&nbsp;
&gt;corrupted&nbsp;on&nbsp;other&nbsp;nodes.&nbsp;So&nbsp;when&nbsp;writing&nbsp;to&nbsp;pool,&nbsp;you&nbsp;should&nbsp;at&nbsp;least&nbsp;
&gt;deactivate&nbsp;the&nbsp;pool&nbsp;and&nbsp;all&nbsp;thin&nbsp;volumes&nbsp;on&nbsp;all&nbsp;other&nbsp;nodes,&nbsp;and&nbsp;
&gt;reactivate&nbsp;afterwards.

</pre><pre>I don't think out why thin volumes can not be active on multiple nodes even read-only.</pre><pre>It is intuitive that activating thin volumes in read-only mode will neither change it's own</pre><pre>meta-data nor the pool's.</pre><pre><pre>If I "force" the thin volumes to be active by, for example, changing the source code, </pre><pre>what errors will occur?</pre><pre><br></pre><br class="Apple-interchange-newline"></pre>
</pre></div>
------=_Part_74583_1079341080.1371997922027--
