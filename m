Message-ID: <3DA46D8B.5010808@mvista.com>
From: Steven Dake <sdake@mvista.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Broken compile scripts in LVM
References: <3DA1C82F.5080406@mvista.com> <20021009125221.A23965@sistina.com>
Content-Type: multipart/alternative;
 boundary="------------030000000209030305040903"
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Wed Oct  9 13:40:32 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--------------030000000209030305040903
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Heinz,
Thanks Jeremy had asked me to forward the patch on.  I guess he also did 
it himself

-steve

Heinz J . Mauelshagen wrote:

>Steven,
>
>I have changed that in CVS (Branch: LVM_BRANCH_1-0) a couple of days ago
>and announced that on lvm-devel (the list for patches and development
>discussions). Jeremy A. Puhlman pointed it out on October 4th already.
>
>
>On Mon, Oct 07, 2002 at 10:45:19AM -0700, Steven Dake wrote:
>  
>
>>Folks,
>>
>>Some of the scripts use echo "string" > /dev/stderr when instead they 
>>should be using echo "string" >&2.  I have attached a patch that fixes 
>>this problem.  The result is that in automated builds, the stdout gets 
>>stomped if you use the first technique (resulting in loss of logging data).
>>
>>Thanks.
>>
>>-steve
>>    
>>
>
>  
>
>>diff -u3 lvm-1.0.5/scripts/iopver lvm-1.0.5-fixed/scripts/iopver
>>--- lvm-1.0.5/scripts/iopver	Tue Jan 22 06:54:13 2002
>>+++ lvm-1.0.5-fixed/scripts/iopver	Thu Oct  3 19:46:40 2002
>>@@ -48,21 +48,19 @@
>> 	sed -e 's/.*LVM_LIB_IOP_VERSION[[:space:]]*\([[:digit:]]*\).*/\1/'`;
>> 
>> if [ -z "$ver1" ]; then
>>-	echo "Error: iopver can't determine the IOP version from $file1" > \
>>    
>>
><SNIP>
>  
>
>>-	echo "$new not found" > /dev/stderr
>>+	echo "$new not found" >&2
>> 	exit 2;
>> fi
>> 
>>    
>>
>
>
>  
>

--------------030000000209030305040903
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <title></title>
</head>
<body>
Heinz,<br>
Thanks Jeremy had asked me to forward the patch on. &nbsp;I guess he also did
it himself<br>
<br>
-steve<br>
<br>
Heinz J . Mauelshagen wrote:<br>
<blockquote type="cite" cite="mid20021009125221.A23965@sistina.com">
  <pre wrap="">Steven,

I have changed that in CVS (Branch: LVM_BRANCH_1-0) a couple of days ago
and announced that on lvm-devel (the list for patches and development
discussions). Jeremy A. Puhlman pointed it out on October 4th already.


On Mon, Oct 07, 2002 at 10:45:19AM -0700, Steven Dake wrote:
  </pre>
  <blockquote type="cite">
    <pre wrap="">Folks,

Some of the scripts use echo "string" &gt; /dev/stderr when instead they 
should be using echo "string" &gt;&amp;2.  I have attached a patch that fixes 
this problem.  The result is that in automated builds, the stdout gets 
stomped if you use the first technique (resulting in loss of logging data).

Thanks.

-steve
    </pre>
  </blockquote>
  <pre wrap=""><!---->
  </pre>
  <blockquote type="cite">
    <pre wrap="">diff -u3 lvm-1.0.5/scripts/iopver lvm-1.0.5-fixed/scripts/iopver
--- lvm-1.0.5/scripts/iopver	Tue Jan 22 06:54:13 2002
+++ lvm-1.0.5-fixed/scripts/iopver	Thu Oct  3 19:46:40 2002
@@ -48,21 +48,19 @@
 	sed -e 's/.*LVM_LIB_IOP_VERSION[[:space:]]*\([[:digit:]]*\).*/\1/'`;
 
 if [ -z "$ver1" ]; then
-	echo "Error: iopver can't determine the IOP version from $file1" &gt; \
    </pre>
  </blockquote>
  <pre wrap=""><!---->&lt;SNIP&gt;
  </pre>
  <blockquote type="cite">
    <pre wrap="">-	echo "$new not found" &gt; /dev/stderr
+	echo "$new not found" &gt;&amp;2
 	exit 2;
 fi
 
    </pre>
  </blockquote>
  <pre wrap=""><!---->

  </pre>
</blockquote>
</body>
</html>

--------------030000000209030305040903--
